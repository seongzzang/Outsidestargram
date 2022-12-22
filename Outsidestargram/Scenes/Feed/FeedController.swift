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
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        tableView.dataSource = self
        
        tableView.register(FeedScrollViewCell.self, forCellReuseIdentifier: "FeedScrollViewCell")
        
        return tableView
    }()
    
    let feedView = FeedViewController(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
}

extension FeedController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedScrollViewCell", for: indexPath) as? FeedScrollViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.setupLayout()
        
        return cell
    }
    
}

extension FeedController: UITableViewDelegate {
    
}

private extension FeedController {
    
    func setupTableView() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        scrollView.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.top).offset(5.0)
            $0.leading.equalTo(scrollView).offset(5.0)
            $0.trailing.equalTo(scrollView).offset(5.0)
            $0.bottom.equalTo(scrollView.snp.bottom).offset(5.0)
        }
        
        view.addSubview(feedView)
//        view.addSubview(tableView)
//        tableView.snp.makeConstraints {
//            $0.top.equalTo(scrollView.snp.bottom).inset(5.0)
//            $0.bottom.equalToSuperview()
//            $0.leading.equalToSuperview()
//            $0.trailing.equalToSuperview()
//        }
    }
}

