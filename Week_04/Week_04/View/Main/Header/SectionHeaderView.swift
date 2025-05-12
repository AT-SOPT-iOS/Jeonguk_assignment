//
//  SectionHeaderView.swift
//  Week_03
//
//  Created by 정정욱 on 5/1/25.
//

import UIKit
import SnapKit

final class SectionHeaderView: UICollectionReusableView {
    
    static let elementKind = "\(SectionHeaderView.className)-element-kind"
    static let identifier = SectionHeaderView.className
    
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
        titleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

    }
    
    func configure(title: String) {
        titleLabel.text = title
    }
}
