//
//  FeedViewController.swift
//  Outsidestargram
//
//  Created by 양성혜 on 2022/11/16.
//

import UIKit
import SnapKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
    }

}

private extension FeedViewController {

    func setupNavigationBar() {
        navigationItem.title = "Outsidestargram"
        
        let uploadButton = UIBarButtonItem(image: UIImage(systemName: "plus.app"),
                                           style: .plain,
                                           target: self,
                                           action: nil)
        navigationItem.rightBarButtonItem = uploadButton
        
    }
}

