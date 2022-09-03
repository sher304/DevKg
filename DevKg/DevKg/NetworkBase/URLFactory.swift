//
//  URLFactory.swift
//  DevKg
//
//  Created by Шермат Эшеров on 3/9/22.
//

import Foundation


struct URLFactory{
    let base: URL
    let newJobs: URL
    
    init(base: URL = URL(string: "https://devkg.com/")!){
        self.base = base
        self.newJobs = URL(string: base.appendingPathComponent("api/pages/jobs?page=1").description)!
    }
}
