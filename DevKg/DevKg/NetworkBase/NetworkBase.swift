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
            DispatchQueue.main.async {
                completion(.failure(NetworkErrors.wrongURL))
            }
        }
        
        let oldUrl = url.url?.description
        let fixedUrl = oldUrl!.replacingOccurrences(of: "%3F", with: "?")
        
        let session = URLSession.shared
        
        
        session.dataTask(with: URL(string: fixedUrl)!) { data, _, _ in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(NetworkErrors.nilData))
                }
                return
            }
            do{
                let jsonObject = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(jsonObject))
                }
            }catch{
                DispatchQueue.main.async {
                    completion(.failure(NetworkErrors.nilData))
                }
            }
        }.resume()
    }
}


enum NetworkErrors: Error{
    case wrongURL
    case nilData
}

