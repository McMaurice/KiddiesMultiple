//
//  OptionsView.swift
//  eduentertainment
//
//  Created by Macmaurice Osuji on 3/6/24.
//

import SwiftUI

struct OptionsView: View {
    @EnvironmentObject var parameters: ParameterViewModels
    @Binding var blurAmount: Double
    @Binding var colors: [String]
    var tracking: (Int) -> Void
    
    var body: some View {
        VStack {
            ForEach(0..<4) { num in Button {
                    tracking(num)
                }label: {
                    ZStack {
                        Image("\(colors[num])")
                            .renderingMode(.original)
                            .clipShape(Circle())
                            .padding(.vertical, 9)
                            .shadow(color: .black, radius: 5)
                            .blur(radius: num != parameters.options.firstIndex(of: "\(parameters.ans)") ? blurAmount: 0)
                            .overlay {
                                Capsule().stroke(Color.black, lineWidth: 2)
                                Text("\(parameters.options[num])")
                                    .foregroundColor(.black)
                                    .font(.system(size: 50, weight: .semibold, design: .rounded))
                                    .blur(radius: num != parameters.options.firstIndex(of: "\(parameters.ans)") ? blurAmount: 0)
                            }
                        
                    }
                }
            }
        }
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView(blurAmount: .constant(0.0), colors: .constant(["yellow", "green", "blue", "red"]), tracking: { _ in })
            .environmentObject(ParameterViewModels())
    }
}
