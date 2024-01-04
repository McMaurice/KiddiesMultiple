//
//  landingpage.swift
//  eduentertainment
//
//  Created by Macmaurice Osuji on 3/12/23.
//

import SwiftUI

struct landingpage: View {
    @ObservedObject var user: Parameter
    @Environment(\.dismiss) var dismiss
    @State private var score = 0
    @State private var displayMassage = ""
    @State private var showAlert = false
    
    @State private var colors = ["yellow","green","blue","red"]
    @State private var blurAmount = 0.0
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("first")
                    .resizable()
                   .ignoresSafeArea()
                VStack {
                        Spacer()
                        Text("What is \(user.table) X \(user.ans / user.table)")
                            .font(.largeTitle.weight(.bold))
                            .foregroundColor(.red)
                    
                    VStack {
                        ForEach(0..<4) {
                            num in Button {
                                tracking(num)
                            }label: {
                                ZStack {
                                    Image("\(colors[num])")
                                        .renderingMode(.original)
                                        .clipShape(Circle())
                                        .shadow(color: .black, radius: 5)
                                        .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                                        .blur(radius: num != user.options.firstIndex(of: "\(user.ans)") ? blurAmount: 0)
                                    Text("\(user.options[num])")
                                        .foregroundColor(.black)
                                        .font(.largeTitle.weight(.heavy))
                                        .fontDesign(.rounded)
                                        .blur(radius: num != user.options.firstIndex(of: "\(user.ans)") ? blurAmount: 0)
                                        .padding(30)
                                }
                            }
                        }
                    }
                    Spacer()
                    Text("You have \(user.numOfQuests) questions remaining")
                        .font(.headline.weight(.semibold))
                    Spacer()
                    
                    
                }
                .alert(displayMassage, isPresented: $showAlert) {
                    Button("Continue", action: addOption)
                } message: {
                    if user.numOfQuests == 0 {
                        Text("GAME OVER❗️ You scored \(score) points")
                    }
                }
            }
        }
    }///
    func tracking(_ num: Int) {
        if num == user.options.firstIndex(of: "\(user.ans)") {
            score += 1
            displayMassage = "Correct!😀"
            withAnimation {
                blurAmount += 3
            }
        } else {
            displayMassage = "Wrong!😣"
        }
        
        user.numOfQuests -= 1
        showAlert = true
    }
    
    func addOption() {
        user.ans = user.table * Int.random(in: 1...12)
        let x = String(user.ans)
        let a = user.table
        let b = user.table * 12
        let ansLocation = Int.random(in: 0...3)
        
        var r1 = Int.random(in: a...b)
        if r1 == user.ans {
            r1 -= 2
        }
        let r = String(r1)
        
        var y1 = Int.random(in: a...b)
        if y1 == user.ans || y1 == r1 {
            y1 += 2
        }
        let y = String(y1)
        
        var z1 = Int.random(in: a...b)
        if z1 == user.ans || z1 == r1 || z1 == y1 {
            z1 += 2
        }
        let z = String(z1)
        user.options.removeAll()
        user.options.append(r)
        user.options.append(y)
        user.options.append(z)
        user.options.insert(x, at: ansLocation)
        
        if user.numOfQuests == 0 {
            dismiss()
        }
        colors = ["yellow","green","blue","red"].shuffled()
        blurAmount = 0.0
    }
}///

struct landingpage_Previews: PreviewProvider {
    static var previews: some View {
        landingpage(user: Parameter())
    }
}
