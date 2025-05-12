//
//  PopularLiveCell.swift
//  Week_03
//
//  Created by 정정욱 on 5/2/25.
//

import UIKit

final class PopularLiveCell: UICollectionViewCell {
    
    
    // MARK: - Properties
    
    static let identifier = PopularLiveCell.className
    
    // MARK: - UI Components
    
    private var popularLiveImage = UIImageView()
    private var popularLiveRank = UILabel()
    
    private var channelLabel = UILabel()
    private let episodeLabel = UILabel()
    private let ratingLabel = UILabel()
    
    private let infoStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 1
        $0.alignment = .leading
    }

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

        infoStackView.addArrangedSubview(channelLabel)
        infoStackView.addArrangedSubview(episodeLabel)
        infoStackView.addArrangedSubview(ratingLabel)

        contentView.addSubviews(popularLiveRank, popularLiveImage, infoStackView)
    }
    
    // MARK: - SetStyle
    
    private func setStyle() {
        popularLiveImage.do {
            $0.contentMode = .scaleAspectFill
            $0.layer.cornerRadius = 3
            $0.clipsToBounds = true
        }
        
        popularLiveRank.do {
            $0.font = .boldItalicSystemFont(ofSize: 19)
            $0.textColor = .white
        }
        
        channelLabel.do {
            $0.font = .boldSystemFont(ofSize: 10)
            $0.textColor = .white
        }
        
        episodeLabel.do {
            $0.font = .boldSystemFont(ofSize: 10)
            $0.textColor = .Gray2
        }
        
        ratingLabel.do {
            $0.font = .boldSystemFont(ofSize: 10)
            $0.textColor = .Gray2
        }
    }
    
    // MARK: - SetLayout
    
    private func setLayout() {
        
        popularLiveImage.snp.makeConstraints {
            $0.leading.top.trailing.equalToSuperview()
            $0.width.equalTo(160)
            $0.height.equalTo(80)
        }
        
        popularLiveRank.snp.makeConstraints {
            $0.top.equalTo(popularLiveImage.snp.bottom).offset(7)
            $0.leading.equalTo(popularLiveImage.snp.leading).offset(6)
        }
        
        infoStackView.snp.makeConstraints {
            $0.top.equalTo(popularLiveImage.snp.bottom).offset(7)
            $0.leading.equalTo(popularLiveRank.snp.trailing).offset(6)
        }
        
    }
}

extension PopularLiveCell {
    func configure(image: UIImage?, rank: String, channel: String, episode: String, rating: String) {
        popularLiveImage.image = image
        popularLiveRank.text = rank
        channelLabel.text = channel
        episodeLabel.text = episode
        ratingLabel.text = "\(rating)%"
    }
}
