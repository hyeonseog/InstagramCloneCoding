//
//  TabBarCotroller.swift
//  InstagramClone
//
//  Created by 현석의 맥북 on 8/21/24.
//

import Foundation
import UIKit
import SnapKit
import Then

class TabBarCotroller: UITabBarController {
    let feedViewController = UINavigationController(rootViewController: FeedViewController())
    
    let profileViewController = UINavigationController(rootViewController: ProfileViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        feedViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill"))
        
        profileViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fill")
        )
        
        viewControllers = [feedViewController, profileViewController]
    }
}
