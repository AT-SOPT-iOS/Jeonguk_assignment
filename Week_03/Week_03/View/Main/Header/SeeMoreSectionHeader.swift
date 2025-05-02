//
//  SeeMoreSectionHeader.swift
//  Week_03
//
//  Created by 정정욱 on 5/2/25.
//

import UIKit
import SnapKit

final class SeeMoreSectionHeader: UICollectionReusableView {
    
    static let elementKind = "SeeMoreSection-header-element-kind"
    static let identifier = "SeeMoreSectionHeaderView"
    
    private let titleLabel = UILabel()
    private let seeMoreButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        titleLabel.font = .boldSystemFont(ofSize: 15)
        titleLabel.textColor = .white
        
        seeMoreButton.setTitle("더보기", for: .normal)
        seeMoreButton.setTitleColor(.gray, for: .normal)
        seeMoreButton.titleLabel?.font = .boldSystemFont(ofSize: 12)

        addSubviews(titleLabel, seeMoreButton)
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        seeMoreButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview().inset(4)
        }

    }
    
    func configure(title: String) {
        titleLabel.text = title
    }
}
