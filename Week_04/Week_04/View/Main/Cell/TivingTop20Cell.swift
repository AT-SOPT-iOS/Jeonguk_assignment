//
//  TivingTop20Cell.swift
//  Week_03
//
//  Created by 정정욱 on 5/1/25.
//

import UIKit

final class TivingTop20Cell: UICollectionViewCell {
    
    
    // MARK: - Properties
    
    static let identifier = TivingTop20Cell.className
    
    // MARK: - UI Components
    var top20Rank = UILabel()
    var top20Image = UIImageView()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetUI
    
    private func setUI() {
        contentView.addSubviews(top20Rank, top20Image)
    }
    
    // MARK: - SetStyle
    
    private func setStyle() {
        top20Rank.do {
            $0.font = .boldItalicSystemFont(ofSize: 50)
            $0.textColor = .white
        }
        
        top20Image.do {
            $0.contentMode = .scaleAspectFill
            $0.layer.cornerRadius = 3
            $0.clipsToBounds = true
        }
    }
    
    // MARK: - SetLayout
    
    private func setLayout() {
        
        top20Rank.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalTo(top20Image.snp.bottom)
        }
        
        top20Image.snp.makeConstraints {
            $0.leading.equalTo(top20Rank.snp.trailing).offset(3)
            $0.top.trailing.equalToSuperview()
            $0.width.equalTo(98)
            $0.height.equalTo(146) // 고정 높이 또는 레이아웃에서 estimated 높이일 경우 자동 설정
        }
    }
}

extension TivingTop20Cell {
    func configure(rank: String, image: UIImage?) {
        top20Rank.text = rank
        top20Image.image = image
    }
}
