//
//  FeedScrollView.swift
//  Outsidestargram
//
//  Created by 양성혜 on 2022/12/10.
//

import UIKit
import SnapKit

class FeedScrollViewCell: UIView {
    
    private lazy var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .secondaryLabel
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 25
        
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

private extension FeedScrollViewCell {
    func setupLayout(){
        
        [imageView, nameLabel].forEach { addSubview($0)}
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(5.0)
            $0.leading.equalToSuperview().inset(5.0)
            $0.trailing.equalToSuperview().inset(5.0)
            $0.height.equalTo(50)
            $0.width.equalTo(50)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(3.0)
            //$0.leading.equalTo(imageView)
            $0.centerX.equalTo(imageView.snp.centerX)
            $0.bottom.equalToSuperview()
        }
    }
}
