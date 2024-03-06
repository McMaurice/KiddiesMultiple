//
//  ContentView.swift
//  eduentertainment
//
//  Created by Macmaurice Osuji on 2/27/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var parameters: ParameterViewModels
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    Text("Kiddies Multiple")
                        .font(.system(size: 40, weight: .semibold, design: .rounded))
                        .padding(.top, geometry.safeAreaInsets.top + 20)
                    
                    Image("baby")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width * 0.8)
                        .padding(.top, 20)
                    
                    TablesSelectorView()
                        .padding(.horizontal, 20)
                    
                    Spacer()
                    
                    LevelSelectorView()
                    
                    StartButtonView()
                        .padding(.bottom, geometry.safeAreaInsets.bottom + 20)
                        .onTapGesture {
                            parameters.addOption()
                        }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
        }
        .environmentObject(ParameterViewModels())
    }
}





