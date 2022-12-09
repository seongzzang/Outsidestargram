//
//  ProfileData.swift
//  Outsidestargram
//
//  Created by 양성혜 on 2022/12/09.
//

import Foundation

struct ProfileData: Decodable {
    // let image: UIImage
    let title: String
    let description: String
    let likeNum: Int
}
