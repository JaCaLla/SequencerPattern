//
//  TaskFirstAppareanceModifier.swift
//  Sequencer
//
//  Created by Javier Calatrava on 10/12/24.
//

import SwiftUI

extension View {
    func taskFirstAppareance(_ task: @escaping () async -> Void) -> some View {
        modifier(TaskFirstAppareanceModifier(task: task))
    }
}

struct TaskFirstAppareanceModifier: ViewModifier {
    @State private var hasRunTask: Bool = false
    let task: () async -> Void
    
    func body(content: Content) -> some View {
        content.task {
            guard !hasRunTask else { return }
            hasRunTask = true
            await self.task()
        }
    }
}
