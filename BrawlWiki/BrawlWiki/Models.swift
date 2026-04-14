//
//  Models.swift
//  BrawlWiki
//
//  Created by Prathik Nekkanti on 4/14/26.
//

import Foundation

struct BrawlerList: Codable {
    let list: [Brawler]
}

struct Brawler: Codable {
    let id: Int
    let name: String
    let description: String?
    let imageUrl: String
    let `class`: BrawlerClass
    let rarity: BrawlerRarity
    let starPowers: [Ability]
    let gadgets: [Ability]
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

struct Ability: Codable {
    let id: Int
    let name: String
    let description: String
    let imageUrl: String
}
