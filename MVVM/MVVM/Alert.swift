//
//  Alert.swift
//  MVVM
//
//  Created by Mac on 25/08/2023.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
    
    static func createAlert(title: String, message: String, buttonText: String) -> AlertItem {
        let textTitle = Text(title)
        let textMessage = Text(message)
        let button = Text(buttonText)
        
        return AlertItem(title: textTitle, message: textMessage, buttonTitle: button)
    }
}

extension GameCondition {
    func alertMessage(player: Player) -> AlertItem? {
        switch self {
        case .win:
            if player == .player {
                return AlertItem.createAlert(title: "GGWP", message: "You beat the game", buttonText: "once more")
            } else {
                return AlertItem.createAlert(title: "Oops", message: "Do not give up", buttonText: "Again!")
            }
        case .draw:
            return AlertItem.createAlert(title: "Draw", message: "What wonderful match", buttonText: "Try again")
        case .none:
            return nil
        }
    }
}
