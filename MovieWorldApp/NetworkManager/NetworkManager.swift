//
//  NetworkManager.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 19.03.2024.
//

import Foundation
import Alamofire
protocol NetworkManagerProtocol {
    func makeRequest <T:Codable>(type:T.Type,url :String,method:HTTPMethod,completion:@escaping((Result<T,ErrorTypes>)->()))
}
final class NetworkManager :NetworkManagerProtocol{
  
    func makeRequest <T:Codable>(type:T.Type,url :String,method:HTTPMethod,completion:@escaping((Result<T,ErrorTypes>)->() )) {
        AF.request(url,method: method).responseData(completionHandler: { response in
            switch response.result {
            case .success(let data):
                do {
                    let dataDecoder = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(dataDecoder))
                }catch(let error){
                    print(error)
                    completion(.failure(.invalidData))
                }
            case .failure(let error):
               completion(.failure(.generalError))
                print(error)
            }
        })
    }
}
