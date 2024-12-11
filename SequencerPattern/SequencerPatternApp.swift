//
//  SequencerPatternApp.swift
//  SequencerPattern
//
//  Created by Javier Calatrava on 10/12/24.
//

import os
import SwiftUI

let log = OSLog(subsystem: "jca.Sequencer", category: "general")

@main
struct SequencerPatternApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                appSingletons.sequencer.start()
            }
        }
    }
}
