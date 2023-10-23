//
//  SearchView.swift
//  FlickVibe
//
//  Created by Frédéric Helfer on 18/10/23.
//

import ComposableArchitecture
import SwiftUI

public struct SearchView: View {
    let store: StoreOf<SearchFeature>
    
    public init(store: StoreOf<SearchFeature>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ZStack {
                Color.red.ignoresSafeArea()
            }
        }
    }
}

#Preview {
    SearchView(
        store: Store(
            initialState: SearchFeature.State(),
            reducer: { SearchFeature() }
        )
    )
}
