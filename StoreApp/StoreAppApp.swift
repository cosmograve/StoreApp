//
//  StoreAppApp.swift
//  StoreApp
//
//  Created by Алексей Авер on 18.10.2023.
//

import SwiftUI

@main
struct StoreAppApp: App {
    @StateObject private var storeModel = StoreModel()
    var body: some Scene {
        WindowGroup {
            CategotyView()
                .environmentObject(storeModel)
        }
    }
}
