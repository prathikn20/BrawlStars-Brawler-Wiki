//
//  ContentView.swift
//  BrawlWiki
//
//  Created by Prathik Nekkanti on 4/13/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = BrawlViewModel()
    
    @State private var searchText = ""
    @State private var selectedRarity = "All"
    @State private var showFavoritesOnly = false
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack(spacing: 0) {
                    Text("BRAWLWIKI")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundColor(.cyan)
                        .padding(.top)
                    
                    FilterHeaderView(
                        searchText: $searchText,
                        selectedRarity: $selectedRarity,
                        showFavoritesOnly: $showFavoritesOnly,
                        availableRarities: viewModel.availableRarities
                    )
                    .padding()
                    
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 12) {
                            
                            let brawlersToShow = viewModel.filteredBrawlers(searchText: searchText, selectedRarity: selectedRarity, showFavoritesOnly: showFavoritesOnly)
                            
                            ForEach(brawlersToShow) { brawler in
                                NavigationLink(destination: BrawlerDetailView(brawler: brawler, viewModel: viewModel)) {
                                    BrawlerCardView(brawler: brawler)
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                    }
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.loadData()
            }
        }
    }
}

#Preview {
    ContentView()
}
