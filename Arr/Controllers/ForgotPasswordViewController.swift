//
//  ForgotPasswordViewController.swift
//  Arr
//
//  Created by 노연주 on 2021/09/01.
//

import UIKit
import SnapKit
import Then

class ForgotPasswordViewController: UIViewController{
    //MARK: - Properties
    
    lazy var titleLine = UIView().then {
        $0.backgroundColor = .rgb(red: 255, green: 214, blue: 214)
    }
    
    lazy var titleLabel = UILabel().then {
        $0.text = "비밀번호 변경하기"
        $0.textColor = .rgb(red: 255, green: 135, blue: 133)
        $0.dynamicFont(fontSize: 23, currentFontName: "SeoulNamsanM")
    }

    lazy var idContainer = SignUpTextFieldView()
    
    lazy var nameContainer = SignUpTextFieldView().then {
        $0.tfTitle.text = "이름"
        $0.tf.placeholder = "실명을 입력해주세요"
    }
    
    lazy var phoneNumContainer = SignUpTextFieldView().then {
        $0.tfTitle.text = "휴대폰 번호"
        $0.tf.placeholder = "숫자만 입력해주세요"
    }
    
    lazy var certificationBtn = UIButton().then {
        $0.setTitle("인증번호 전송", for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "SeoulNamsanL")
        $0.setTitleColor(.rgb(red: 255, green: 109, blue: 107), for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.rgb(red: 255, green: 109, blue: 107).cgColor
    }
    
    lazy var certificationNumContainer = SignUpTextFieldView().then {
        $0.tfTitle.text = "인증 번호"
        $0.tf.placeholder = "인증번호 입력"
    }
    
    lazy var certificationCheckBtn = UIButton().then {
        $0.setTitle("인증번호 확인", for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "SeoulNamsanL")
        $0.setTitleColor(.rgb(red: 255, green: 109, blue: 107), for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.rgb(red: 255, green: 109, blue: 107).cgColor
    }
    
    lazy var newPwContainer = SignUpTextFieldView().then {
        $0.tfTitle.text = "새로운 비밀번호"
        $0.tf.placeholder = "새로운 비밀번호"
        $0.tf.isSecureTextEntry = true
    }
    
    lazy var newRePwContainer = SignUpTextFieldView().then {
        $0.tfTitle.text = "비밀번호 확인"
        $0.tf.placeholder = "비밀번호 확인"
        $0.tf.isSecureTextEntry = true
    }

    lazy var changePwBtn = UIButton().then {
        $0.setTitle("비밀번호 변경", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.dynamicFont(fontSize: 20, currentFontName: "SeoulNamsanM")
        $0.backgroundColor = .rgb(red: 234, green: 135, blue: 135)
    }
    
    lazy var goLoginBtn = UIButton().then {
        $0.setTitle("로그인 하러 가기", for: .normal)
        $0.setTitleColor(.rgb(red: 153, green: 153, blue: 153), for: .normal)
        $0.dynamicFont(fontSize: 14, currentFontName: "SeoulNamsanM")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
       
    //MARK: - Selectors
    
    @objc
    func goBack(){
        navigationController?.popViewController(animated: true )
    }
    
    //MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        textFieldContainerViewSetting()
        addView()
        cornerRadius()
        location()
    }
    
    func addView(){
        view.addSubview(titleLine)
        view.addSubview(titleLabel)
        view.addSubview(idContainer)
        view.addSubview(nameContainer)
        view.addSubview(phoneNumContainer)
        view.addSubview(certificationBtn)
        view.addSubview(certificationNumContainer)
        view.addSubview(certificationCheckBtn)
        view.addSubview(newPwContainer)
        view.addSubview(newRePwContainer)
        view.addSubview(changePwBtn)
        view.addSubview(goLoginBtn)
    }
    
    func cornerRadius(){
        certificationBtn.layer.cornerRadius = self.view.frame.width/27.07
        certificationCheckBtn.layer.cornerRadius = self.view.frame.width/27.07
        changePwBtn.layer.cornerRadius = self.view.frame.width/25
    }
    
    func location(){
        titleLine.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/13.76)
            make.left.equalToSuperview().offset(self.view.frame.width/10.42)
            make.width.equalToSuperview().dividedBy(2.15)
            make.height.equalToSuperview().dividedBy(90.22)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(titleLine).offset(-self.view.frame.height/406)
            make.left.equalToSuperview().offset(self.view.frame.width/7.98)
        }
        
        idContainer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.34)
            make.height.equalToSuperview().dividedBy(20.3)
            make.top.equalTo(titleLine.snp.bottom).offset(self.view.frame.height/19.33)
        }
        
        nameContainer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.34)
            make.height.equalToSuperview().dividedBy(20.3)
            make.top.equalTo(idContainer.snp.bottom).offset(self.view.frame.height/33.83)
        }
        
        phoneNumContainer.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/7.81)
            make.width.equalToSuperview().dividedBy(1.88)
            make.height.equalToSuperview().dividedBy(20.3)
            make.top.equalTo(nameContainer.snp.bottom).offset(self.view.frame.height/33.83)
        }
        
        phoneNumContainer.tf.snp.makeConstraints { make in
            make.left.equalTo(phoneNumContainer)
        }
        
        phoneNumContainer.divView.snp.makeConstraints { make in
            make.left.equalTo(phoneNumContainer)
        }
        
        certificationBtn.snp.makeConstraints { make in
            make.bottom.equalTo(phoneNumContainer)
            make.left.equalTo(phoneNumContainer.snp.right)
            make.width.equalToSuperview().dividedBy(4.69)
            make.height.equalToSuperview().dividedBy(30.07)
        }
        
        certificationNumContainer.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/7.81)
            make.width.equalToSuperview().dividedBy(1.88)
            make.height.equalToSuperview().dividedBy(20.3)
            make.top.equalTo(phoneNumContainer.snp.bottom).offset(self.view.frame.height/33.83)
        }
        
        certificationNumContainer.tf.snp.makeConstraints { make in
            make.left.equalTo(certificationNumContainer)
        }
        
        certificationNumContainer.divView.snp.makeConstraints { make in
            make.left.equalTo(certificationNumContainer)
        }
        
        certificationCheckBtn.snp.makeConstraints { make in
            make.bottom.equalTo(certificationNumContainer)
            make.left.equalTo(certificationNumContainer.snp.right)
            make.width.equalToSuperview().dividedBy(4.69)
            make.height.equalToSuperview().dividedBy(30.07)
        }
        
        newPwContainer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.34)
            make.height.equalToSuperview().dividedBy(20.3)
            make.top.equalTo(certificationNumContainer.snp.bottom).offset(self.view.frame.height/33.83)
        }
        
        newRePwContainer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.34)
            make.height.equalToSuperview().dividedBy(20.3)
            make.top.equalTo(newPwContainer.snp.bottom).offset(self.view.frame.height/33.83)
        }
        
        changePwBtn.snp.makeConstraints { make in
            make.top.equalTo(newRePwContainer.snp.bottom).offset(self.view.frame.height/12.28)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.34)
            make.height.equalToSuperview().dividedBy(24.61)
        }
        
        goLoginBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(changePwBtn.snp.bottom).offset(self.view.frame.height/4.69)
            make.height.equalToSuperview().dividedBy(58)
            make.width.equalToSuperview().dividedBy(3.5)
        }
    }
    
    func textFieldContainerViewSetting(){
        // idContainer Settig
        idContainer.addSubview(idContainer.tfTitle)
        idContainer.addSubview(idContainer.tf)
        idContainer.addSubview(idContainer.divView)
        
        idContainer.signUpTfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
        
        // nameContainer Settig
        nameContainer.addSubview(nameContainer.tfTitle)
        nameContainer.addSubview(nameContainer.tf)
        nameContainer.addSubview(nameContainer.divView)
        
        nameContainer.signUpTfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
    
        // phoneNumContainer Setting
        phoneNumContainer.addSubview(phoneNumContainer.tfTitle)
        phoneNumContainer.addSubview(phoneNumContainer.tf)
        phoneNumContainer.addSubview(phoneNumContainer.divView)
        
        phoneNumContainer.signUpTfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
    
        // certificationNumContainer Setting
        certificationNumContainer.addSubview(certificationNumContainer.tfTitle)
        certificationNumContainer.addSubview(certificationNumContainer.tf)
        certificationNumContainer.addSubview(certificationNumContainer.divView)
        
        certificationNumContainer.signUpTfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
        
        // newPwContainer Setting
        newPwContainer.addSubview(newPwContainer.tfTitle)
        newPwContainer.addSubview(newPwContainer.tf)
        newPwContainer.addSubview(newPwContainer.divView)
        
        newPwContainer.signUpTfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
        
        // newRePwContainer Setting
        newRePwContainer.addSubview(newRePwContainer.tfTitle)
        newRePwContainer.addSubview(newRePwContainer.tf)
        newRePwContainer.addSubview(newRePwContainer.divView)
        
        newRePwContainer.signUpTfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }

}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct ForgotPasswordViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        ForgotPasswordViewController()

    }

}
@available(iOS 13.0, *)
struct ForgotPasswordViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ForgotPasswordViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
