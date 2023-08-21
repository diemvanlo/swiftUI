//
//  ContentView.swift
//  MVVM
//
//  Created by Mac on 21/08/2023.
//

import SwiftUI

let columns: [GridItem] = [.init(.flexible()),
                           .init(.flexible()),
                           .init(.flexible())]

struct ContentView: View {
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(0..<9) { i in
                Circle()
                    .foregroundColor(.red)
                    .frame(height: 80)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
