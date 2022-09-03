//
//  CustomCell.swift
//  DevKg
//
//  Created by Шермат Эшеров on 3/9/22.
//

import Foundation
import UIKit
import Kingfisher
import SnapKit

class CustomCell: UITableViewCell{
    
    static let identifier = "CustomCell"
    
    private lazy var companyLogo: UIImageView = {
        let imageV = UIImageView()
        imageV.layer.cornerRadius = 14
        imageV.layer.masksToBounds = true
        imageV.backgroundColor = .systemGreen
        return imageV
    }()
    
    private lazy var companyTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var positionTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .light)
        label.textColor = .black
        return label
    }()
    
    private lazy var salaryTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private lazy var workTypeTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
    
    func fillData(results: List){
        DispatchQueue.main.async { [self] in
            companyTitle.text = results.organizationName
            let currecny = results.currency.rawValue
            if results.priceTo != 0{
                salaryTitle.text = "\(results.priceFrom)-\(results.priceTo) \(currecny.uppercased())"
            }else{
                salaryTitle.text = "\(results.priceFrom) \(currecny.uppercased())"
            }
            workTypeTitle.text = results.type.rawValue.capitalized
        }
    }
    
    func setupConstraints(){
        contentView.addSubview(companyLogo)
        companyLogo.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(60)
        }
        
        contentView.addSubview(companyTitle)
        companyTitle.snp.makeConstraints { make in
            make.width.equalTo(contentView.frame.width / 2)
            make.leading.equalTo(companyLogo.snp.trailing).offset(20)
            make.top.equalTo(companyLogo.snp.top)
        }
        
        contentView.addSubview(positionTitle)
        positionTitle.snp.makeConstraints { make in
            make.top.equalTo(companyTitle.snp.bottom).offset(15)
            make.leading.equalTo(companyTitle)
        }
        
        contentView.addSubview(salaryTitle)
        salaryTitle.snp.makeConstraints { make in
            make.bottom.equalTo(-15)
            make.leading.equalTo(companyTitle.snp.leading)
        }
        
        contentView.addSubview(workTypeTitle)
        workTypeTitle.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-15)
            make.centerY.equalToSuperview()
        }
    }
}
