//
//  BannerCell.swift
//  Week_03
//
//  Created by 정정욱 on 5/1/25.
//

import UIKit

final class BannerCell: UICollectionViewCell {
    
    
    // MARK: - Properties
    
    static let identifier = "BannerCell"
    
    // MARK: - UI Components
    var bannerImage = UIImageView()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetUI
    
    private func setUI() {
        contentView.addSubview(bannerImage)
        bannerImage.do {
            $0.contentMode = .scaleAspectFill 
            $0.clipsToBounds = true           // 넘치는 이미지 잘라내기
        }
    }
    
    // MARK: - SetLayout
    
    private func setLayout() {
        bannerImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
            //CompositionalLayout에서 설정한 itemSize에 따라 자동으로 크기가 맞춰주기
        }
    }
}

extension BannerCell {
    func configure(image: UIImage) {
         bannerImage.image = image
     }
}
