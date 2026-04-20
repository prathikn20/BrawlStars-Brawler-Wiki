//
//  BrawlerCardView.swift
//  BrawlWiki
//
//  Created by Prathik Nekkanti on 4/15/26.
//

import SwiftUI

struct BrawlerCardView: View {
    let brawler: Brawler
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            AsyncImage(url: URL(string: brawler.imageUrl)) { image in
                image.resizable()
                     .scaledToFill()
            } placeholder: {
                ProgressView().tint(brawler.themeColor) 
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 120, maxHeight: 120)
            .clipped()
            
            Text(brawler.name.uppercased())
                .font(.caption)
                .fontWeight(.black)
                .foregroundColor(.white)
                .padding(.horizontal, 6)
                .padding(.vertical, 2)
                .background(Color.black.opacity(0.8))
                .cornerRadius(4)
                .padding(6)
        }
        .frame(height: 120)
        .background(Color(UIColor.darkGray))
        .overlay(
            Rectangle()
                .stroke(brawler.themeColor, lineWidth: 3)
        )
        .cornerRadius(8)
        .shadow(color: brawler.themeColor.opacity(0.6), radius: 5)
    }
}
