//
//  Sequencer.swift
//  Sequencer
//
//  Created by Javier Calatrava on 10/12/24.
//
import SwiftUI

@globalActor
actor GlobalManager {
    static var shared = GlobalManager()
}

final class Sequencer: ObservableObject {
    @MainActor
    @Published var isDone: Bool = false

    @MainActor
    @Published var currentView: AnyView = AnyView(Text("Initial View"))

    @MainActor
    func updateView(to newView: AnyView) {
        currentView = newView
    }

    @MainActor
    static let shared = Sequencer()

    fileprivate let operationQueue = OperationQueue()

    private init() { }

    @MainActor
    func start() {
        Task {
            await self.regularInitialSequence()
        }
    }

    @GlobalManager
    func regularInitialSequence() {
        let presentSplashOperation = PresentSplashOperation()
        let forceUpdateOperation = ForceUpdateOperation()
        let whatsNewOperation = WhatsNewOperation()
        
        // DO NOT FORGET ADD OPERATION IN operations array. XDDDDD
        let operations = [presentSplashOperation,
                          forceUpdateOperation,
                          whatsNewOperation]
        
        // Add operation dependencies
        forceUpdateOperation.addDependency(presentSplashOperation)
        whatsNewOperation.addDependency(forceUpdateOperation)
        
        operationQueue.addOperations(operations, waitUntilFinished: false)
    }

    func cancel() {
        operationQueue.cancelAllOperations()
    }
}
