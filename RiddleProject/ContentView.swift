//
//  ContentView.swift
//  RiddleProject
//
//  Created by Roger Tan on 03/08/2020.
//

import SwiftUI

import CommonLibrary

struct ContentView: View {
    @State var riddle: CommonLibrary.Riddle
    @State var isAnswerHidden: Bool = true
    
    var body: some View {
        ZStack {
            Color(.primaryBackground)
                .ignoresSafeArea()
            VStack(spacing: 20) {
                HStack {
                    Text("🤔")
                        .font(.system(size: 50))
                    Text(riddle.text)
                        .foregroundColor(Color(.primaryColor))
                }.padding()
                Button("Tap to revel the answer") {
                    isAnswerHidden = false
                }
                Text(riddle.answer)
                    .foregroundColor(Color(.primaryText))
                    .opacity(isAnswerHidden ? 0 : 1)
            }
        }
        .onOpenURL(perform: { url in
            let id = url.absoluteString.replacingOccurrences(of: "riddle://", with: "")
            guard let riddle = Riddle.list.first(where: { $0.id == UInt(id) }) else {
                return
            }
            self.updateRiddle(with: riddle)
        })
    }
    
    func updateRiddle(with riddle: Riddle) {
        self.riddle = riddle
        self.isAnswerHidden = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(riddle: CommonLibrary.Riddle.list.first!)
    }
}
