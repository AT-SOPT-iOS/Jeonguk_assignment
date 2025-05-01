//
//  SectionHeaderView.swift
//  Week_03
//
//  Created by 정정욱 on 5/1/25.
//

import UIKit
import SnapKit

final class SectionHeaderView: UICollectionReusableView {
    
    static let elementKind = "section-header-element-kind" // CompositionalLayout 등록 시 필요
    static let identifier = "SectionHeaderView"            // reuseIdentifier
    
    private let titleLabel = UILabel()
    
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
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
        }

    }
    
    func configure(title: String) {
        titleLabel.text = title
    }
}
