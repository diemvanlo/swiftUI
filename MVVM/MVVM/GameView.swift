//
//  GameView.swift
//  MVVM
//
//  Created by Mac on 21/08/2023.
//

import SwiftUI

enum GameCondition {
    case win, draw, none
}

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 5) {
                Spacer()
                LazyVGrid(columns: viewModel.columns, spacing: 20) {
                    ForEach(0..<9) { i in
                        ZStack {
                            GameSquareCircleView(proxy: geometry)
                            
                            Image(systemName: viewModel.moves[i]?.indicator ?? "")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                        }
                        .onTapGesture {
                            viewModel.processPlayerMove(in: i)
                        }
                    }
                }
                Spacer()
                Button {
                    viewModel.reset()
                } label: {
                    Text("Reset")
                }
                Spacer()
            }
            .padding()
            .alert(Text("What's up"), isPresented: $viewModel.isShowAlert) {
                Button("Try again") { viewModel.reset() }
            } message: {
                Text("This game is over")
            }
        }
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
        GameView()
    }
}

struct GameSquareCircleView: View {
    var proxy: GeometryProxy
    
    var body: some View {
        Circle()
            .foregroundColor(.red.opacity(0.5))
            .frame(height: proxy.size.width / 3 - 15)
    }
}
