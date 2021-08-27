//
//  SignUpViewController.swift
//  Arr
//
//  Created by 노연주 on 2021/08/26.
//

import UIKit
import SnapKit
import Then

class SignUpViewController: UIViewController{
    //MARK: - Properties
    
    lazy var titleLine = UIView().then {
        $0.backgroundColor = .rgb(red: 255, green: 214, blue: 214)
    }
    
    lazy var titleLabel = UILabel().then {
        $0.text = "Sign Up"
        $0.textColor = .rgb(red: 255, green: 135, blue: 133)
        $0.dynamicFont(fontSize: 23, currentFontName: "SeoulNamsanM")
    }
    
    lazy var idContainer = SignUpTextFieldView()
    
    lazy var duplicateBtn = UIButton().then {
        $0.setTitle("중복확인", for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "SeoulNamsanM")
        $0.setTitleColor(.rgb(red: 255, green: 109, blue: 107), for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.rgb(red: 255, green: 109, blue: 107).cgColor
    }
    
    lazy var pwContainer = SignUpTextFieldView().then {
        $0.tfTitle.text = "비밀번호"
        $0.tf.placeholder = "비밀번호"
    }
    
    lazy var rePwContainer = SignUpTextFieldView().then {
        $0.tfTitle.text = "비밀번호 확인"
        $0.tf.placeholder = "비밀번호 확인"
    }
    
    lazy var nameContainer = SignUpTextFieldView().then {
        $0.tfTitle.text = "이름"
        $0.tf.placeholder = "실명을 입력해주세요"
    }
    
    lazy var emailContainer = SignUpTextFieldView().then {
        $0.tfTitle.text = "이메일"
        $0.tf.placeholder = "이메일을 입력해주세요"
    }


    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
       
    //MARK: - Selectors
    
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
        view.addSubview(duplicateBtn)
        view.addSubview(pwContainer)
        view.addSubview(rePwContainer)
        view.addSubview(nameContainer)
        view.addSubview(emailContainer)
    }
    
    func cornerRadius(){
        duplicateBtn.layer.cornerRadius = self.view.frame.width/27.07
    }
    
    func location(){
        titleLine.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/14.76)
            make.left.equalToSuperview().offset(self.view.frame.width/10.42)
            make.width.equalToSuperview().dividedBy(4.52)
            make.height.equalToSuperview().dividedBy(90.22)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(titleLine).offset(-self.view.frame.height/406)
            make.right.equalTo(titleLine).offset(self.view.frame.width/46.88)
        }
        
        idContainer.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/7.81)
            make.width.equalToSuperview().dividedBy(1.88)
            make.height.equalToSuperview().dividedBy(20.3)
            make.top.equalToSuperview().offset(self.view.frame.height/8.37)
        }
        
        idContainer.tf.snp.makeConstraints { make in
            make.left.equalTo(idContainer)
        }
        
        idContainer.divView.snp.makeConstraints { make in
            make.left.equalTo(idContainer)
        }
        
        duplicateBtn.snp.makeConstraints { make in
            make.bottom.equalTo(idContainer)
            make.left.equalTo(idContainer.snp.right)
            make.width.equalToSuperview().dividedBy(4.69)
            make.height.equalToSuperview().dividedBy(30.07)
        }
        
        pwContainer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.34)
            make.height.equalToSuperview().dividedBy(20.3)
            make.top.equalTo(idContainer.snp.bottom).offset(self.view.frame.height/27.07)
        }
        
        rePwContainer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.34)
            make.height.equalToSuperview().dividedBy(20.3)
            make.top.equalTo(pwContainer.snp.bottom).offset(self.view.frame.height/27.07)
        }
        
        nameContainer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.34)
            make.height.equalToSuperview().dividedBy(20.3)
            make.top.equalTo(rePwContainer.snp.bottom).offset(self.view.frame.height/27.07)
        }
        
        emailContainer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.34)
            make.height.equalToSuperview().dividedBy(20.3)
            make.top.equalTo(nameContainer.snp.bottom).offset(self.view.frame.height/27.07)
        }
    }
    
    func textFieldContainerViewSetting(){
        // idContainer Settig
        idContainer.addSubview(idContainer.tfTitle)
        idContainer.addSubview(idContainer.tf)
        idContainer.addSubview(idContainer.divView)
        
        idContainer.signUpTfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
        
        // pwContainer Setting
        pwContainer.addSubview(pwContainer.tfTitle)
        pwContainer.addSubview(pwContainer.tf)
        pwContainer.addSubview(pwContainer.divView)
        
        pwContainer.signUpTfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
        
        // rePwContainer Setting
        rePwContainer.addSubview(rePwContainer.tfTitle)
        rePwContainer.addSubview(rePwContainer.tf)
        rePwContainer.addSubview(rePwContainer.divView)
        
        rePwContainer.signUpTfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
        
        // nameContainer Setting
        nameContainer.addSubview(nameContainer.tfTitle)
        nameContainer.addSubview(nameContainer.tf)
        nameContainer.addSubview(nameContainer.divView)
        
        nameContainer.signUpTfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
        
        // emailContainer Setting
        emailContainer.addSubview(emailContainer.tfTitle)
        emailContainer.addSubview(emailContainer.tf)
        emailContainer.addSubview(emailContainer.divView)
        
        emailContainer.signUpTfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)

    }

}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct SignUpViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        SignUpViewController()

    }

}
@available(iOS 13.0, *)
struct SignUpViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            SignUpViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
