//
//  NoticeCell.swift
//  Week_03
//
//  Created by 정정욱 on 5/2/25.
//

import UIKit
import SnapKit
import Then

final class NoticeCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "NoticeCell"
    
    // MARK: - UI Components
    private let noticeLabel = UILabel()
    private let noticeContentLabel = UILabel()
    private let arrowImageView = UIImageView()
    private let containerView = UIView()
    
    private let customerInquiryButton = UIButton()
    private let termsOfuseButton = UIButton()
    private let privacyPolicyButton = UIButton()
    private let businessInformationButton = UIButton()
    private let recruitmentButton = UIButton()
    private let totalStackView = UIStackView()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupStack()
        setStyle()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup
    private func setupUI() {
        containerView.addSubviews(noticeLabel, noticeContentLabel, arrowImageView)
        contentView.addSubviews(containerView, totalStackView)
    }
    
    private func setupStack() {

        // 첫 줄 버튼 및 구분점
        let linkItems1 = [customerInquiryButton, termsOfuseButton, privacyPolicyButton]
        let linkStackView1 = makeLinkStackView(with: linkItems1)

        // 둘째 줄 버튼 및 구분점
        let linkItems2 = [businessInformationButton, recruitmentButton]
        let linkStackView2 = makeLinkStackView(with: linkItems2)

        // 전체 세로 스택
        totalStackView.axis = .vertical
        totalStackView.spacing = 0
        totalStackView.distribution = .fill 
        totalStackView.alignment = .leading
        totalStackView.addArrangedSubview(linkStackView1)
        totalStackView.addArrangedSubview(linkStackView2)
    }
    
    private func setStyle() {
        containerView.do {
            $0.backgroundColor = .Gray21
            $0.layer.cornerRadius = 5
            $0.clipsToBounds = true
        }
        
        noticeLabel.do {
            $0.font = .systemFont(ofSize: 11)
            $0.text = "공지"
            $0.textColor = .Gray8C
        }
        
        noticeContentLabel.do {
            $0.font = .systemFont(ofSize: 11)
            $0.text = "티빙 계정 공유 정책 추가 안내"
            $0.textColor = .GrayD9
        }
        
        arrowImageView.do {
            $0.image = UIImage(systemName: "chevron.right")
            $0.tintColor = .white
            $0.contentMode = .scaleAspectFit
        }
        
        customerInquiryButton.do {
            $0.titleLabel?.font = .systemFont(ofSize: 11)
            $0.setTitleColor(.Gray8C, for: .normal)
            $0.setTitle("고객문의", for: .normal)
        }
        
        termsOfuseButton.do {
            $0.titleLabel?.font = .systemFont(ofSize: 11)
            $0.setTitleColor(.Gray8C, for: .normal)
            $0.setTitle("이용약관", for: .normal)
        }
        
        privacyPolicyButton.do {
            $0.titleLabel?.font = .systemFont(ofSize: 11)
            $0.setTitleColor(.GrayD9, for: .normal)
            $0.setTitle("개인정보처리방침", for: .normal)
        }
        
        businessInformationButton.do {
            $0.titleLabel?.font = .systemFont(ofSize: 11)
            $0.setTitleColor(.Gray8C, for: .normal)
            $0.setTitle("사업자정보", for: .normal)
        }
        
        recruitmentButton.do {
            $0.titleLabel?.font = .systemFont(ofSize: 11)
            $0.setTitleColor(.Gray8C, for: .normal)
            $0.setTitle("인재채용", for: .normal)
        }

    }
    
    private func setupLayout() {
        containerView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        noticeLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(17)
        }
        
        noticeContentLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(noticeLabel.snp.trailing).offset(8)
        }
        
        arrowImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
            $0.width.height.equalTo(18)
        }
        
        totalStackView.snp.makeConstraints {
            $0.top.equalTo(containerView.snp.bottom).offset(13)
            $0.leading.equalTo(containerView.snp.leading).offset(6)
            $0.height.equalTo(40)
        }

    }
    
    private func makeLinkStackView(with buttons: [UIButton]) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 3
        stack.alignment = .center

        for (index, button) in buttons.enumerated() {
            stack.addArrangedSubview(button)
            if index < buttons.count - 1 {
                let dotView = UIView()
                dotView.backgroundColor = .gray
                dotView.layer.cornerRadius = 1.5
                dotView.snp.makeConstraints { $0.width.height.equalTo(3) } // 지름 5
                stack.addArrangedSubview(dotView)
            }
        }
        return stack
    }

}
