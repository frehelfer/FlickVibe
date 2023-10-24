//
//  MovieCardView.swift
//  FlickVibe
//
//  Created by Frédéric Helfer on 18/10/23.
//

import SwiftUI
import Models

public struct MovieCardView: View {
    let movie: Movie
    
    public init(movie: Movie) {
        self.movie = movie
    }
    
    public var body: some View {
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
                .lineLimit(2)
                .minimumScaleFactor(0.7)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
        }
        .frame(width: 160)
    }
}

#Preview {
    MovieCardView(movie: Movie.mock)
}
