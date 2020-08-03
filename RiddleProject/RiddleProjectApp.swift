//
//  RiddleProjectApp.swift
//  RiddleProject
//
//  Created by Roger Tan on 03/08/2020.
//

import SwiftUI
import CommonLibrary

@main
struct RiddleProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(riddle: Riddle.random())
        }
    }
}
