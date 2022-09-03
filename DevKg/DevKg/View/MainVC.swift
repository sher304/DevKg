//
//  ViewController.swift
//  DevKg
//
//  Created by Шермат Эшеров on 3/9/22.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private lazy var viewModel: ViewModel = {
        return ViewModel()
    }()
    
    private lazy var tableV: UITableView = {
        let tablev = UITableView()
        tablev.delegate = self
        tablev.dataSource = self
        return tablev
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        setupConstraints()
        view.backgroundColor = .orange
    }
    
    func setupConstraints(){
        view.addSubview(tableV)
        tableV.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(120)
        }
    }
    
    func bindViewModel(){
        viewModel.shareData()
        viewModel.items.bind { [self] _ in
            tableV.reloadData()
        }
    }
}



extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .orange
        cell.textLabel?.text = viewModel.items.value.result.list.first?.slug
        return cell
    }
}
