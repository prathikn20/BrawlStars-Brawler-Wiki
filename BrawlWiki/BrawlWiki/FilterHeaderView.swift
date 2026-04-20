//
//  FilterHeaderView.swift
//  BrawlWiki
//
//  Created by Prathik Nekkanti on 4/15/26.
//

import SwiftUI

struct FilterHeaderView: View {
    @Binding var searchText: String
    @Binding var selectedRarity: String
    @Binding var showFavoritesOnly: Bool
    let availableRarities: [String]
    
    var body: some View {
        VStack(spacing: 16) {
            
            TextField("", text: $searchText, prompt: Text("Search Brawlers...").foregroundColor(.white.opacity(0.7)))
                .padding(12)
                .background(Color.white.opacity(0.15))
                .cornerRadius(10)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 10).stroke(Color.cyan, lineWidth: 1)
                )
            
            Toggle("Show Favorites Only", isOn: $showFavoritesOnly)
                .foregroundColor(.white)
                .font(.subheadline)
                .fontWeight(.bold)
                .tint(.cyan)
            
            HStack {
                Text("Filter by Rarity: ")
                    .foregroundColor(.gray)
                    .font(.subheadline)
                    .fontWeight(.bold)
                
                Spacer()
                
                Picker("Rarity", selection: $selectedRarity) {
                    ForEach(availableRarities, id: \.self) { rarity in
                        Text(rarity).tag(rarity)
                    }
                }
                .tint(.cyan)
            }
        }
        .padding()
        .background(Color(UIColor.darkGray).opacity(0.2))
        .cornerRadius(16)
    }
}

#Preview {
    FilterHeaderView(
        searchText: .constant(""),
        selectedRarity: .constant("All"),
        showFavoritesOnly: .constant(false),
        availableRarities: ["All", "Common", "Rare", "Epic"]
    )
    .preferredColorScheme(.dark)
}
