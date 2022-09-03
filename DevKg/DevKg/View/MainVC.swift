//
//  ViewController.swift
//  DevKg
//
//  Created by Шермат Эшеров on 3/9/22.
//

import UIKit
import SnapKit

class MainViewController: ViewBase {
    
    private lazy var viewModel: ViewModel = {
        return ViewModel()
    }()
    
    private lazy var tableV: UITableView = {
        let tablev = UITableView()
        tablev.delegate = self
        tablev.dataSource = self
        return tablev
    }()
    
    
    override func setupConstraints(){
        view.addSubview(tableV)
        tableV.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(120)
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
}



extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.value.result.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .orange
        cell.textLabel?.text = viewModel.items.value.result.list[indexPath.row].position
        return cell
    }
}
