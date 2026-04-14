//
//  BrawlService.swift
//  BrawlWiki
//
//  Created by Prathik Nekkanti on 4/14/26.
//

import Foundation

class BrawlService {
    
    static func fetchBrawlers() async throws -> [Brawler] {
        let url = URL(string: "https://api.brawlapi.com/v1/brawlers")
        
        guard let url = url else {
            fatalError("Invalid URL")
        }
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let statement = try JSONDecoder().decode(BrawlerList.self, from: data)
            
            return statement.list
        } catch let error as DecodingError{
            switch error {
                case .typeMismatch(_, let context):
                    print(context.debugDescription)
                case .valueNotFound(_, let context):
                    print(context.debugDescription)
                case .keyNotFound(_, let context):
                    print(context.debugDescription)
                case .dataCorrupted(let context):
                    print(context.debugDescription)
                @unknown default:
                    print(error.localizedDescription)
            }
            throw error
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
}
