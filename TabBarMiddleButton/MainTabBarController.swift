//
//  MainTabBarController.swift
//  TabBarMiddleButton
//
//  Created by SimbirSoft on 21.03.2021.
//

import UIKit

final class MainTabBarController: UITabBarController {
    // MARK: - Properties
    
    private let middleButtonDiameter: CGFloat = 42
    private let redColor: UIColor = UIColor(red: 254.0 / 255.0, green: 116.0 / 255.0, blue: 96.0 / 255.0, alpha: 1.0)
    private let greenColor: UIColor = UIColor(red: 102.0 / 255.0, green: 166.0 / 255.0, blue: 54.0 / 255.0, alpha: 1.0)
    
    private lazy var middleButton: UIButton = {
        let middleButton = UIButton()
        middleButton.layer.cornerRadius = middleButtonDiameter / 2
        middleButton.backgroundColor = redColor
        middleButton.translatesAutoresizingMaskIntoConstraints = false
        middleButton.addTarget(self, action: #selector(didPressMiddleButton), for: .touchUpInside)
        return middleButton
    }()
    
    private lazy var heartImageView: UIImageView = {
        let heartImageView = UIImageView()
        heartImageView.image = UIImage(systemName: "heart.fill")
        heartImageView.tintColor = .white
        heartImageView.translatesAutoresizingMaskIntoConstraints = false
        return heartImageView
    }()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    // MARK: - UI Setup
    
    private func makeUI() {
        // 1
        tabBar.addSubview(middleButton)
        middleButton.addSubview(heartImageView)
        
        // 2
        NSLayoutConstraint.activate([
            // 2.1
            middleButton.heightAnchor.constraint(equalToConstant: middleButtonDiameter),
            middleButton.widthAnchor.constraint(equalToConstant: middleButtonDiameter),
            // 2.2
            middleButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            middleButton.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -10)
        ])
        
        // 3
        NSLayoutConstraint.activate([
            // 3.1
            heartImageView.heightAnchor.constraint(equalToConstant: 15),
            heartImageView.widthAnchor.constraint(equalToConstant: 18),
            // 3.2
            heartImageView.centerXAnchor.constraint(equalTo: middleButton.centerXAnchor),
            heartImageView.centerYAnchor.constraint(equalTo: middleButton.centerYAnchor)
        ])
        
        // 1
        let firstVC = UIViewController()
        firstVC.view.backgroundColor = .yellow
        firstVC.tabBarItem.title = "First VC"
        firstVC.tabBarItem.image = UIImage(systemName: "1.circle")
        
        // 2
        let middleVC = UIViewController()
        middleVC.view.backgroundColor = .green
        middleVC.tabBarItem.title = "Middle VC"
        
        // 3
        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .blue
        secondVC.tabBarItem.title = "Second VC"
        secondVC.tabBarItem.image = UIImage(systemName: "2.circle")
        
        // 4
        viewControllers = [firstVC, middleVC, secondVC]
    }
    
    // MARK: - Selectors
    
    @objc
    private func didPressMiddleButton() {
        selectedIndex = 1
        middleButton.backgroundColor = greenColor
    }
}

// MARK: - UITabBarControllerDelegate

extension MainTabBarController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let selectedIndex = self.tabBar.items?.firstIndex(of: item) // 1
        if selectedIndex == 1 { // 2
            middleButton.backgroundColor = greenColor // 3
        } else {
            middleButton.backgroundColor = redColor // 4
        }
    }
}
