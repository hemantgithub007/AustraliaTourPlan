//
//  ContentView.swift
//  AustraliaTourPlan
//
//  Created by TDE Mackbook on 24/01/25.
//

import SwiftUI
import CoreData
struct ContentView: View {
    @ObservedObject var viewModel: CityViewModel

    var body: some View {
        NavigationView {
            VStack {
                if let lastRefresh = viewModel.lastRefreshTime {
                    Text("Last refreshed: \(lastRefresh, style: .time)")
                        .font(.footnote)
                        .padding(.bottom, 5)
                }
                if viewModel.isLoading {
                    ProgressView("Refreshing...")
                        .padding()
                }
                List(viewModel.cities, id: \.id) { city in
                    VStack(alignment: .leading) {
                        Text(city.city)
                            .font(.headline)
                        Text("Population: \(city.population)")
                            .font(.subheadline)
                        Text("Coordinates: \(city.lat), \(city.lng)")
                            .font(.footnote)
                    }
                }
            }
            .navigationTitle("AU Cities")
            .toolbar {
                Button("Refresh") {
                    viewModel.refreshData()
                }
            }
        }
    }
}
