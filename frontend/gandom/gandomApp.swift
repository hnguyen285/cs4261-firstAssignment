//
//  gandomApp.swift
//  gandom
//
//  Created by Hao Nguyen on 9/8/21.
//

import SwiftUI

@main
struct gandomApp: App {
    var network = Network()
    
    var body: some Scene {
        WindowGroup {
            LoginView().environmentObject(network)
        }
    }
}
