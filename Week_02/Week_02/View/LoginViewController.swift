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
        setDelegate()
    }
    
    private func setStyle() {
        view.backgroundColor = .black
        
        mainLabel.do {
            $0.text = "TVING ID 로그인"
            $0.textColor = .white
            $0.font = .systemFont(ofSize: 23, weight: .bold)
        }
        
        idTextField.do {
            $0.attributedPlaceholder = NSAttributedString(
                string: "아이디",
                attributes: [
                    .foregroundColor: UIColor.Gray2,
                ]
            )
            $0.textColor = .Gray2
            $0.backgroundColor = .Gray4
            $0.layer.cornerRadius = 3
            $0.clipsToBounds = true
            $0.setLeftPadding(amount: 22)
        }
        
        passWordTextField.do {
            $0.attributedPlaceholder = NSAttributedString(
                string: "비밀번호",
                attributes: [
                    .foregroundColor: UIColor.Gray2,
                ]
            )
            $0.textColor = .Gray2
            $0.backgroundColor = .Gray4
            $0.layer.cornerRadius = 3
            $0.clipsToBounds = true
            $0.setLeftPadding(amount: 22)
            $0.isSecureTextEntry = true // 비밀번호 필드 설정 필수!
        }
        
        configurePasswordToggle()
        
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
    
    private func configurePasswordToggle() {
        // 1. 눈 버튼
        let eyeButton = UIButton(type: .custom)
        eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        eyeButton.tintColor = .Gray3
        eyeButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        eyeButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        
        // 2. X 버튼
        let clearButton = UIButton(type: .custom)
        clearButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        clearButton.tintColor = .Gray3
        clearButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        clearButton.addTarget(self, action: #selector(clearPasswordText), for: .touchUpInside)
        
        // 3. StackView로 두 버튼 정렬
        let stack = UIStackView(arrangedSubviews: [clearButton, eyeButton])
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .center
        stack.isLayoutMarginsRelativeArrangement = true // 패딩주기 스택 기본적으로 내부 패딩을 무시해서 활성화 필요
        stack.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 22) // 내부 여백 설정 Inset임 
        
        // container : 스택에 여백을 주기 위해 만든것
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        stack.frame = container.bounds // StackView를 container의 전체 크기에 맞게 확장시켜줌.
        container.addSubview(stack)
        
        passWordTextField.rightView = container
        passWordTextField.rightViewMode = .whileEditing // 편집 중 일때만 보이게
        
    }
    
    @objc private func togglePasswordVisibility(_ sender: UIButton) {
        passWordTextField.isSecureTextEntry.toggle()
        let imageName = passWordTextField.isSecureTextEntry ? "eye.slash" : "eye"
        sender.setImage(UIImage(systemName: imageName), for: .normal) // sender는 연결된 (클린된) 해당 버튼 자체를 말함
    }
    
    @objc private func clearPasswordText() {
        passWordTextField.text = ""
    }
    
}

extension LoginViewController {
    func setDelegate() {
        idTextField.delegate = self
        passWordTextField.delegate = self
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.Gray2.cgColor
        textField.layer.borderWidth = 1
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.Gray4.cgColor
        textField.layer.borderWidth = 1
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == passWordTextField {
            let currentText = textField.text ?? ""
            guard let stringRange = Range(range, in: currentText) else { return false }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            return updatedText.count <= 8
        }
        return true
    }
    
}


