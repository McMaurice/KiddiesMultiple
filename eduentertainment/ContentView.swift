//
//  ContentView.swift
//  eduentertainment
//
//  Created by Macmaurice Osuji on 2/27/23.
//

import SwiftUI

class Parameter: ObservableObject {
    @Published var numOfQuests = 5
    @Published var table = 2
    @Published var options = ["1","2","3","4"]
    @Published var ans = 0
}


struct ContentView: View {
    @StateObject var values = Parameter()
    @State private var nextPage = false
    @State private var generataed = []
    
    let tables = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    let quests = [5,10,15]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.cyan)
                    .ignoresSafeArea()
                VStack {
                    Section {
                        Spacer()
                        Spacer ()
                        Text("Select a Multiplication table")
                        Picker("Select a Multiplication table", selection: $values.table) {
                            ForEach(tables, id: \.self) {
                                Text("\($0) times table")
                            }
                        }

                        .pickerStyle(.menu)
                        Text("How many qustions can you answer ?")
                        Picker("Number of questions", selection: $values.numOfQuests) {
                            ForEach(quests, id: \.self) {
                                Text("\($0) Questions")
                            }
                        }
                        .pickerStyle(.segmented)
                        Spacer()
                    }
                    
                }
                .navigationTitle("Kiddies Multiple")
                .toolbar {
                    Button {
                        addOption()
                        nextPage = true
                    } label: {
                        Text("Start")
                            .font(.title)
                    }
                }
                .sheet(isPresented: $nextPage) {
                    landingpage(user: values)
                }
            }
            
        }
    }///
    func addOption() {
        values.ans = values.table * Int.random(in: 1...12)
        let x = String(values.ans)
        let a = values.table
        let b = values.table * 12
        let ansLocation = Int.random(in: 0...3)
        
        var r1 = Int.random(in: a...b)
        if r1 == values.ans {
            r1 -= 2
        }
        let r = String(r1)
        
        var y1 = Int.random(in: a...b)
        if y1 == values.ans || y1 == r1 {
            y1 += 2
        }
        let y = String(y1)
        
        var z1 = Int.random(in: a...b)
        if z1 == values.ans || z1 == r1 || z1 == y1 {
            z1 += 2
        }
        let z = String(z1)
        values.options.removeAll()
        values.options.append(r)
        values.options.append(y)
        values.options.append(z)
        values.options.insert(x, at: ansLocation)

    }
}///

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
