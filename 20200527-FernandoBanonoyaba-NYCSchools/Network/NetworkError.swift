//
//  NetworkError.swift
//  20200527-FernandoBanonoyaba-NYCSchools
//
//  Created by fernando babonoyaba on 5/28/22.
//

import Foundation

enum NetworkError: Error {
    
    case badURL
    case other(Error?)

}
