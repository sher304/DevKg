//
//  ViewController.swift
//  DevKg
//
//  Created by Шермат Эшеров on 3/9/22.
//

import UIKit
import Hero
import SnapKit

class MainViewController: ViewBase {
    
    private lazy var viewModel: ViewModel = {
        return ViewModel()
    }()
    
    private lazy var vacanciesTitle: UILabel = {
        let label = UILabel()
        label.text = "Vacancies"
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private lazy var filterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "line.3.horizontal.decrease.circle"), for: .normal)
        button.tintColor = .orange
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.addTarget(self, action: #selector(filterTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var someView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    private lazy var tableV: UITableView = {
        let tablev = UITableView()
        tablev.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        tablev.delegate = self
        tablev.dataSource = self
        return tablev
    }()
    
    
    override func setupConstraints(){
        view.backgroundColor = UIColor(white: 1, alpha: 0.9)
        
        view.addSubview(vacanciesTitle)
        vacanciesTitle.snp.makeConstraints { make in
            make.leading.equalTo(25)
            make.top.equalTo(70)
        }
        
        view.addSubview(filterButton)
        filterButton.snp.makeConstraints { make in
            make.trailing.equalTo(-25)
            make.height.width.equalTo(30)
            make.centerY.equalTo(vacanciesTitle)
        }
        
        view.addSubview(someView)
        someView.hero.id = "SomeView"
        self.hero.isEnabled = true
        someView.snp.makeConstraints { make in
            make.top.equalTo(vacanciesTitle.snp.bottom).offset(40)
            make.height.width.equalTo(80)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(tableV)
        tableV.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(someView.snp.bottom).offset(40)
        }
    }
    
    override func bindViewModel(){
        viewModel.shareData()
        viewModel.items.bind { [self] _ in
            DispatchQueue.main.async {
                self.tableV.reloadData()
            }
        }
    }
    
    @objc func filterTapped(){
        let vc = FilterViewController()
        vc.hero.isEnabled = true
        vc.hero.modalAnimationType = .selectBy(presenting: .slide(direction: .down), dismissing: .slide(direction: .up))
        self.present(vc, animated: true, completion: nil)
        
    }
}



extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.value.result.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CustomCell()
        let items = viewModel.items.value.result.list[indexPath.row]
        cell.fillData(results: items)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
