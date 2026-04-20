//
//  BrawlViewModel.swift
//  BrawlWiki
//
//  Created by Prathik Nekkanti on 4/15/26.
//

import SwiftUI
import Combine

class BrawlViewModel: ObservableObject {
    @Published var allBrawlers: [Brawler] = []
    
    @Published var favoriteIDs: Set<Int> = [] {
        didSet {
            UserDefaults.standard.set(Array(favoriteIDs), forKey: "SavedFavorites")
        }
    }
    
    init() {
        let saved = UserDefaults.standard.array(forKey: "SavedFavorites") as? [Int] ?? []
        self.favoriteIDs = Set(saved)
    }
    
    func loadData() async {
        do {
            let fetchData = try await BrawlService.fetchBrawlers()
            DispatchQueue.main.async {
                self.allBrawlers = fetchData
            }
        } catch {
            print("ViewModel failed to load data: \(error)")
        }
    }
    
    func filteredBrawlers(searchText: String, selectedRarity: String, showFavoritesOnly: Bool) -> [Brawler] {
        var filtered = allBrawlers
        
        if showFavoritesOnly {
            filtered = filtered.filter { favoriteIDs.contains($0.id) }
        }
        
        if !searchText.isEmpty {
            filtered = filtered.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
        
        if selectedRarity != "All" {
            filtered = filtered.filter { $0.rarity.name == selectedRarity }
        }
        
        return filtered
    }
    
    func toggleFavorite(brawlerId: Int) {
        if favoriteIDs.contains(brawlerId) {
            favoriteIDs.remove(brawlerId)
        } else {
            favoriteIDs.insert(brawlerId)
        }
    }
    
    var availableRarities: [String] {
        let rarities = allBrawlers.map { $0.rarity.name }
        let uniqueRarities = Array(Set(rarities)).sorted()
        return ["All"] + uniqueRarities
    }
}
