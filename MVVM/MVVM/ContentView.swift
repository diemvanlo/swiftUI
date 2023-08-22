//
//  ContentView.swift
//  MVVM
//
//  Created by Mac on 21/08/2023.
//

import SwiftUI

struct ContentView: View {
    let columns: [GridItem] = [.init(.flexible()),
                               .init(.flexible()),
                               .init(.flexible())]
    
    @State private var moves: [Move?] = Array(repeating: nil, count: 9)
    @State private var currentPlayer = Player.player
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 5) {
                Spacer()
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0..<9) { i in
                        ZStack {
                            Circle()
                                .foregroundColor(.red.opacity(0.5))
                                .frame(height: geometry.size.width / 3 - 15)
                            
                            Image(systemName: moves[i]?.indicator ?? "")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                        }
                        .onTapGesture {
                            guard isSquareAvailable(for: i) else { return }
                            moves[i] = Move(player: currentPlayer, boardIndex: i)
                            currentPlayer = .computer
                            
                            // check for win condition
                            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
                                guard let ramdomComputerMove = self.ramdomComputerMove else { return }
                                moves[ramdomComputerMove] = Move(player: currentPlayer, boardIndex: ramdomComputerMove)
                                currentPlayer = .player
                            }
                        }
                    }
                }
                Spacer()
                Button {
                    moves = Array(repeating: nil, count: 9)
                    currentPlayer = .player
                } label: {
                    Text("Reset")
                }
                Spacer()
            }
            .padding()
        }
    }
    
    func isSquareAvailable(for index: Int) -> Bool {
        return moves[index] == nil
    }
    
    var ramdomComputerMove: Int? {
        let availabelMoves = moves.indices.filter { moves[$0] == nil }
        return availabelMoves.randomElement()
    }
}

enum Player {
    case computer, player
}

struct Move {
    let player: Player
    let boardIndex: Int
    
    var indicator: String {
        return player == .player ? "circle" : "xmark"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
