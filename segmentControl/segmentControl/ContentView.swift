//
//  ContentView.swift
//  segmentControl
//
//  Created by Mac on 25/09/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedSide: SideOfTheForce = .dark
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Choose a side", selection: $selectedSide) {
                    ForEach(SideOfTheForce.allCases, id: \.self) { content in
                        Text(content.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Spacer()
                ChosenHeroView(selectedSide: selectedSide)
                Spacer()
            }
            .navigationTitle("Choose a Side")
        }
    }
}

enum SideOfTheForce: String, CaseIterable {
    case ligth = "Light"
    case grey = "Grey"
    case dark = "Dark"
}

struct ChosenHeroView: View {
    var selectedSide: SideOfTheForce
    
    var body: some View {
        switch selectedSide {
        case .ligth:
            HeroImageView(heroName: "anakin")
        case .grey:
            HeroImageView(heroName: "ahsoka")
        case .dark:
            HeroImageView(heroName: "vader")
        }
    }
}

struct HeroImageView: View {
    var heroName: String
    
    var body: some View {
        Image(heroName)
            .resizable()
            .frame(width: 250, height: 400)
            .shadow(color: .white, radius: 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
