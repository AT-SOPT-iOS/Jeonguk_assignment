//
//  TvingMainHeaderView.swift
//  Week_03
//
//  Created by 정정욱 on 5/2/25.
//


import UIKit
import SnapKit
import Then


final class TvingMainHeaderView: UICollectionReusableView {
    
    static let elementKind = "\(TvingMainHeaderView.className)-element-kind"
    static let identifier = TvingMainHeaderView.className

    private let logoImageView = UIImageView()
    private let searchButton = UIButton()
    private let iconImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - Setup
    
    private func setupUI() {
        logoImageView.image = ImageLiterals.tiving_MainImage
        searchButton.setImage(ImageLiterals.tiving_SearchIcon, for: .normal)
        iconImageView.image = ImageLiterals.tiving_MainIcon

        addSubviews(logoImageView, searchButton, iconImageView)
    }

    private func setupLayout() {
        logoImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(6)
            $0.width.equalTo(191)
            $0.height.equalTo(78)
        }

        iconImageView.snp.makeConstraints {
            $0.centerY.equalTo(logoImageView)
            $0.trailing.equalToSuperview().inset(11)
            $0.width.height.equalTo(30)
        }

        searchButton.snp.makeConstraints {
            $0.centerY.equalTo(logoImageView)
            $0.trailing.equalTo(iconImageView.snp.leading).offset(-10)
            $0.width.height.equalTo(30)
        }
    }
}
