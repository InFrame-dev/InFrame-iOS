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
        view.addSubview(nameContainer)
    }
    
    func cornerRadius(){
        
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
