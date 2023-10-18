//
//  ScoreView.swift
//  FlickVibe
//
//  Created by Frédéric Helfer on 18/10/23.
//

import SwiftUI

struct ScoreView: View {
    let score: Double
    
    var body: some View {
        HStack {
            Image(systemName: "star.fill")
                .foregroundStyle(Color.yellow)
            
            Text(String(format: "%.1f", score))
                .foregroundStyle(.white)
                .bold()
        }
        .padding(8)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        ScoreView(score: 7.0)
    }
}
