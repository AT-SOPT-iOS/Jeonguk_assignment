//
//  ViewController.swift
//  Week_02
//
//  Created by 정정욱 on 4/25/25.
//

import UIKit

import SnapKit
import Then

class LoginViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let mainLabel = UILabel()
    private let idTextField = UITextField()
    private let passWordTextField = UITextField()
    private let loginButton = UIButton()
    private let findIdButton = UIButton(type: .system)
    private let dividerView = UIView()
    private let findPassWordButton = UIButton(type: .system)
    private let noAccountLabel = UILabel()
    private let createNickNameButton = UIButton(type: .system)
    
    private let findStackView = UIStackView()
    private let accountStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        view.backgroundColor = .black
        
        mainLabel.do {
            $0.text = "TVING ID 로그인"
            $0.textColor = .white
            $0.font = .systemFont(ofSize: 23, weight: .bold)
        }
            
        idTextField.do {
            $0.placeholder = "아이디"
            $0.textColor = .Gray2
            $0.backgroundColor = .Gray4
            $0.layer.cornerRadius = 3
            $0.clipsToBounds = true
            $0.setLeftPadding(amount: 22)
        }
        
        passWordTextField.do {
            $0.placeholder = "비밀번호"
            $0.textColor = .Gray2
            $0.backgroundColor = .Gray4
            $0.layer.cornerRadius = 3
            $0.clipsToBounds = true
            $0.setLeftPadding(amount: 22)
        }
        
        loginButton.do {
            $0.backgroundColor = .black
            $0.setTitle("로그인하기", for: .normal)
            $0.setTitleColor(.Gray2, for: .normal)
            $0.layer.borderColor = UIColor.Gray4.cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 3
            $0.clipsToBounds = true
        }
        
        findIdButton.do {
            $0.setTitle("아이디 찾기", for: .normal)
            $0.setTitleColor(.Gray2, for: .normal)
        }
        
        dividerView.do {
            $0.backgroundColor = .Gray4
        }
        
        findPassWordButton.do {
            $0.setTitle("비밀번호 찾기", for: .normal)
            $0.setTitleColor(.Gray2, for: .normal)
        }
        
        noAccountLabel.do{
            $0.text = "아직 계정이 없으신가요?"
            $0.textColor = .Gray3
            $0.font = .systemFont(ofSize: 14)
        }
        
        createNickNameButton.do {
            $0.setAttributedTitle(NSAttributedString(
                string: "닉네임 만들러가기",
                attributes: [
                    .underlineStyle: NSUnderlineStyle.single.rawValue,
                    .foregroundColor: UIColor.Gray2,
                    .font: UIFont.systemFont(ofSize: 14)
                ]
            ), for: .normal)
        }
        
        findStackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.distribution = .equalSpacing
            $0.spacing = 36
        }
        
        accountStackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.distribution = .equalSpacing
            $0.spacing = 36
        }
        
    }
    
    private func setUI() {
        view.addSubviews(scrollView)
        scrollView.addSubview(contentView)
        
        // 스택뷰 내부에 구성 요소 넣기
        findStackView.addArrangedSubview(findIdButton)
        findStackView.addArrangedSubview(dividerView)
        findStackView.addArrangedSubview(findPassWordButton)
        
        accountStackView.addArrangedSubview(noAccountLabel)
        accountStackView.addArrangedSubview(createNickNameButton)
        
        contentView.addSubviews(
            mainLabel,
            idTextField,
            passWordTextField,
            loginButton,
            findStackView,
            accountStackView
        )
        
       
    }
    
    private func setLayout() {
       
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview() // 상하좌우 모두 view에 맞게
        }

        // 2. contentView는 scrollView의 contentLayoutGuide에 맞게 설정
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide) // 스크롤 가능한 영역
            $0.width.equalTo(scrollView.frameLayoutGuide)   // 스크롤 뷰의 가시영역과 너비를 동일하게!
            $0.bottom.equalTo(accountStackView.snp.bottom).offset(20) // 중요! 마지막 UI 컴포넌트 바텀이랑 연결해줘야 스크롤 가능 
        }
        
        mainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(90)
            $0.leading.trailing.equalToSuperview().offset(110)
            $0.width.equalTo(156)
            $0.height.equalTo(37)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(31)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        passWordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passWordTextField.snp.bottom).offset(21)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        dividerView.snp.makeConstraints {
            $0.width.equalTo(1)
            $0.height.equalTo(10)
        }
        /*
        
         제거해도 StackView가 알아서 내부 콘텐츠 크기에 따라 조절해줘요.
        findIdButton.snp.makeConstraints {
            $0.width.equalTo(62)
        }
        
        findPassWordButton.snp.makeConstraints {
            $0.width.equalTo(73)
        }
         */
        
        findStackView.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
            // $0.leading.trailing.equalToSuperview().inset(70) : 작은 화면에서는 텍스트가 잘릴 위험이 있어요.
            $0.centerX.equalToSuperview()
        }
        
        accountStackView.snp.makeConstraints {
            $0.top.equalTo(findStackView.snp.bottom).offset(28)
            $0.centerX.equalToSuperview()
        }
        
    }

}

