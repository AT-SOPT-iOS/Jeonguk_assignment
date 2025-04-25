//
//  DetailViewController.swift
//  Week_02
//
//  Created by 정정욱 on 4/26/25.
//

import UIKit

import SnapKit
import Then

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let tvingImageView: UIImageView = UIImageView()
    private let userInfoLabel: UILabel = UILabel()
    private let backToMainButton: UIButton = UIButton()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setStyle()
        setUI()
        setLayout()
    }
    
    // MARK: - Layout
    
    private func setStyle() {
        view.backgroundColor = .black
        
        tvingImageView.do {
            $0.image = .tivingLogo
        }
        
        userInfoLabel.do {
            $0.text = "qweqew@.com님 \n반가워요!"
            $0.textColor = .white
        }
        
        backToMainButton.do {
            $0.backgroundColor = .TvingRed
            $0.setTitle("메인으로", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.layer.cornerRadius = 3
            $0.clipsToBounds = true
        }
    }
    
    private func setUI() {
         view.addSubviews(tvingImageView, userInfoLabel, backToMainButton)
    }
    
    private func setLayout() {
        tvingImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(0)
            $0.height.equalTo(210)
        }
        
        userInfoLabel.snp.makeConstraints {
            $0.top.equalTo(tvingImageView.snp.bottom).offset(67)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        backToMainButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(67)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }
}
