//
//  DataCollectionViewCell.swift
//  WalletBudget&Money
//
//  Created by Иван Знак on 19/04/2024.
//

import UIKit

enum StatisticCell {
    case lastRecords
    case cashFlow
    case topExpenses
}

class DataCollectionViewCell: UICollectionViewCell {
    //LastRecords
    let tableViewLastRecords = UITableView()
    let labelLastRecords = UILabel()
    let buttonShowMoreLastRecords = UIButton()
    
    //CashFlow
    let labelCashFlow = UILabel()
    var stackViewCashFlow = UIStackView()
    let labelDateCashFlow = UILabel()
    let labelAmountCashFlow = UILabel()
    let buttonShowMoreCashFlow = UIButton()
    var counterLayout = 0
    
    //TopExpenses
    let labelTopExpenses = UILabel()
    var stackViewTopExpenses = UIStackView()
    let labelDateTopExpenses = UILabel()
    let buttonShowMoreTopExpenses = UIButton()
    
    var data: [CellItem] = []
    
    var typeOfCell: StatisticCell?
    
    static let id = "DataCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = frame.size.width / 7
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 4
        
        
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if counterLayout == 0{
            switch typeOfCell {
            case .lastRecords:
                layoutLastRecords()
                tableViewLastRecords.dataSource = self
                tableViewLastRecords.delegate = self
                tableViewLastRecords.showsVerticalScrollIndicator = false
                tableViewLastRecords.register(LastRecordsTableViewCell.self, forCellReuseIdentifier: LastRecordsTableViewCell.id)
                
                labelLastRecords.attributedText = stringToNSAttributedString(string: "Последние записи", size: 26, weight: .bold, color: .black)
                
                buttonShowMoreLastRecordsParameters()
                counterLayout = 1
            case .cashFlow:
                layoutCashFlow()
                viewToStackViewCashFLow(stackView: &stackViewCashFlow, maxAmount: 100, totalAmount: 0, title: "Доход", color: .systemGreen)
                viewToStackViewCashFLow(stackView: &stackViewCashFlow, maxAmount: 100, totalAmount: 100, title: "Расход", color: .systemRed)
                buttonShowMoreCashFlowParameters()
                stackViewCashFlow.axis = .vertical
                stackViewCashFlow.distribution = .fillProportionally
                stackViewCashFlow.spacing = 5
                
                labelCashFlow.attributedText = stringToNSAttributedString(string: "Денежный поток", size: 26, weight: .bold, color: .black)
                labelDateCashFlow.attributedText = stringToNSAttributedString(string: "Текущий месяц", size: 17, weight: .regular, color: .gray
                )
                labelAmountCashFlow.attributedText = stringToNSAttributedString(string: "-20.00 zł", size: 35, weight: .bold, color: .black)
                
                counterLayout = 1
                
            case .topExpenses:
                layoutTopExpenses()
                viewToStackViewCashFLow(stackView: &stackViewTopExpenses, maxAmount: 500, totalAmount: 500, title: "Ремонт", color: .systemOrange)
                viewToStackViewCashFLow(stackView: &stackViewTopExpenses, maxAmount: 500, totalAmount: 150, title: "Налоги", color: .systemGreen)
                viewToStackViewCashFLow(stackView: &stackViewTopExpenses, maxAmount: 500, totalAmount: 100, title: "Продукты", color: .systemRed)
                buttonShowMoreTopExpensesParameters()
                stackViewTopExpenses.axis = .vertical
                stackViewTopExpenses.distribution = .fillProportionally
                stackViewTopExpenses.spacing = 5
                
                labelTopExpenses.attributedText = stringToNSAttributedString(string: "Топ расходов", size: 26, weight: .bold, color: .black)
                labelDateTopExpenses.attributedText = stringToNSAttributedString(string: "Текущий месяц", size: 17, weight: .regular, color: .gray
                )
                
                counterLayout = 1
                
            case nil:
                return
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutLastRecords(){
        tableViewLastRecords.translatesAutoresizingMaskIntoConstraints = false
        labelLastRecords.translatesAutoresizingMaskIntoConstraints = false
        buttonShowMoreLastRecords.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(tableViewLastRecords)
        contentView.addSubview(labelLastRecords)
        contentView.addSubview(buttonShowMoreLastRecords)
        
        NSLayoutConstraint.activate([
            labelLastRecords.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            labelLastRecords.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            
            
            tableViewLastRecords.topAnchor.constraint(equalTo: labelLastRecords.bottomAnchor, constant: 10),
            tableViewLastRecords.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tableViewLastRecords.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            //            tableViewLastRecords.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            buttonShowMoreLastRecords.topAnchor.constraint(equalTo: tableViewLastRecords.bottomAnchor, constant: 5),
            buttonShowMoreLastRecords.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            buttonShowMoreLastRecords.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
    
    private func layoutCashFlow(){
        labelCashFlow.translatesAutoresizingMaskIntoConstraints = false
        stackViewCashFlow.translatesAutoresizingMaskIntoConstraints = false
        buttonShowMoreCashFlow.translatesAutoresizingMaskIntoConstraints = false
        labelDateCashFlow.translatesAutoresizingMaskIntoConstraints = false
        labelAmountCashFlow.translatesAutoresizingMaskIntoConstraints = false
        
        
        contentView.addSubview(labelCashFlow)
        contentView.addSubview(stackViewCashFlow)
        contentView.addSubview(buttonShowMoreCashFlow)
        contentView.addSubview(labelDateCashFlow)
        contentView.addSubview(labelAmountCashFlow)
        
        NSLayoutConstraint.activate([
            labelCashFlow.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            labelCashFlow.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            
            labelDateCashFlow.topAnchor.constraint(equalTo: labelCashFlow.bottomAnchor, constant: 10),
            labelDateCashFlow.leadingAnchor.constraint(equalTo: labelCashFlow.leadingAnchor),
            
            labelAmountCashFlow.topAnchor.constraint(equalTo: labelDateCashFlow.bottomAnchor, constant: 5),
            labelAmountCashFlow.leadingAnchor.constraint(equalTo: labelDateCashFlow.leadingAnchor),
            
            stackViewCashFlow.topAnchor.constraint(equalTo: labelAmountCashFlow.bottomAnchor, constant: 10),
            stackViewCashFlow.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackViewCashFlow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            buttonShowMoreCashFlow.topAnchor.constraint(equalTo: stackViewCashFlow.bottomAnchor, constant: 5),
            buttonShowMoreCashFlow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            //            buttonShowMoreCashFlow.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
    
    private func layoutTopExpenses(){
        labelTopExpenses.translatesAutoresizingMaskIntoConstraints = false
        stackViewTopExpenses.translatesAutoresizingMaskIntoConstraints = false
        buttonShowMoreTopExpenses.translatesAutoresizingMaskIntoConstraints = false
        labelDateTopExpenses.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        contentView.addSubview(labelTopExpenses)
        contentView.addSubview(stackViewTopExpenses)
        contentView.addSubview(buttonShowMoreTopExpenses)
        contentView.addSubview(labelDateTopExpenses)
        
        
        NSLayoutConstraint.activate([
            labelTopExpenses.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            labelTopExpenses.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            
            labelDateTopExpenses.topAnchor.constraint(equalTo: labelTopExpenses.bottomAnchor, constant: 10),
            labelDateTopExpenses.leadingAnchor.constraint(equalTo: labelTopExpenses.leadingAnchor),
            
            stackViewTopExpenses.topAnchor.constraint(equalTo: labelDateTopExpenses.bottomAnchor, constant: 10),
            stackViewTopExpenses.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackViewTopExpenses.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            buttonShowMoreTopExpenses.topAnchor.constraint(equalTo: stackViewTopExpenses.bottomAnchor, constant: 5),
            buttonShowMoreTopExpenses.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            //            buttonShowMoreCashFlow.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
    
    private func buttonShowMoreTopExpensesParameters(){
        buttonShowMoreTopExpenses.setAttributedTitle(stringToNSAttributedString(string: "Показать больше", size: 18, weight: .bold, color: .systemBlue), for: .normal)
    }
    
    private func buttonShowMoreCashFlowParameters(){
        buttonShowMoreCashFlow.setAttributedTitle(stringToNSAttributedString(string: "Показать больше", size: 18, weight: .bold, color: .systemBlue), for: .normal)
    }
    
    private func buttonShowMoreLastRecordsParameters(){
        buttonShowMoreLastRecords.setAttributedTitle(stringToNSAttributedString(string: "Показать больше", size: 18, weight: .bold, color: .systemBlue), for: .normal)
    }
    
    private func viewToStackViewCashFLow(stackView: inout UIStackView, maxAmount: Double, totalAmount: Double, title: String, color: UIColor){
        let viewMain = UIView()
        let labelTitle: UILabel = {
            let label = UILabel()
            label.attributedText = stringToNSAttributedString(string: title, size: 15, weight: .bold, color: .black)
            return label
        }()
        
        let labelAmount: UILabel = {
            let label = UILabel()
            label.attributedText = stringToNSAttributedString(string: "\(totalAmount) zł", size: 15, weight: .bold, color: .black)
            return label
        }()
        
        let viewBackground = UIView()
        viewBackground.backgroundColor = .systemGray5
        viewBackground.layer.cornerRadius = 5
        
        let viewLine = UIView()
        viewLine.backgroundColor = color
        viewLine.layer.cornerRadius = 5
        
        viewMain.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelAmount.translatesAutoresizingMaskIntoConstraints = false
        viewBackground.translatesAutoresizingMaskIntoConstraints = false
        viewLine.translatesAutoresizingMaskIntoConstraints = false
        
        viewBackground.addSubview(viewLine)
        viewMain.addSubview(labelTitle)
        viewMain.addSubview(labelAmount)
        viewMain.addSubview(viewBackground)
        stackView.addArrangedSubview(viewMain)
        
        NSLayoutConstraint.activate([
            labelTitle.topAnchor.constraint(equalTo: viewMain.topAnchor, constant: 5),
            labelTitle.leadingAnchor.constraint(equalTo: viewMain.leadingAnchor, constant: 5),
            
            labelAmount.topAnchor.constraint(equalTo: viewMain.topAnchor, constant: 5),
            labelAmount.trailingAnchor.constraint(equalTo: viewMain.trailingAnchor, constant: -5),
            
            viewBackground.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 5),
            viewBackground.leadingAnchor.constraint(equalTo: viewMain.leadingAnchor, constant: 5),
            viewBackground.trailingAnchor.constraint(equalTo: viewMain.trailingAnchor, constant: -5),
            viewBackground.bottomAnchor.constraint(equalTo: viewMain.bottomAnchor, constant: -5),
            viewBackground.heightAnchor.constraint(equalToConstant: 20),
            
            viewLine.topAnchor.constraint(equalTo: viewBackground.topAnchor),
            viewLine.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor),
            viewLine.bottomAnchor.constraint(equalTo: viewBackground.bottomAnchor),
            viewLine.widthAnchor.constraint(equalTo: viewBackground.widthAnchor, multiplier: totalAmount/maxAmount)
            
        ])
        
    }
}

extension DataCollectionViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LastRecordsTableViewCell.id, for: indexPath) as! LastRecordsTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func stringToNSAttributedString(string: String, size: CGFloat, weight: UIFont.Weight, color: UIColor) -> NSMutableAttributedString {
        let ns = NSMutableAttributedString(string: string)
        let range = (ns.string as NSString).range(of: string)
        ns.addAttribute(.font, value: UIFont.systemFont(ofSize: size, weight: weight), range: range)
        ns.addAttribute(.foregroundColor, value: color, range: range)
        return ns
    }
}
