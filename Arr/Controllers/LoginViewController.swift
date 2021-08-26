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
    }
    
    func cornerRadius(){
        
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
        }
        
        pwContainer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.34)
            make.height.equalToSuperview().dividedBy(18.46)
            make.top.equalToSuperview().offset(self.view.frame.height/11.94)
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
