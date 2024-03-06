//
//  TablesSelectorView.swift
//  eduentertainment
//
//  Created by Macmaurice Osuji on 3/6/24.
//

import SwiftUI

struct TablesSelectorView: View {
    @EnvironmentObject var parameters: ParameterViewModels
    let tables = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    
    var body: some View {
        VStack {
            Text("Select a Multiplication table")
                .font(.headline.bold())
            Picker("Select a Multiplication table", selection: $parameters.table) {
                ForEach(tables, id: \.self) {
                    Text("\($0) times table")
                }
            }
        }
        .padding(.bottom)
        .pickerStyle(.menu)
    }
}

struct TablesSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        TablesSelectorView()
            .environmentObject(ParameterViewModels())
    }
}
