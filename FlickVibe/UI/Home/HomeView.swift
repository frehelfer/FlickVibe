//
//  HomeView.swift
//  FlickVibe
//
//  Created by Frédéric Helfer on 28/09/23.
//

import ComposableArchitecture
import SwiftUI

struct HomeView: View {
    var store: StoreOf<HomeFeature>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ZStack(alignment: .top) {
                Color.gray.ignoresSafeArea()
                
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(viewStore.movies) { movie in
                                VStack {
                                    Text(movie.title)
                                }
                                .frame(width: 100, height: 150)
                                .background(Color.red)
                            }
                        }
                    }
                }
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}

#Preview {
    HomeView(store: Store(initialState: HomeFeature.State()) {
        HomeFeature()
    })
}
