//
//  CityListView.swift
//  AustraliaTourPlan
//
//  Created by TDE Mackbook on 24/01/25.
//

import SwiftUI

struct CityListView: View {
    @StateObject private var viewModel = CityViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.cities) { city in
                VStack(alignment: .leading) {
                    Text(city.city).font(.headline)
                    Text("Population: \(city.population)").font(.subheadline)
                    Text("Region: \(city.admin_name), \(city.country)").font(.subheadline)
                }
            }
            .navigationTitle("Australian Cities")
            .toolbar {
                Button("Refresh") {
                    viewModel.refreshData()
                }
            }
        }
    }
}
