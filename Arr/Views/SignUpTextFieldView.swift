//
//  SignUpTextFieldView.swift
//  Arr
//
//  Created by 노연주 on 2021/08/26.
//

import UIKit
import SnapKit
import Then

class SignUpTextFieldView: UIView {
    lazy var tfTitle = UILabel().then {
        $0.text = "아이디"
        $0.dynamicFont(fontSize: 15, currentFontName: "SeoulNamsanM")
        $0.textColor = .rgb(red: 255, green: 109, blue: 107)
    }
    lazy var tf = UITextField().then {
        $0.placeholder = "아이디를 입력해주세요."
        $0.dynamicFont(fontSize: 14, currentFontName: "SeoulNamsanM")
        $0.textColor = .black
        $0.setPlaceholderColor(.rgb(red: 196, green: 196, blue: 196))
    }
    lazy var divView = UIView().then {
        $0.backgroundColor = .rgb(red: 196, green: 196, blue: 196)
    }
    
    func signUpTfSetting(screenHeight: CGFloat, screenWidth: CGFloat){
        
        tfTitle.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        tf.snp.makeConstraints { make in
            make.top.equalTo(tfTitle).offset(screenHeight/40.6)
            make.centerX.equalToSuperview()
            make.width.equalTo(screenWidth/1.34)
            make.height.equalTo(screenHeight/58)
        }
        
        divView.snp.makeConstraints { make in
            make.top.equalTo(tf).offset(screenHeight/40.6)
            make.centerX.equalToSuperview()
            make.width.equalTo(screenWidth/1.34)
            make.height.equalTo(screenHeight/812)
        }
    }
}
