//
//  HomeView.swift
//  FlickVibe
//
//  Created by Frédéric Helfer on 28/09/23.
//

import ComposableArchitecture
import SwiftUI
import DesignSystem

public struct HomeView: View {
    var store: StoreOf<HomeFeature>
    
    public init(store: StoreOf<HomeFeature>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ZStack(alignment: .top) {
                Color.gray.ignoresSafeArea()
                
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(alignment: .top) {
                            ForEach(viewStore.movies) { movie in
                                MovieCardView(movie: movie)
                            }
                        }
                        .padding(8)
                    }
                }
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}

import ApiClient

#Preview {
    HomeView(
        store: Store(initialState: HomeFeature.State()) {
            HomeFeature()
        } withDependencies: {
            $0.apiClient = .liveValue
        }
    )
}
