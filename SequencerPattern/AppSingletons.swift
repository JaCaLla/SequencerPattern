//
//  AppSingletons.swift
//  LocationSampleApp
//
//  Created by Javier Calatrava on 1/12/24.
//

import Foundation

@MainActor
struct AppSingletons {
    var sequencer: Sequencer
    
    init(sequencer: Sequencer = Sequencer.shared) {
        self.sequencer = sequencer
    }
}

@MainActor var appSingletons = AppSingletons()
