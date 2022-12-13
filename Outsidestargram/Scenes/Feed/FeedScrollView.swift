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
        
    }
}
