//
//  BrawlerDetailView.swift
//  BrawlWiki
//
//  Created by Prathik Nekkanti on 4/16/26.
//

import SwiftUI

struct BrawlerDetailView: View {
    let brawler: Brawler
    @ObservedObject var viewModel: BrawlViewModel
    
    var isFavorite: Bool {
        viewModel.favoriteIDs.contains(brawler.id)
    }
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    AsyncImage(url: URL(string: brawler.imageUrl)) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        ProgressView().tint(brawler.themeColor)
                    }
                    .frame(height: 250)
                    .frame(maxWidth: .infinity)
                    .shadow(color: brawler.themeColor.opacity(0.8), radius: 15)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(brawler.name.uppercased())
                                .font(.system(size: 40, weight: .black))
                                .foregroundColor(.white)
                            
                            Text(brawler.rarity.name.uppercased())
                                .font(.caption)
                                .fontWeight(.bold)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(brawler.themeColor.opacity(0.2))
                                .foregroundColor(brawler.themeColor)
                                .cornerRadius(8)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            viewModel.toggleFavorite(brawlerId: brawler.id)
                        }) {
                            Image(systemName: isFavorite ? "heart.fill" : "heart")
                                .font(.system(size: 35))
                                .foregroundColor(isFavorite ? .red : .gray)
                        }
                    }
                    
                    Text(brawler.description ?? "No description available.")
                        .foregroundColor(.gray)
                        .font(.body)
                    
                    Divider().background(brawler.themeColor)
                    
                    Text("ABILITIES")
                        .font(.title2).fontWeight(.black).foregroundColor(brawler.themeColor)
                    
                    ForEach(brawler.gadgets) { gadget in
                        AbilityRowView(ability: gadget, type: "Gadget", themeColor: brawler.themeColor)
                    }
                    
                    ForEach(brawler.starPowers) { power in
                        AbilityRowView(ability: power, type: "Star Power", themeColor: brawler.themeColor)
                    }
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .tint(brawler.themeColor)
    }
}

struct AbilityRowView: View {
    let ability: Ability
    let type: String
    let themeColor: Color
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            AsyncImage(url: URL(string: ability.imageUrl)) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(ability.name)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(type)
                    .font(.caption)
                    .foregroundColor(themeColor)
                Text(ability.description)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    NavigationView {
        BrawlerDetailView(brawler: Brawler(
            id: 16000000,
            name: "Shelly",
            description: "Shelly's spread-fire shotgun blasts the other team with buckshot.",
            imageUrl: "https://cdn.brawlify.com/brawlers/borders/16000000.png",
            class: BrawlerClass(id: 1, name: "Damage Dealer"),
            rarity: BrawlerRarity(id: 1, name: "Starting Brawler", color: "#b9eaff"),
            gadgets: [
                Ability(id: 23000076, name: "Fast Forward", description: "Shelly dashes ahead, skipping a few unnecessary steps!", imageUrl: "https://cdn.brawlify.com/gadgets/regular/23000076.png"),
                Ability(id: 23000244, name: "Clay Pigeons", description: "On activation, Shelly's next main attack focuses the fire to a smaller area and increases its range.", imageUrl: "https://cdn.brawlify.com/gadgets/regular/23000244.png")
            ],
            starPowers: [
                Ability(id: 23000000, name: "Shell Shock", description: "Shelly's Super shells slow down enemies for 4.5 seconds!", imageUrl: "https://cdn.brawlify.com/star-powers/regular/23000000.png"),
                Ability(id: 23000077, name: "Band-Aid", description: "When Shelly falls below 40% health, she instantly heals for 2000 health. Band-Aid recharges in 15 seconds.", imageUrl: "https://cdn.brawlify.com/star-powers/regular/23000077.png")
            ]
        ), viewModel: BrawlViewModel())
    }
}
