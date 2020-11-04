//
//  Servie.swift
//  iOS-Cart
//
//  Created by Jhonny on 11/4/20.
//  Copyright © 2020 Baloombaz. All rights reserved.
//

import Foundation

enum ContentType: String {
    case JSON = "application/json"
    case HTML = "text/html"
    case XHTML = "application/xhtml+xml"
    case TypeFormURLEncode = "application/x-www-form-urlencoded"
}

enum HTTPMethod: String {
    case put = "PUT"
    case post = "POST"
    case get = "GET"
    case delete = "DELETE"
    case head = "HEAD"
}

protocol Request {
    var method: HTTPMethod { get }
    var path: String { get }
    var headers: [String: String] { get }
    var body: String? { get }
}

extension Request {
    var headers: [String: String] { return [:] }
    var request: URLRequest? { return nil }
}


extension Request {
    
    func build() -> URLRequest {
    
        let mainURL = URL(string: path)!
        var request = URLRequest(url: mainURL)
        request.allHTTPHeaderFields = headers
        request.httpMethod = method.rawValue
        request.addValue(ContentType.JSON.rawValue, forHTTPHeaderField: "Content-Type")
        request.httpBody = body?.data(using: .utf8)
        return request
    }
}


//protocol RequestModifier {
//    func modifyRequest(_ request: URLRequest) -> URLRequest
//}

/// An abstract service type that can have multiple implementation for example - a NetworkService that gets a resource from the Network or a DiskService that gets a resource from Disk
protocol Service {
    func apiCall(completion: @escaping (Result<Data, Error>) -> Void)
}

final class NetworkService: Service {
    
    private let session: URLSession
    private let modifiers: URLRequest
    
    init(session: URLSession = .shared, modifiers: URLRequest) {
           self.session = session
           self.modifiers = modifiers
    }
    
    enum ServiceError: Error {
        case noData
    }
    
    func apiCall(completion: @escaping (Result<Data, Error>) -> Void) {
        
        let request = modifiers
//        let modifiedRequest = modifiers.reduce(request.build()) { $1.modifyRequest($0) }
                
         let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(ServiceError.noData))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
