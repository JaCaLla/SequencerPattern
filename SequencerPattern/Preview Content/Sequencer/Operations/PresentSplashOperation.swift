//
//  PresentSplashOperation.swift
//  PresentSplashOperation
//
//  Created by Javier Calatrava on 10/12/24.
//

import Foundation
import SwiftUI
import os

@GlobalManager
final class PresentSplashOperation: ConcurrentOperation, @unchecked Sendable {

    override init() {
        super.init()
    }

    @MainActor
    func SequencerView() -> some View {
        VStack {
            ProgressView()
            Text("I'm Splash")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
            .padding()
    }

    override func main() {
        os_log("Start: PresentSplashOperation", log: log, type: .debug)
        Task { @MainActor in
            Sequencer.shared.updateView(to: AnyView(SequencerView()))
        }
//        sleep(5)
        os_log("End: PresentSplashOperation", log: log, type: .debug)
        self.state = .Finished
//        Task { @MainActor in
//            Sequencer.shared.isDone = true
//        }
    }
}
