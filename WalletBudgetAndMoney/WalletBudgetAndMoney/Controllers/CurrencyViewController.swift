//
//  CurrencyViewController.swift
//  WalletBudgetAndMoney
//
//  Created by Иван Знак on 04/05/2024.
//

import UIKit

class CurrencyViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let data: [CurrencyItem] = [CurrencyItem(id: UUID().uuidString, name: "PLN")]
    var closure: ((String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layoutConstraints()
        tableView.register(ChangeBalanceTableViewCell.self, forCellReuseIdentifier: ChangeBalanceTableViewCell.id)
        tableView.delegate = self
        tableView.dataSource = self
        nvParameters()
    }
    
    private func layoutConstraints(){
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
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
            label.attributedText = UIView.stringToNSAttributedString(string: "Валюта", size: 18, weight: .semibold , color: .black)
            return view
        }()
        navigationController?.navigationBar.tintColor = .black
    }
    
}

extension CurrencyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChangeBalanceTableViewCell.id, for: indexPath) as! ChangeBalanceTableViewCell
        cell.selectionStyle = .none
        cell.labelSelect.text = "Основная Валюта"
        cell.imageViewCategory.image = nil
        cell.labelCategory.text = data[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        closure?(data[indexPath.row].name)
        navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}
