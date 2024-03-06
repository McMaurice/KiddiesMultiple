//
//  landingpage.swift
//  eduentertainment
//
//  Created by Macmaurice Osuji on 3/12/23.
//

import SwiftUI

struct LandingView: View {
    @EnvironmentObject var parameters: ParameterViewModels
    @Environment(\.dismiss) var dismiss
    
    @State private var score = 0
    @State private var displayMassage = ""
    @State private var showAlert = false
    
    @State var colors = ["yellow","green","blue","red"]
    @State private var blurAmount = 0.0
    
    
    var body: some View {
        ZStack {
            Image("first")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            VStack {
                    Text("What is \(parameters.table) X \(parameters.ans / parameters.table)")
                        .font(.largeTitle.weight(.bold))
                        .foregroundColor(.red)
                
                OptionsView(blurAmount: $blurAmount, colors: $colors, tracking: tracking)
                
                VStack(spacing: 5) {
                    Text("You have")
                    Text("\(parameters.numOfQuests) questions")
                    Text("remaining")
                }
                .font(.system(size: 20, weight: .semibold, design: .monospaced))
                .padding(.top, 40)
                
            }
            .alert(displayMassage, isPresented: $showAlert) {
                Button("Continue") {
                    parameters.addOption()
                    if parameters.numOfQuests == 0 {
                        dismiss()
                    }
                    colors.shuffle()
                    blurAmount = 0.0
                }
            } message: {
                if parameters.numOfQuests == 0 {
                    Text("GAME OVER❗️ You scored \(score) points")
                        
                }
            }
        }
    }
    
    func tracking(num: Int) {
        if num == parameters.options.firstIndex(of: "\(parameters.ans)") {
            score += 1
            displayMassage = "Correct!😀"
            withAnimation {
                blurAmount += 3
            }
        } else {
            displayMassage = "Wrong!😣"
        }
        
        parameters.numOfQuests -= 1
        showAlert = true
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LandingView()
        }
        .environmentObject(ParameterViewModels())
    }
}


