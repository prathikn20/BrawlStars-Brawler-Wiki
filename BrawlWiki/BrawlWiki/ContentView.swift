//
//  ContentView.swift
//  BrawlWiki
//
//  Created by Prathik Nekkanti on 4/13/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("BrawlWiki Test")
        }
        .task {
            do {
                let brawlers = try await BrawlService.fetchBrawlers()
                print("Got the data.")
                
            } catch {
                print("Error: \(error)")
            }
        }
    }
}

#Preview {
    ContentView()
}
