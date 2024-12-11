//
//  ContentView.swift
//  SequencerPattern
//
//  Created by Javier Calatrava on 10/12/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var sequencer = appSingletons.sequencer
    var body: some View {
        if sequencer.isDone {
            HomeView()
        } else {
            sequencer.currentView
        }
    }
}

#Preview {
    ContentView()
}
