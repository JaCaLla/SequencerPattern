//
//  HomeView.swift
//  Sequencer
//
//  Created by Javier Calatrava on 10/12/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Home UI")
        }
        .padding()
    }
}

#Preview { HomeView() }
