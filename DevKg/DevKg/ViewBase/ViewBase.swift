//
//  ViewBase.swift
//  DevKg
//
//  Created by Шермат Эшеров on 3/9/22.
//

import Foundation
import UIKit


class ViewBase: UIViewController{
    
    override func viewDidLoad() {
        setupConstraints()
        bindViewModel()
    }
    
    open func setupConstraints(){}

    open func bindViewModel(){}
    
    
}
