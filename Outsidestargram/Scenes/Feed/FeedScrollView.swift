//
//  FeedScrollView.swift
//  Outsidestargram
//
//  Created by 양성혜 on 2022/12/10.
//

import UIKit
import SnapKit

class FeedScrollView: UIView {
    
    private lazy var imageView: UIImageView = {
       let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 8.0, weight: .light)
        label.text = "name"
        return label
    }()
}

private extension FeedScrollView {
    func setupLayout(){
        [imageView, nameLabel].forEach { addSubview($0)}
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8.0)
            $0.leading.equalToSuperview().inset(8.0)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(3.0)
            $0.leading.equalTo(imageView)
            $0.bottom.equalToSuperview()
        }
    }
}
