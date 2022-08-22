//
//  NetworkManager.swift
//  Pixabay Gallery
//
//  Created by CodergirlTM on 20.08.22.
//

import Foundation

enum CustomError: Error {
    case unsupportedUrl
}

protocol NetworkManagerProtocol: AnyObject {
    func get<T: Codable>(url: String, completion: @escaping (Result<T, Error>) -> Void)
}

final class NetworkManager: NetworkManagerProtocol {
    
    func get<T: Codable>(url: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(CustomError.unsupportedUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
            }
            
            guard let data = data else { return }
            
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}
