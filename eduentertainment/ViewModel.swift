//
//  ViewModel.swift
//  eduentertainment
//
//  Created by Macmaurice Osuji on 3/6/24.
//

import Foundation

class ParameterViewModels: ObservableObject {
    @Published var numOfQuests = 5
    @Published var table = 2
    @Published var options = ["1","2","3","4"]
    @Published var ans = 0
    
    func addOption() {
        ans = table * Int.random(in: 1...12)
        let x = String(ans)
        let a = table
        let b = table * 12
        let ansLocation = Int.random(in: 0...3)
        
        var r1 = Int.random(in: a...b)
        if r1 == ans {
            r1 -= 2
        }
        let r = String(r1)
        
        var y1 = Int.random(in: a...b)
        if y1 == ans || y1 == r1 {
            y1 += 2
        }
        let y = String(y1)
        
        var z1 = Int.random(in: a...b)
        if z1 == ans || z1 == r1 || z1 == y1 {
            z1 += 2
        }
        let z = String(z1)
        options.removeAll()
        options.append(r)
        options.append(y)
        options.append(z)
        options.insert(x, at: ansLocation)

    }
}
