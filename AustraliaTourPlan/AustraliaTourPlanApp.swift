//
//  AustraliaTourPlanApp.swift
//  AustraliaTourPlan
//
//  Created by TDE Mackbook on 24/01/25.
//

import SwiftUI

@main
struct AustraliaTourPlanApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            let viewModel = CityViewModel() // Pass the correct service instance
            ContentView(viewModel: viewModel) // Pass it to ContentView
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
