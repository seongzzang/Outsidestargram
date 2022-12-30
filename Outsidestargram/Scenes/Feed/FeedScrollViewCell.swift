//
//  FeedScrollView.swift
//  Outsidestargram
//
//  Created by 양성혜 on 2022/12/10.
//

import UIKit
import SnapKit

final class FeedScrollViewCell: UITableViewCell {
    
    private lazy var liveImageView: UIImageView = {
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
    
    func setupLayout(){
        
        [liveImageView, nameLabel].forEach { addSubview($0)}
        
        liveImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(5.0)
            $0.leading.equalToSuperview().inset(5.0)
            $0.trailing.equalToSuperview().inset(5.0)
            $0.height.equalTo(50)
            $0.width.equalTo(50)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(liveImageView.snp.bottom).offset(3.0)
            $0.leading.equalTo(liveImageView)
            $0.centerX.equalTo(liveImageView.snp.centerX)
            $0.bottom.equalToSuperview()
        }
    }
}
