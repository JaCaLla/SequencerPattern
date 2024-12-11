//
//  WhatsNewOperation.swift
//  Sequencer
//
//  Created by Javier Calatrava on 10/12/24.
//

import Foundation
import SwiftUI
import os

@GlobalManager
final class WhatsNewOperation: ConcurrentOperation, @unchecked Sendable {
    
    
    override init() {
        super.init()
    }

    @MainActor
    func WhatsNewView() -> some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    Sequencer.shared.isDone = true
                    self.state = .Finished
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .background(Color.red)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }
            }
           // Spacer()
            TabView{
                VStack {
                    Text("What's new feature A")
                }
                VStack {
                    Text("What's new feature B")
                }
                VStack {
                    Text("What's new feature C")
                }
            }
            .font(.system(size: 20, weight: .bold))
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
        .padding()
    }
    
    override func main() {
        @AppStorage("appVersion") var appVersion = "0.0.0"
        
        os_log("Start: WhatsNewOperation", log: log, type: .debug)
        let marketingVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        let isLatest = appVersion == marketingVersion
        if !isLatest {
            appVersion = marketingVersion
            Task { @MainActor in
                Sequencer.shared.updateView(to: AnyView(WhatsNewView()))
            }
        } else {
            self.state = .Finished
            Task { @MainActor in
                Sequencer.shared.isDone = true
            }
        }
        os_log("End: WhatsNewOperation", log: log, type: .debug)
    }
}
