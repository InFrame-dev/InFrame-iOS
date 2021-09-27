//
//  SignUpViewController.swift
//  InFrame
//
//  Created by 김유진 on 2021/09/27.
//

import UIKit

class SignUpViewController: UIViewController {
    //MARK: - Properties
    private lazy var signUpTitleLabel = UILabel().then{
        $0.text = "SignUp"
        $0.dynamicFont(fontSize: 30, currentFontName: "CarterOne")
        $0.updateGradientTextColor_horizontal(gradientColors: signUpTitleLabelColorArray)
    }
    
    private let emailCheckButton = UIButton().then{
        $0.backgroundColor = UIColor.rgb(red: 222, green: 222, blue: 222)
        $0.setTitle("이메일 인증", for: .normal)
        $0.dynamicFont(fontSize: 6.5, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    private lazy var emailTitleLabel = UILabel().then{
        $0.text = "Email"
        $0.dynamicFont(fontSize: 13, currentFontName: "CarterOne")
        $0.updateGradientTextColor_horizontal(gradientColors: signUpTitleLabelColorArray)
    }
    
    private let emailTextField = UITextField().then{
        $0.placeholder = "이메일을 입력해주세요."
        $0.dynamicFont(fontSize: 11, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    private lazy var emailLineView = UIView().then{
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
    
    private lazy var passwardTitleLabel = UILabel().then{
        $0.text = "Passward"
        $0.dynamicFont(fontSize: 13, currentFontName: "CarterOne")
        $0.updateGradientTextColor_horizontal(gradientColors: signUpTitleLabelColorArray)
    }
    
    private let passwardTextField = UITextField().then{
        $0.placeholder = "비밀번호를 입력해주세요."
        $0.dynamicFont(fontSize: 11, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    private lazy var passwardLineView = UIView().then{
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
    
    private let passwardShowButton = UIButton().then{
        $0.setImage(UIImage(named: "InFrame_Eye"), for: .normal)
    }
    
    private let passwardConditionLabel = UILabel().then{
        $0.text = "비밀번호는 5~20자의 영문 소문자와 1개 이상의 숫자로 구성해주세요!"
        $0.dynamicFont(fontSize: 8, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    private lazy var passwardCheckTitleLabel = UILabel().then{
        $0.text = "Passward Check"
        $0.dynamicFont(fontSize: 13, currentFontName: "CarterOne")
        $0.updateGradientTextColor_horizontal(gradientColors: signUpTitleLabelColorArray)
    }
    
    private let passwardCheckTextField = UITextField().then{
        $0.placeholder = "비밀번호를 다시 입력해주세요."
        $0.dynamicFont(fontSize: 11, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    private lazy var passwardCheckLineView = UIView().then{
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
    
    private let passwardCheckShowButton = UIButton().then{
        $0.setImage(UIImage(named: "InFrame_Eye"), for: .normal)
    }
    
    lazy var signUpButton = UIButton().then{
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width/1.4, height: self.view.frame.height/19.80))
        let gradient = CAGradientLayer()

        gradient.frame = view.bounds
        gradient.colors = [UIColor(red: 126/255, green: 152/255, blue: 212/255, alpha: 1).cgColor,UIColor(red: 250/255, green: 186/255, blue: 200/255, alpha: 1).cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)

        $0.layer.insertSublayer(gradient, at: 0)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.setTitle("회원가입", for: .normal)
        $0.dynamicFont(fontSize: 13, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    var signUpTitleLabelColorArray = [UIColor.rgb(red: 126, green: 152, blue: 212), UIColor.rgb(red: 251, green: 186, blue: 200)]
    
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
    
    //MARK: - addView
    func addView(){
        self.view.backgroundColor = .white
        self.view.addSubview(signUpTitleLabel)
        self.view.addSubview(emailTitleLabel)
    }
    
    //MARK: - addLayout
    func addLayout(){
        signUpTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/5.75)
            make.left.equalToSuperview().offset(self.view.frame.width/5.75)
        }
        
        emailTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(signUpTitleLabel.snp.bottom).offset(self.view.frame.height/15.03)
            make.left.equalTo(signUpTitleLabel)
        }
    }
    
    //MARK: - Selectors
}
