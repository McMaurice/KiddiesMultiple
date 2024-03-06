//
//  LevelSelectorView.swift
//  eduentertainment
//
//  Created by Macmaurice Osuji on 3/6/24.
//

import SwiftUI

struct LevelSelectorView: View {
    @EnvironmentObject var parameters: ParameterViewModels
    let quests = [5,10,15]
    
    var body: some View {
        VStack {
            Text("How many qustions can you answer ?")
                .font(.headline.bold())
            Picker("Number of questions", selection: $parameters.numOfQuests) {
                ForEach(quests, id: \.self) {
                    Text("\($0) Questions")
                }
            }
            .pickerStyle(.segmented)
            .padding()
            Spacer()
        }
    }
}

struct LevelSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        LevelSelectorView()
            .environmentObject(ParameterViewModels())
    }
}
