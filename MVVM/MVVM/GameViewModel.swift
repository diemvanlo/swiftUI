//
//  GameViewModel.swift
//  MVVM
//
//  Created by Mac on 26/08/2023.
//

import Foundation
import SwiftUI

final class GameViewModel: ObservableObject {
    let columns: [GridItem] = [.init(.flexible()),
                               .init(.flexible()),
                               .init(.flexible())]
    
    @Published var moves: [Move?] = Array(repeating: nil, count: 9)
    @Published var currentPlayer = Player.player
    @Published var alertItem: AlertItem?
    @Published var isShowAlert: Bool = false
    
    private let winPatterns: Set<Set<Int>> = [
        [0, 1, 2], [0, 3, 6], [0, 4, 8],  [1, 4, 7], [2, 5, 8], [3, 4, 5], [6, 7, 8], [2, 4, 6]
    ]
    
    func reset() {
        moves = Array(repeating: nil, count: 9)
        currentPlayer = .player
    }
    
    func processPlayerMove(in postion: Int) {
        guard isSquareAvailable(for: postion) else { return }
        progressMove(player: .player, index: postion)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
            self.progressMove(player: .computer)
        }
    }
    
    func progressMove(player: Player, index: Int? = nil) {
        guard let ramdomComputerMove = ramdomComputerMove else {
            isShowAlert = true
            return
        }
        let moveIndex: Int = index ?? ramdomComputerMove
        moves[moveIndex] = Move(player: player, boardIndex: moveIndex)
        let playerCondition = checkWinCondition(for: player)
        
        guard playerCondition != .win else {
            isShowAlert = true
            return
        }
        currentPlayer = player == . player ? .computer : .player
        
    }
    
    func isSquareAvailable(for index: Int) -> Bool {
        return moves[index] == nil
    }
    
    func checkWinCondition(for player: Player) -> GameCondition {
        var isWin = false
        winPatterns.forEach { winRow in
            if winRow.allSatisfy({ moves[$0]?.player == player }) {
                isWin = true
            }
        }
        
        guard !isWin else {
            return .win
        }
        
        return moves.compactMap({ $0 }).count == 9 ? .draw : .none
    }
    
    var ramdomComputerMove: Int? {
        // if AI can win, then win
        if let moveIndex = bestMove(for: .computer)?.first(where: { moves[$0]?.player == nil }) {
            return moveIndex
        }
        
        // if AI can block, then block
        if let moveIndex = bestMove(for: .player)?.first(where: { moves[$0]?.player == nil }) {
            return moveIndex
        }
        
        // if AI do neither, take the middle square
        if moves[4]?.player == nil {
            return 4
        }
        
        let availabelMoves = moves.indices.filter { moves[$0] == nil }
        return availabelMoves.randomElement()
    }
    
    func bestMove(for player: Player) -> Set<Int>? {
        return winPatterns.first { winRow in
            guard winRow.filter({ moves[$0]?.player == player }).count == 2,
                  winRow.contains(where: { moves[$0]?.player == nil }) else {
                return false
            }
            
            return true
        }
    }
}
