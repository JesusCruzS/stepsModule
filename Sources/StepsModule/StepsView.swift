//
//  SwiftUIView.swift
//  
//
//  Created by Jesus Cruz Suárez on 2/05/24.
//

import SwiftUI

public struct StepsView: View {
    
    @StateObject var viewModel = ViewModel()
    
    public init() {}
    
    public var body: some View {
        VStack {
            Image(systemName: "figure.walk")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.red)
                .frame(width: 60, height: 60)
            Text("Pasos Hoy")
                .font(.system(size: 20, weight: .bold, design: .rounded))
            Text(viewModel.allMySteps)
                .font(.system(size: 40, weight: .bold, design: .rounded))
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(style: StrokeStyle(lineWidth: 3, dash: [5]))
        )
        .task {
            viewModel.requestAccessToHealtData()
        }
    }
}
