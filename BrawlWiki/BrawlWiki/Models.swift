//
//  Models.swift
//  BrawlWiki
//
//  Created by Prathik Nekkanti on 4/14/26.
//

import SwiftUI

struct BrawlerList: Codable {
    let list: [Brawler]
}

struct Brawler: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String?
    let imageUrl: String
    let `class`: BrawlerClass
    let rarity: BrawlerRarity
    let gadgets: [Ability]
    let starPowers: [Ability]
    
    var themeColor: Color {
            switch rarity.name {
            case "Rare": return .green
            case "Super Rare": return .blue
            case "Epic": return .purple
            case "Mythic": return .red
            case "Legendary": return .yellow
            default: return .cyan
            }
        }
}

struct BrawlerClass: Codable {
    let id: Int
    let name: String
}

struct BrawlerRarity: Codable {
    let id: Int
    let name: String
    let color: String
}

struct Ability: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let imageUrl: String
}
