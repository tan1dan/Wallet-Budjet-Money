//
//  TabBarController.swift
//  WalletBudgetAndMoney
//
//  Created by Иван Знак on 01/05/2024.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        delegate = self
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setupTabs(){
        self.setViewControllers([], animated: false)
        self.tabBar.tintColor = .black
        self.tabBar.unselectedItemTintColor = .systemGray2
        let mainVC = MainViewController()
        let statiisticsVC: UIViewController = {
            let vc = StatisticsViewController()
            return vc
        }()
        
        let changeBalanceVC: UIViewController = {
            let vc = ChangeBalanceViewController()
            
            return vc
        }()
        
        
        let main = createNav(image: UIImage(systemName: "house"), title: "Главная",
                             vc: mainVC)
        let changeBalance = createNav(image: UIImage(systemName: "plus.circle"), title: "Добавить", vc: changeBalanceVC)
        let statistics = createNav(image: UIImage(systemName: "x.squareroot"), title: "Статистика" ,vc: statiisticsVC)
        
        self.setViewControllers([main, changeBalance, statistics], animated: true)
    }
    
    private func createNav(image: UIImage?, title: String? = nil, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        if let title = title {
            nav.tabBarItem.title = title
        }
        nav.tabBarItem.image = image
        nav.setNavigationBarHidden(true, animated: false)
        return nav
    }
    
}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if tabBarController.viewControllers?[1] == viewController {
            navigationController?.pushViewController(ChangeBalanceViewController(), animated: false)
            navigationController?.setNavigationBarHidden(false, animated: false)
            return false
        }
        return true
    }
}
