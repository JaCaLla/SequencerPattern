//
//  FetchConfigurationOperation.swift
//  Sequencer
//
//  Created by Javier Calatrava on 10/12/24.
//

import Foundation
import SwiftUI
import os

@GlobalManager
final class FetchConfigurationOperation: ConcurrentOperation, @unchecked Sendable {

    override init() {
        super.init()
    }

    override func main() {
        let required = true
        os_log("Start: FetchConfigurationOperation", log: log, type: .debug)
        sleep(8)
        self.state = .Finished
        os_log("End: FetchConfigurationOperation", log: log, type: .debug)
    }
}
