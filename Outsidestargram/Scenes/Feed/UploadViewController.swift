//
//  UploadViewController.swift
//  Outsidestargram
//
//  Created by 양성혜 on 2022/11/17.
//

import UIKit
import SnapKit

final class UploadViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setupNavigationItem()
    }
}

private extension UploadViewController {
    func setupNavigationItem() {
        navigationItem.title = "새 게시물"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "취소",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(didTapLeftButton))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "공유",
                                                           style: .plain,
                                                           target: self,
                                                            action: #selector(didTapRgihtButton))
    }
    
    @objc func didTapLeftButton() {
        dismiss(animated: true)
    }
    
    @objc func didTapRgihtButton() {
        dismiss(animated: true)
    }
}
