//
//  APIService.swift
//  gameVault
//
//  Created by Onesto on 15/06/25.
//

import Foundation

class APIService {
    static let shared = APIService()
    
    private init() {}

    func fetchCompanies(completion: @escaping ([Company]) -> Void) {
        guard let url = URL(string: "https://whale-app-f76gv.ondigitalocean.app/companies") else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                if let decoded = try? JSONDecoder().decode([Company].self, from: data) {
                    DispatchQueue.main.async {
                        completion(decoded)
                    }
                }
            }
        }.resume()
    }

    func fetchVideojuegos(completion: @escaping ([Videojuego]) -> Void) {
        guard let url = URL(string: "https://whale-app-f76gv.ondigitalocean.app/videojuegos") else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                if let decoded = try? JSONDecoder().decode([Videojuego].self, from: data) {
                    DispatchQueue.main.async {
                        completion(decoded)
                    }
                }
            }
        }.resume()
    }
}
