//
//  CategoryViewController.swift
//  WalletBudgetAndMoney
//
//  Created by Иван Знак on 30/04/2024.
//

import UIKit

class CategoryViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var data: [CategoryItem] = []
    var type: Types?
    var closure: ((String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ChangeBalanceTableViewCell.self, forCellReuseIdentifier: ChangeBalanceTableViewCell.id)
        tableView.separatorColor = .systemGray2
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layoutConstraints()
        nvParameters()
    }
    
    private func layoutConstraints(){
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func nvParameters(){
        navigationItem.titleView = {
            let view = UIView()
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(label)
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: view.topAnchor),
                label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                label.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ])
            label.attributedText = UIView.stringToNSAttributedString(string: "Выбрать категорию", size: 18, weight: .semibold , color: .black)
            return view
        }()
        navigationController?.navigationBar.tintColor = .black
    }
}

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if data.first?.type != .income {
            let cell = tableView.dequeueReusableCell(withIdentifier: ChangeBalanceTableViewCell.id, for: indexPath) as! ChangeBalanceTableViewCell
            cell.imageViewCategory.image = UIImage(resource: .expenses)
            cell.labelCategory.text = data[indexPath.row].text
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ChangeBalanceTableViewCell.id, for: indexPath) as! ChangeBalanceTableViewCell
            cell.imageViewCategory.image = UIImage(resource: .income)
            cell.labelCategory.text = data[indexPath.row].text
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        closure?(data[indexPath.row].text)
        navigationController?.popViewController(animated: true)
    }
}
