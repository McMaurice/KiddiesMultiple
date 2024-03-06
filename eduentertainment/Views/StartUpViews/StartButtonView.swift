//
//  StartButtonView.swift
//  eduentertainment
//
//  Created by Macmaurice Osuji on 3/6/24.
//

import SwiftUI

struct StartButtonView: View {
    @EnvironmentObject var parameters: ParameterViewModels
    
    @State private var animate = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        VStack {
            NavigationLink {
                LandingView()
            } label: {
                Text("Start 🙌")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(animate ? secondaryAccentColor : Color.accentColor)
                    .cornerRadius(15)
                    .padding()
            }
            .padding(.horizontal, animate ? 30 : 40)
            .shadow(color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: animate ? 20 : 10,
                    x: 0,
                    y: animate ? 30 : 20)
            .scaleEffect(animate ? 1.1 : 1.0)
            .offset(y: animate ? -6 : 0)
            
        }
        .onAppear (perform: addAnimation)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 1.0)
                    .repeatForever()
            
            ) {
                animate.toggle()
            }
        }
    }
}

struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView()
            .environmentObject(ParameterViewModels())
    }
}
