//
//  ViewModelController.swift
//  20200527-FernandoBanonoyaba-NYCSchools
//
//  Created by fernando babonoyaba on 5/28/22.
//

import Foundation
import UIKit

protocol NetworkDelegate: AnyObject {
    func dataFinished()
}

class ViewModelController {
   
    var responseData = [ResponseModel]()
    weak var loadData: NetworkDelegate?
    
    private let networkManager: NetworkManagerProtocol?
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()){
        self.networkManager = networkManager
        
    }
    
    func createData(urlString: String = NetworkURL.url) {
        createData(url: urlString)
    }
    
    private func createData(url: String?) {

        networkManager?.getArticles(urlString: url){ articles in
            
            if let articles = articles {
                
                self.responseData = articles
                
                DispatchQueue.main.async {
                    self.loadData?.dataFinished()
                }
            }
        }
       
    }
    
    func getName(_ row: Int) -> String? {
        return responseData[row].schoolName
    }
    
    func getCount() -> Int {
        return responseData.count
    }
   
    func getID(_ row: Int) -> String? {
        return responseData[row].id
    }
    
    func isNotEmpty() -> Bool {
        return !responseData.isEmpty
    }
}


