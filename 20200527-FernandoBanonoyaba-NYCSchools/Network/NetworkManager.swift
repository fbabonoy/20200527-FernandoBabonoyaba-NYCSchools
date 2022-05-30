//
//  NetworkManager.swift
//  20200527-FernandoBanonoyaba-NYCSchools
//
//  Created by fernando babonoyaba on 5/28/22.
//

import Foundation

protocol NetworkManagerProtocol {
    func getArticles(urlString: String?, completion: @escaping ([ResponseModel]?) -> ())}

class NetworkManager: NetworkManagerProtocol {
    
    func getArticles(urlString: String?, completion: @escaping ([ResponseModel]?) -> ()) {
        guard let urlUnwraped = urlString else { return }

        guard let url = URL(string: urlUnwraped) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let schoolList = try? JSONDecoder().decode([ResponseModel].self, from: data)
                
                if let response = schoolList {
                    completion(response)
                }
                                
            }
            
        }.resume()
        
    }
    
}
