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
    var onDataAvailable:((_ data: String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ChangeBalanceTableViewCell.self, forCellReuseIdentifier: ChangeBalanceTableViewCell.id)
        layoutConstraints()
        
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
    
    func sendData(data: String) {
        self.onDataAvailable?(data)
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
        guard let type = self.type else {return}
        switch type {
            
        case .foodAndDrinks:
            switch data[indexPath.row].subType.foodAndDrinks {
            case .food:
                 return
            case .products:
                return
            case .restaurants:
                return
            case .bars:
                return
            case .none:
                return
            }
        case .buys:
            switch data[indexPath.row].subType.buys {
            case .buys:
                return
            case .clothes:
                return
            case .jewellery:
                return
            case .beauty:
                return
            case .children:
                return
            case .home:
                return
            case .pets:
                return
            case .electronics:
                return
            case .presents:
                return
            case .instruments:
                return
            case .freeTime:
                return
            case .farmacy:
                return
            case .none:
                return
            }
        case .house:
            switch data[indexPath.row].subType.house {
            case .house:
                return
            case .rent:
                return
            case .mortgage:
                return
            case .utilities:
                return
            case .service:
                return
            case .repair:
                return
            case .insurance:
                return
            case .none:
                return
            }
        case .transport:
            switch data[indexPath.row].subType.transport {
            case .transport:
                return
            case .publicTransport:
                return
            case .taxi:
                return
            case .longTrips:
                return
            case .dealTrips:
                return
            case .none:
                return
            }
        case .car:
            switch data[indexPath.row].subType.car {
            case .car:
                return
            case .fuel:
                return
            case .parking:
                return
            case .techService:
                return
            case .rent:
                return
            case .insurance:
                return
            case .leasing:
                return
            case .none:
                return
            }
        case .relax:
            switch data[indexPath.row].subType.relax {
            case .relax:
                return
            case .treatment:
                return
            case .beauty:
                return
            case .sport:
                return
            case .culture:
                return
            case .parties:
                return
            case .hobby:
                return
            case .education:
                return
            case .books:
                return
            case .tv:
                return
            case .trips:
                return
            case .presents:
                return
            case .alcoholy:
                return
            case .lotteries:
                return
            case .none:
                return
            }
        case .communication:
            switch data[indexPath.row].subType.communication {
            case .communcitaion:
                return
            case .phone:
                return
            case .internet:
                return
            case .games:
                return
            case .post:
                return
            case .none:
                return
            }
        case .finance:
            switch data[indexPath.row].subType.finance {
            case .finance:
                return
            case .taxes:
                return
            case .insurance:
                return
            case .credits:
                return
            case .fine:
                return
            case .consultion:
                return
            case .fees:
                return
            case .aliment:
                return
            case .none:
                return
            }
        case .invest:
            switch data[indexPath.row].subType.invest {
            case .invest:
                return
            case .realEstate:
                return
            case .transport:
                return
            case .financeInvest:
                return
            case .saving:
                return
            case .collection:
                return
            case .none:
                return
            }
        case .income:
            switch data[indexPath.row].subType.income {
            case .income:
                return
            case .salary:
                return
            case .percents:
                return
            case .selling:
                return
            case .rent:
                return
            case .grants:
                return
            case .credit:
                return
            case .vouchers:
                return
            case .lotteries:
                return
            case .returning:
                return
            case .aliment:
                return
            case .presents:
                return
            case .none:
                return
            }
        }
    }
}
