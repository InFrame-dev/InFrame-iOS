//
//  LoginViewController.swift
//  Arr
//
//  Created by 노연주 on 2021/08/24.
//

import UIKit
import SnapKit
import Then

class LoginViewController: UIViewController{
    //MARK: - Properties
    
    lazy var logo = UIImageView().then {
        $0.image = UIImage(named: "Arr-Logo")
        $0.contentMode = .scaleAspectFit
    }
    
    lazy var idContainer = LoginTextFieldView()
    
    lazy var pwContainer = LoginTextFieldView().then {
        $0.tfTitle.text = "password"
        $0.tf.placeholder = "password를 입력해주세요."
        $0.tf.isSecureTextEntry = true
    }
    
    lazy var forgotPwBtn = UIButton().then {
        $0.setTitle("Forgot my password", for: .normal)
        $0.setTitleColor(.rgb(red: 196, green: 196, blue: 196), for: .normal)
        $0.dynamicFont(fontSize: 14, currentFontName: "seoulnamsancondensed-light")
    }
    
    lazy var loginBtn = UIButton().then {
        $0.setTitle("Log In", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.dynamicFont(fontSize: 20, currentFontName: "seoulnamsancondensed-light")
        $0.backgroundColor = .rgb(red: 234, green: 135, blue: 135)
    }
    
    lazy var signupBtn = UIButton().then {
        $0.setTitle("Sign Up", for: .normal)
        $0.setTitleColor(.rgb(red: 153, green: 153, blue: 153), for: .normal)
        $0.dynamicFont(fontSize: 20, currentFontName: "seoulnamsancondensed-light")
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
        
        idContainerViewSetting()
        pwContainerViewSetting()
        
        addView()
        cornerRadius()
        location()
    }
    
    func addView(){
        view.addSubview(logo)
        view.addSubview(idContainer)
        view.addSubview(pwContainer)
        view.addSubview(forgotPwBtn)
        view.addSubview(loginBtn)
        view.addSubview(signupBtn)
    }
    
    func cornerRadius(){
        loginBtn.layer.cornerRadius = 15
    }
    
    func location(){
        logo.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(self.view.frame.height/4.78)
            make.width.equalToSuperview().dividedBy(2.65)
            make.height.equalToSuperview().dividedBy(5.27)
        }
        
        idContainer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.34)
            make.height.equalToSuperview().dividedBy(18.46)
            make.top.equalToSuperview().offset(self.view.frame.height/2.29)
        }
        
        pwContainer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.34)
            make.height.equalToSuperview().dividedBy(18.46)
            make.top.equalTo(idContainer.divView).offset(self.view.frame.height/32.48)
        }
        
        forgotPwBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(self.view.frame.height/1.71)
            make.height.equalToSuperview().dividedBy(58)
            make.width.equalToSuperview().dividedBy(2)
        }
        
        loginBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(forgotPwBtn).offset(self.view.frame.height/8.37)
            make.width.equalToSuperview().dividedBy(1.19)
            make.height.equalToSuperview().dividedBy(24.61)
        }
        
        signupBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginBtn).offset(self.view.frame.height/15.92)
            make.width.equalToSuperview().dividedBy(6.05)
            make.height.equalToSuperview().dividedBy(40.6)
        }
    }
    
    func idContainerViewSetting(){
        idContainer.addSubview(idContainer.tfTitle)
        idContainer.addSubview(idContainer.tf)
        idContainer.addSubview(idContainer.divView)
        
        idContainer.loginTfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
    }
    
    func pwContainerViewSetting(){
        pwContainer.addSubview(pwContainer.tfTitle)
        pwContainer.addSubview(pwContainer.tf)
        pwContainer.addSubview(pwContainer.divView)
        
        pwContainer.loginTfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
    }
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct LoginViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        LoginViewController()

    }

}
@available(iOS 13.0, *)
struct LoginViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            LoginViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
