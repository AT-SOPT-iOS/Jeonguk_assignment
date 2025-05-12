//
//  PopularMovieCell.swift
//  Week_03
//
//  Created by 정정욱 on 5/2/25.
//

import UIKit

final class PopularMovieCell: UICollectionViewCell {
    
    
    // MARK: - Properties
    
    static let identifier = PopularMovieCell.className
    
    // MARK: - UI Components
    var movieImage = UIImageView()
    
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
        contentView.addSubviews(movieImage)
        
        movieImage.do {
            $0.contentMode = .scaleAspectFill
            $0.layer.cornerRadius = 3
            $0.clipsToBounds = true
        }
    }
    
    // MARK: - SetLayout
    
    private func setLayout() {
        movieImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension PopularMovieCell {
    func configure(image: UIImage?) {
        movieImage.image = image
    }
}
