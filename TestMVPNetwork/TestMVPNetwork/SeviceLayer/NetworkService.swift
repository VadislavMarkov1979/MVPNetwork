//
//  NetworkService.swift
//  TestMVPNetwork
//
//  Created by Владимир on 14.05.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    
    
    
    func getComments(complition: @escaping(Result<[Comment]?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    func getComments(complition: @escaping (Result<[Comment]?, Error>) -> Void) {
       let urlString = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _ , error in
            if let error = error {
                complition(.failure(error))
                return
            }
        
        do {
            let data = try JSONDecoder().decode([Comment].self, from: data!)
            complition(.success(data))
            
        } catch {
            complition(.failure(error))
        }
     }.resume()
   }
}

