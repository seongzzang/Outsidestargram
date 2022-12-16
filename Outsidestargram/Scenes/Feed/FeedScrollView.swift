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
        imageView.backgroundColor = .red
        
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .light)
        label.text = "name"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupLayout()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension FeedScrollView {
    func setupLayout(){
        
        [imageView, nameLabel].forEach { addSubview($0)}
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5.0)
            $0.leading.equalToSuperview().offset(5.0)
            $0.trailing.equalToSuperview().offset(5.0)
            $0.height.equalTo(50)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(3.0)
            $0.leading.equalTo(imageView)
            $0.bottom.equalToSuperview()
        }
    }
}
