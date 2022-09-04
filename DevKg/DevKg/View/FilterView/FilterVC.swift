//
//  FilterViewController.swift
//  DevKg
//
//  Created by Шермат Эшеров on 4/9/22.
//

import UIKit
import Hero
import SnapKit

class FilterViewController: ViewBase {

    
    private lazy var someView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .tintColor
        button.setTitle("Back", for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    override func setupConstraints() {
        view.backgroundColor = .white
        view.addSubview(someView)
        someView.snp.makeConstraints { make in
            make.top.equalTo(40)
            make.height.width.equalTo(80)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.top.equalTo(40)
            make.width.equalTo(60)
            make.height.equalTo(40)
        }
    }
    
    @objc func backButtonTapped(){
        dismiss(animated: true)
    }
}
