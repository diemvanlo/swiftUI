//
//  ContentView.swift
//  textField datepicker toggle stepper link section
//
//  Created by Mac on 30/08/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var birthDay = Date()
    @State private var shouldSendNews = false
    @State private var numberOfLikes = 1
    
    var body: some View {
        NavigationView {
            Form {
                Section("Personal information") {
                    TextField("First name", text: $firstName)
                    TextField("Last name", text: $lastName)
                    DatePicker("Birthday", selection: $birthDay)
                }
                
                Section("Actions") {
                    Toggle("Send news letter", isOn: $shouldSendNews)
                        .toggleStyle(SwitchToggleStyle(tint: .red))
                    Stepper("Number of likes", value: $numberOfLikes, in: 0...10)
                    Link("Term and policy", destination: URL(string: "https://coinmarketcap.com/currencies/numeraire/")!)
                }
            }
            .navigationTitle("Account")
            .onTapGesture {
                hideKeyBoard()
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        hideKeyBoard()
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                    
                    Button("Save", action: saveUser)
                }
            }
        }
        .tint(.red)
    }
    
    func saveUser() {
        print("mine save user")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyBoard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
