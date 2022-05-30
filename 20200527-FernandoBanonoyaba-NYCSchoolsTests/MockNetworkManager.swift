//
//  FakeNetworkManager.swift
//  20200527-FernandoBanonoyaba-NYCSchoolsTests
//
//  Created by fernando babonoyaba on 5/29/22.
//

import Foundation
@testable import _0200527_FernandoBanonoyaba_NYCSchools

class MockNetworkManager: NetworkManagerProtocol {
    
    func getArticles(urlString: String?, completion: @escaping ([ResponseModel]?) -> ()) {
        let bundle = Bundle(for: MockNetworkManager.self)
    
        guard let url = bundle.url(forResource: "schools", withExtension: "json")
        else { return  }
        
        do {
            let data = try Data(contentsOf: url)
            let articleList = try JSONDecoder().decode([ResponseModel].self, from: data)
            completion(articleList)
        } catch {
            print("error")
        }
        
    }
    
    
   
    
}
