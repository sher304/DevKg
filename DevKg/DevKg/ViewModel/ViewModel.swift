//
//  ViewModel.swift
//  DevKg
//
//  Created by Шермат Эшеров on 3/9/22.
//

import Foundation


class ViewModel{
    
    private lazy var network: Network = {
        return Network()
    }()
    
    var items = Dynamic(DevResults(success: Bool(), result: Result(list: [], next: Bool())))
    
    func shareData(){
        network.parseData { data in
            switch data{
            case.success(let data):
                self.items.value = data
                break
            case.failure(_):
                break
            }
        }
    }
}
