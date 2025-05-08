//
//  TabBarCell.swift
//  Week_03
//
//  Created by 정정욱 on 5/2/25.
//

import UIKit
import SnapKit
import Then

final class TabBarCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "TabBarCell"
    
    // MARK: - UI Components
    private let titleLabel = UILabel()
    private let underlineView = UIView()

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
        setupStyle()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup
    private func setupUI() {
        contentView.addSubviews(titleLabel, underlineView)
    }

    private func setupLayout() {
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        underlineView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(13)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(15)
            $0.height.equalTo(3)
        }
    }

    private func setupStyle() {
        titleLabel.do {
            $0.font = .systemFont(ofSize: 17, weight: .medium)
            $0.textColor = .white
        }

        underlineView.do {
            $0.backgroundColor = .white
            $0.isHidden = true // 기본은 숨김
        }
    }

    // MARK: - Configure
    func configure(title: String, isSelected: Bool) {
        titleLabel.text = title
        underlineView.isHidden = !isSelected
        titleLabel.textColor = isSelected ? .white : .lightGray
    }
}
