//
//  ProfileCollectionViewCell.swift
//  Outsidestargram
//
//  Created by 양성혜 on 2022/11/19.
//

import SnapKit
import UIKit
import Kingfisher

final class ProfileCollectionViewCell: UICollectionViewCell {
    private let imageView = UIImageView()
    
    func setup(with image: UIImage) {
        addSubview(imageView)
        imageView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        imageView.backgroundColor = .tertiaryLabel
        
    }
    
    func getImage(with url: URL){
        if url != nil {
            imageView.kf.setImage(with: url)
        }
    }
}
