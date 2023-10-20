//
//  MovieCardView.swift
//  FlickVibe
//
//  Created by Frédéric Helfer on 18/10/23.
//

import SwiftUI

struct MovieCardView: View {
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            ZStack(alignment: .bottomLeading) {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.secondary)
                    .frame(width: 160, height: 210)
                
                ScoreView(score: movie.voteAverage)
                    .offset(x: 15, y: 15)
            }
            
            Text(movie.title)
                .font(.headline).bold()
                .lineLimit(nil)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
        }
    }
}

#Preview {
    MovieCardView(movie: Movie.mock)
}
