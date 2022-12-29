//
//  FeedViewController.swift
//  Outsidestargram
//
//  Created by 양성혜 on 2022/11/16.
//

import UIKit
import SnapKit

class FeedViewController: UIView {
 
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        tableView.dataSource = self
        
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: "FeedTableViewCell")
        
        return tableView
    }()
    
    private lazy var imagePickerController: UIImagePickerController = {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = true
        
        return imagePickerController
    }()

    override init(frame: CGRect) {
        setupNavigationBar()
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.setup()
        
        return cell
    }
}

private extension FeedViewController {

    func setupNavigationBar() {
        navigationItem.title = "Outsidestargram"
        
        let uploadButton = UIBarButtonItem(image: UIImage(systemName: "plus.app"),
                                           style: .plain,
                                           target: self,
                                           action: #selector(didTapUploadButton))
        navigationItem.rightBarButtonItem = uploadButton
    }
    
    @objc func didTapUploadButton() {
        present(imagePickerController, animated: true)
    }
    
    func setupTableView() {
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(5.0)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
}

