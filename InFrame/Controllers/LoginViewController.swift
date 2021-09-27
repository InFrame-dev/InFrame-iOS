//
//  LoginViewController.swift
//  InFrame
//
//  Created by 노연주 on 2021/09/14.
//

import UIKit
import SnapKit
import Then

class LoginViewController: UIViewController {
    //MARK: - Properties
    lazy var logInTitleLabel = UILabel().then{
        $0.text = "LogIn"
        $0.dynamicFont(fontSize: 30, currentFontName: "Charter-Black")
        $0.updateGradientTextColor_horizontal(gradientColors: logInTitleLabelColorArray)
    }
    
    lazy var emailTitleLabel = UILabel().then{
        $0.text = "Email"
        $0.dynamicFont(fontSize: 13, currentFontName: "Charter-Black")
        $0.updateGradientTextColor_horizontal(gradientColors: logInTitleLabelColorArray)
    }
    
    lazy var emailTextField = UITextField().then{
        $0.placeholder = "이메일을 입력해주세요."
        $0.dynamicFont(fontSize: 11, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    lazy var emailLineView = UIView().then{
        $0.applyGradient(colors: lineViewColorArray)
    }
    
    lazy var passwardTitleLabel = UILabel().then{
        $0.text = "Passward"
        $0.dynamicFont(fontSize: 13, currentFontName: "Charter-Black")
        $0.updateGradientTextColor_horizontal(gradientColors: logInTitleLabelColorArray)
    }
    
    lazy var passwardTextField = UITextField().then{
        $0.placeholder = "비밀번호를 입력해주세요."
        $0.dynamicFont(fontSize: 11, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    lazy var passwardLineView = UIView().then{
        $0.applyGradient(colors: lineViewColorArray)
    }
    
    lazy var forgetLabel = UILabel().then{
        $0.text = "비밀번호를 잊으셨나요?"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Medium")
        $0.textColor = UIColor.rgb(red: 178, green: 178, blue: 178)
    }
    
    lazy var passwardShowButton = UIButton().then{
        $0.setImage(UIImage(named: "InFrame_Eye"), for: .normal)
    }
    
    lazy var logInButton = UIButton().then{
        $0.applyGradient(colors: lineViewColorArray)
        $0.layer.cornerRadius = 10
        $0.setTitle("로그인", for: .normal)
        $0.dynamicFont(fontSize: 13, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var haveAccountButton = UIButton().then{
        $0.setTitle("이미 계정이 있으신가요?", for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.setTitleColor(UIColor.rgb(red: 178, green: 178, blue: 178), for: .normal)
    }
    
    var logInTitleLabelColorArray = [UIColor.rgb(red: 126, green: 152, blue: 212), UIColor.rgb(red: 251, green: 186, blue: 200)]
    
    var lineViewColorArray = [UIColor.rgb(red: 128, green: 153, blue: 212), UIColor.rgb(red: 249, green: 186, blue: 201)]
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    //MARK: - Helpers
    func configureUI(){
        addView()
        
        addLayout()
    }
    
    //MARK: - addLayout
    func addLayout(){
        logInTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/4.65)
            make.left.equalToSuperview().offset(self.view.frame.width/5.75)
        }
        
        emailTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(logInTitleLabel)
            make.top.equalTo(logInTitleLabel.snp.bottom).offset(self.view.frame.height/15.03)
        }
    }
    
    //MARK: - addView
    func addView(){
        self.view.backgroundColor = .white
        self.view.addSubview(logInTitleLabel)
        self.view.addSubview(emailTitleLabel)
    }
}
