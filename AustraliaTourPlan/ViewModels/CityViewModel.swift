//
//  CityViewModel.swift
//  AustraliaTourPlan
//
//  Created by TDE Mackbook on 24/01/25.
//

import Foundation
class CityViewModel: ObservableObject {
    @Published var cities: [City] = []
    @Published var isLoading: Bool = false // Track loading state
    private var cache: [City] = []
    private let cacheFileName = "cityCache.json"
    @Published var lastRefreshTime: Date? = nil // Track the last refresh time


    init() {
        loadFromCache()
        refreshData()
    }


    func refreshData() {
        print("Refreshing data...")
        isLoading = true
        if let fileURL = Bundle.main.url(forResource: "au_cities", withExtension: "json") {
            DispatchQueue.global().async {
                do {
                    let data = try Data(contentsOf: fileURL)
                    let cities = try JSONDecoder().decode([City].self, from: data)
                    DispatchQueue.main.async {
                        self.cities = cities
                        self.cacheData(cities)
                        self.isLoading = false
                        self.lastRefreshTime = Date() // Update refresh time
                    }
                } catch {
                    DispatchQueue.main.async {
                        print("Error decoding JSON: \(error)")
                        self.isLoading = false
                    }
                }
            }
        }
    }


    private func loadFromCache() {
        let cacheURL = getCacheURL()
        if let data = try? Data(contentsOf: cacheURL) {
            if let cachedCities = try? JSONDecoder().decode([City].self, from: data) {
                self.cities = cachedCities
            }
        }
    }

    private func cacheData(_ cities: [City]) {
        let cacheURL = getCacheURL()
        if let data = try? JSONEncoder().encode(cities) {
            try? data.write(to: cacheURL)
        }
    }

    private func getCacheURL() -> URL {
        let paths = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        return paths[0].appendingPathComponent(cacheFileName)
    }
}
