//
//  TabBarController.swift
//  Outsidestargram
//
//  Created by 양성혜 on 2022/11/16.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let feedViewController = UINavigationController(rootViewController: FeedTotalViewController())
        feedViewController.tabBarItem = UITabBarItem(title: nil,
                                                     image: UIImage(systemName: "house"),
                                                     selectedImage: UIImage(systemName: "house.fill"))
        
        let profileViewController = UINavigationController(rootViewController: ProfileViewController())
        profileViewController.tabBarItem = UITabBarItem(title: nil,
                                                        image: UIImage(systemName: "person"),
                                                        selectedImage: UIImage(systemName: "person.fill"))
        
        
        viewControllers = [feedViewController, profileViewController]
    }
}
