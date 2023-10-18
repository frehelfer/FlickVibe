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
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.secondary)
                .frame(width: 150, height: 200)
                .overlay {
                    Circle()
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
