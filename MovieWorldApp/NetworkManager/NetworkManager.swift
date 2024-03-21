//
//  NetworkManager.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 19.03.2024.
//

import Foundation
import Alamofire
protocol NetworkManagerProtocol {
    func makeRequest <T:Codable>(type:T,url :String,method:HTTPMethod,completion:@escaping((Result<T,ErrorTypes>)->()))
}
class NetworkManager {
    func makeRequest <T:Codable>(type:T,url :String,method:HTTPMethod,completion:@escaping((Result<T,ErrorTypes>)->())) {
        AF.request(url.addingPercentEncoding(withAllowedCharacters: .afURLQueryAllowed) ?? "").responseData(completionHandler: { response in
            
            switch response.result {
                
            case .success(let data):
                do {
                    let dataDecoder = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(dataDecoder))
                }catch{
                    completion(.failure(.invalidData))
                }
            case .failure(_):
                completion(.failure(.generalError))
            }
        })
    }
}
