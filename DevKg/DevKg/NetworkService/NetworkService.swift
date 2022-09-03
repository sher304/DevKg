//
//  NetworkServiec.swift
//  DevKg
//
//  Created by Шермат Эшеров on 3/9/22.
//

import Foundation

protocol NetworkService{
    func parseData(completion: @escaping(Swift.Result<DevResults, Error>) -> Void)
}


class Network: NetworkService{
    let factory = URLFactory()
    func parseData(completion: @escaping(Swift.Result<DevResults, Error>) -> Void){
        let baseURl = URLRequest(url: factory.newJobs)
        NetworkBase.networkBase(url: baseURl, completion: completion)
    }
}
