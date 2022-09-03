//
//  File.swift
//  DevKg
//
//  Created by Шермат Эшеров on 3/9/22.
//

import Foundation



class NetworkBase{
    static func networkBase<T: Codable>(url: URLRequest, completion: @escaping (Swift.Result<T, Error>) -> Void){
        if url == nil{
            completion(.failure(NetworkErrors.wrongURL))
        }
        
        
        let session = URLSession.shared
        
        
        session.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                completion(.failure(NetworkErrors.nilData))
                return
            }
            print(String(data: data, encoding: .utf8)!)
            do{
                let jsonObject = try JSONDecoder().decode(T.self, from: data)
                print("-")
                print(jsonObject)
                completion(.success(jsonObject))
            }catch{
                completion(.failure(NetworkErrors.nilData))
            }
        }.resume()
    }
}


enum NetworkErrors: Error{
    case wrongURL
    case nilData
}

