//
//  ForceUpdateOperation.swift
//  Sequencer
//
//  Created by Javier Calatrava on 10/12/24.
//

import Foundation
import SwiftUI
import os

@GlobalManager
final class ForceUpdateOperation: ConcurrentOperation, @unchecked Sendable {

    override init() {
        super.init()
    }

    @MainActor
    func ForceUpdateRequiredView() -> some View {
        VStack {
          //  ProgressView()
            Text("Software Update Required!!!")
                .font(.largeTitle)
                .fontWeight(.bold)
            Button("Download it from Apple Store...") {}
                .buttonStyle(.borderedProminent)
        }
            .padding()
    }

    override func main() {
        let required = false
        os_log("Start: ForceUpdateOperation", log: log, type: .debug)
        sleep(5)
        if required {
            Task { @MainActor in
                Sequencer.shared.updateView(to: AnyView(ForceUpdateRequiredView()))
            }
        } else {
            self.state = .Finished
        }
        os_log("End: ForceUpdateOperation", log: log, type: .debug)
    }
}
