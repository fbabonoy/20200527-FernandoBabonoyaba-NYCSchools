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

protocol  ViewModelControllerProtocal {
    
    func createData(urlString: String)
    func getName(_ row: Int) -> String?
    func getCount() -> Int
    func getID(_ row: Int) -> String?
    func getReadingScore() -> String
    func getMathScore() -> String
    func getWritingScore() -> String
}

class ViewModelController: ViewModelControllerProtocal {
   
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
        networkManager?.getArticles(urlString: url){ schoolData in
            if let response = schoolData {
                self.responseData = response
                DispatchQueue.main.async {
                    self.loadData?.dataFinished()
                }
            }
        }
    }
    
    func getName(_ row: Int) -> String? {
        responseData[row].schoolName
    }
    
    func getCount() -> Int {
        responseData.count
    }
   
    func getID(_ row: Int) -> String? {
        responseData[row].id
    }
    
    func getReadingScore() -> String {
        responseData.isEmpty ? "N/A" : responseData[0].reading!
    }
    
    func getMathScore() -> String {
        responseData.isEmpty ? "N/A" : responseData[0].math!
    }
    
    func getWritingScore() -> String {
        responseData.isEmpty ? "N/A" : responseData[0].writing!
    }
    
}


