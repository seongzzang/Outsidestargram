//
//  FeedController.swift
//  Outsidestargram
//
//  Created by 양성혜 on 2022/12/19.
//

import UIKit
import SnapKit

class FeedController: UIViewController {

    private lazy var scrollView = UIScrollView()
    
    
    let feedScrollView = FeedScrollViewCell(frame: .zero)
    let feedView = FeedViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func setupTableView() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        scrollView.addSubview(feedScrollView)
        feedScrollView.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.top).offset(5.0)
            $0.leading.equalTo(scrollView).offset(5.0)
            $0.trailing.equalTo(scrollView).offset(5.0)
            $0.bottom.equalTo(scrollView.snp.bottom).offset(5.0)
        }
        
//        view.addSubview(tableView)
//        tableView.snp.makeConstraints {
//            $0.top.equalTo(scrollView.snp.bottom).inset(5.0)
//            $0.bottom.equalToSuperview()
//            $0.leading.equalToSuperview()
//            $0.trailing.equalToSuperview()
//        }
    }
    
}
