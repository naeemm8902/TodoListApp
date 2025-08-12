//
//  HeaderView.swift
//  TodoListApp
//
//  Created by Wazir Naeem Ahmed on 12/08/2025.
//

import SwiftUI

struct HeaderView: View {
    let title:String
    let Subtitle:String
    let angle: Double
    let background:Color
    var body: some View {
        NavigationView {
            
            ZStack {
                // Background shape rotated
                RoundedRectangle(cornerRadius: 20)
                    .fill(background)
                    .frame(height: 325)
                    .frame(width: 600)
                    .rotationEffect(Angle(degrees: angle))
                
                // Text stays straight
                VStack(spacing: 10) {
                    Text(title)
                        .font(.system(size: 50))
                        .bold()
                        .foregroundColor(.white)
                    
                    Text(Subtitle)
                        .font(.system(size: 24))
                        .foregroundColor(.white.opacity(0.8))
                }
            }
            .offset(y: -100)
            .padding(.bottom, 20)    }
    }
}
#Preview {
    HeaderView(title: "Title", Subtitle: "Subtitle", angle: 16, background: .pink)
}
