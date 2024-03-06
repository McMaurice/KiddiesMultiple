//
//  eduentertainmentApp.swift
//  eduentertainment
//
//  Created by Macmaurice Osuji on 2/27/23.
//

import SwiftUI

@main
struct eduentertainmentApp: App {
    @StateObject var parameters: ParameterViewModels = ParameterViewModels()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(parameters)
        }
    }
}
