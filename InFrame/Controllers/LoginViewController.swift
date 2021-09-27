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
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Medium")
        $0.textColor = UIColor.rgb(red: 123, green: 123, blue: 123)
    }
    
    lazy var emailLineView = UIView().then{
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width/1.4, height: 1))
        let gradient = CAGradientLayer()

        gradient.frame = view.bounds
        gradient.colors = [UIColor(red: 104/255, green: 134/255, blue: 197/255, alpha: 1).cgColor,UIColor(red: 255/255, green: 173/255, blue: 172/255, alpha: 1).cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)

        $0.layer.insertSublayer(gradient, at: 0)
        $0.clipsToBounds = true
    }
    
    lazy var passwardTitleLabel = UILabel().then{
        $0.text = "Passward"
        $0.dynamicFont(fontSize: 13, currentFontName: "Charter-Black")
        $0.updateGradientTextColor_horizontal(gradientColors: logInTitleLabelColorArray)
    }
    
    lazy var passwardTextField = UITextField().then{
        $0.placeholder = "비밀번호를 입력해주세요."
        $0.dynamicFont(fontSize: 11, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    lazy var passwardLineView = UIView().then{
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width/1.4, height: 1))
        let gradient = CAGradientLayer()

        gradient.frame = view.bounds
        gradient.colors = [UIColor(red: 104/255, green: 134/255, blue: 197/255, alpha: 1).cgColor,UIColor(red: 255/255, green: 173/255, blue: 172/255, alpha: 1).cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)

        $0.layer.insertSublayer(gradient, at: 0)
        $0.clipsToBounds = true
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
        
        emailTextField.snp.makeConstraints { make in
            make.left.equalTo(emailTitleLabel).offset(self.view.frame.width/172.5)
            make.height.equalToSuperview().dividedBy(35.3)
            make.centerX.equalToSuperview()
            make.top.equalTo(emailTitleLabel.snp.bottom).offset(self.view.frame.width/172.5)
        }
        
        emailLineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.left.equalTo(emailTitleLabel)
            make.centerX.equalToSuperview()
            make.top.equalTo(emailTextField.snp.bottom).offset(self.view.frame.width/172.5)
        }
        
        passwardTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(emailLineView)
            make.top.equalTo(emailLineView).offset(self.view.frame.height/35.3)
        }
        
        passwardTextField.snp.makeConstraints { make in
            make.left.equalTo(emailTextField)
            make.height.equalToSuperview().dividedBy(35.3)
            make.centerX.equalToSuperview()
            make.top.equalTo(passwardTitleLabel.snp.bottom).offset(self.view.frame.width/172.5)
        }
        
        passwardLineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.left.equalTo(passwardTitleLabel)
            make.centerX.equalToSuperview()
            make.top.equalTo(passwardTextField.snp.bottom).offset(self.view.frame.width/172.5)
        }
    }
    
    //MARK: - addView
    func addView(){
        self.view.backgroundColor = .white
        self.view.addSubview(logInTitleLabel)
        self.view.addSubview(emailTitleLabel)
        self.view.addSubview(emailTextField)
        self.view.addSubview(emailLineView)
        self.view.addSubview(passwardTitleLabel)
        self.view.addSubview(passwardTextField)
        self.view.addSubview(passwardLineView)
        
    }
}
