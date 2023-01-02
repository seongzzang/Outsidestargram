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
    
    private lazy var imagePickerController: UIImagePickerController = {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = true
        
        return imagePickerController
    }()
    
    let feedView = FeedViewController(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
    }
    
}

extension FeedController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didTapScrollView()
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

extension FeedController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var selectImage: UIImage?
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            selectImage = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectImage = originalImage
        }
        
        print(selectImage)
        
        picker.dismiss(animated: true) { [weak self] in
            let uploadViewController = UploadViewController(uploadImage: selectImage ?? UIImage())
            let navigationController = UINavigationController(rootViewController: uploadViewController)
            navigationController.modalPresentationStyle = .fullScreen
            
            self?.present(navigationController, animated: true)
        }
    }
}

private extension FeedController {
    
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
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            //$0.width.equalTo(400)
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
        feedView.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.bottom).inset(5.0)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
    
    func didTapScrollView() {
        print("select scroll view")
    }
}

