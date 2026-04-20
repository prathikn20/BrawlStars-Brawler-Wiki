//
//  BrawlerInputs.swift
//  BrawlWiki
//
//  Created by Prathik Nekkanti on 4/16/26.
//

import Foundation

struct BrawlerTips {
    let bestModes: String
    let kit: String
    let strategy: String
}

class CustomDataStore {
    static let sharedTips: [Int: BrawlerTips] = [
        
        // Shelly
        16000000: BrawlerTips(
            bestModes: "Brawl Ball, Solo Showdown",
            kit: "Gadget, Star Power",
            strategy: "Hide in bushes and wait for enemies to get close. Chain her Super by hitting multiple enemies at once!"
        ),
        
        // Colt
        16000001: BrawlerTips(
            bestModes: "Heist, Brawl Ball",
            kit: "Gadget, Star Power",
            strategy: "Use his Slick Boots Star Power to dodge shots. Break open walls in Heist to give your team a clear shot at the safe."
        )
    ]
}
