//
//  LoginTextFieldView.swift
//  Arr
//
//  Created by 노연주 on 2021/08/25.
//

import UIKit
import SnapKit
import Then

class LoginTextFieldView: UIView {
    lazy var tfTitle = UILabel().then {
        $0.text = "아이디"
        $0.dynamicFont(fontSize: 15, currentFontName: "SeoulNamsanL")
        $0.textColor = .rgb(red: 255, green: 109, blue: 107)
    }
    lazy var tf = UITextField().then {
        $0.placeholder = "아이디를 입력해주세요."
        $0.dynamicFont(fontSize: 14, currentFontName: "SeoulNamsanL")
        $0.textColor = .black
        $0.setPlaceholderColor(.rgb(red: 196, green: 196, blue: 196))
    }
    lazy var divView = UIView().then {
        $0.backgroundColor = .rgb(red: 255, green: 109, blue: 107)
    }
    
    func loginTfSetting(screenHeight: CGFloat, screenWidth: CGFloat){
        
        tfTitle.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        tf.snp.makeConstraints { make in
            make.top.equalTo(tfTitle).offset(screenHeight/36.91)
            make.centerX.equalToSuperview()
            make.width.equalTo(screenWidth/1.34)
            make.height.equalTo(screenHeight/58)
        }
        
        divView.snp.makeConstraints { make in
            make.top.equalTo(tf).offset(screenHeight/36.91)
            make.centerX.equalToSuperview()
            make.width.equalTo(screenWidth/1.34)
            make.height.equalTo(screenHeight/812)
        }
    }
}
