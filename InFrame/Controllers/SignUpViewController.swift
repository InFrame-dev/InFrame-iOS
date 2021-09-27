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
        $0.addTarget(self, action: #selector(passwardShowButtonClicked(sender:)), for: .touchUpInside)
        $0.setImage(UIImage(named: "InFrame_Eye"), for: .normal)
    }
    
    private let passwardConditionLabel = UILabel().then{
        $0.text = "비밀번호는 5~20자의 영문 소문자와 1개 이상의 숫자로 구성해주세요!"
        $0.textColor = UIColor.rgb(red: 178, green: 178, blue: 178)
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
        $0.addTarget(self, action: #selector(passwardCheckShowButtonClicked(sender:)), for: .touchUpInside)
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
        $0.addTarget(self, action: #selector(signUpButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private let haveAccountButton = UIButton().then{
        $0.setTitle("이미 계정이 있으신가요?", for: .normal)
        $0.dynamicFont(fontSize: 11, currentFontName: "AppleSDGothicNeo-Bold")
        $0.setTitleColor(UIColor.rgb(red: 178, green: 178, blue: 178), for: .normal)
        $0.addTarget(self, action: #selector(haveAccountButtonClicked(sender:)), for: .touchUpInside)
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
        self.view.addSubview(emailTextField)
        self.view.addSubview(emailLineView)
        self.view.addSubview(passwardTitleLabel)
        self.view.addSubview(passwardTextField)
        self.view.addSubview(passwardLineView)
        self.view.addSubview(passwardShowButton)
        self.view.addSubview(passwardConditionLabel)
        self.view.addSubview(passwardCheckTitleLabel)
        self.view.addSubview(passwardCheckTextField)
        self.view.addSubview(passwardCheckLineView)
        self.view.addSubview(passwardCheckShowButton)
        self.view.addSubview(signUpButton)
        self.view.addSubview(haveAccountButton)
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
            make.width.equalToSuperview().dividedBy(1.66)
            make.top.equalTo(passwardTitleLabel.snp.bottom).offset(self.view.frame.width/172.5)
        }
        
        passwardLineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.left.equalTo(passwardTitleLabel)
            make.centerX.equalToSuperview()
            make.top.equalTo(passwardTextField.snp.bottom).offset(self.view.frame.width/172.5)
        }
        
        passwardShowButton.snp.makeConstraints { make in
            make.right.equalTo(passwardLineView).offset(-self.view.frame.width/100)
            make.centerY.equalTo(passwardTextField)
            make.width.equalToSuperview().dividedBy(25)
            make.height.equalToSuperview().dividedBy(90.22)
        }
        
        passwardConditionLabel.snp.makeConstraints { make in
            make.left.equalTo(passwardLineView)
            make.top.equalTo(passwardLineView.snp.bottom).offset(self.view.frame.height/203)
        }
        
        passwardCheckTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(passwardConditionLabel)
            make.top.equalTo(passwardConditionLabel).offset(self.view.frame.height/35.3)
        }
        
        passwardCheckTextField.snp.makeConstraints { make in
            make.left.equalTo(emailTextField)
            make.height.equalToSuperview().dividedBy(35.3)
            make.width.equalToSuperview().dividedBy(1.66)
            make.top.equalTo(passwardCheckTitleLabel.snp.bottom).offset(self.view.frame.width/172.5)
        }
        
        passwardCheckLineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.left.equalTo(passwardCheckTitleLabel)
            make.centerX.equalToSuperview()
            make.top.equalTo(passwardCheckTextField.snp.bottom).offset(self.view.frame.width/172.5)
        }
        
        passwardCheckShowButton.snp.makeConstraints { make in
            make.right.equalTo(passwardCheckLineView).offset(-self.view.frame.width/100)
            make.centerY.equalTo(passwardCheckTextField)
            make.width.equalToSuperview().dividedBy(25)
            make.height.equalToSuperview().dividedBy(90.22)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalTo(passwardCheckLineView)
            make.top.equalTo(passwardCheckLineView).offset(self.view.frame.height/13.76)
            make.height.equalToSuperview().dividedBy(19.80)
        }
        
        haveAccountButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-self.view.frame.height/11.94)
            make.centerX.equalToSuperview()
        }
    }
    
    //MARK: - Selectors
    @objc func passwardShowButtonClicked(sender:UIButton){
        if passwardShowButton.imageView?.image == UIImage(named: "InFrame_Eye"){
            passwardShowButton.setImage(UIImage(named: "InFrame_EyeNo"), for: .normal)
            passwardTextField.isSecureTextEntry = true
        }else{
            passwardShowButton.setImage(UIImage(named: "InFrame_Eye"), for: .normal)
            passwardTextField.isSecureTextEntry = false
        }
    }
    
    @objc func passwardCheckShowButtonClicked(sender:UIButton){
        if passwardCheckShowButton.imageView?.image == UIImage(named: "InFrame_Eye"){
            passwardCheckShowButton.setImage(UIImage(named: "InFrame_EyeNo"), for: .normal)
            passwardCheckTextField.isSecureTextEntry = true
        }else{
            passwardCheckShowButton.setImage(UIImage(named: "InFrame_Eye"), for: .normal)
            passwardCheckTextField.isSecureTextEntry = false
        }
    }
    
    @objc func signUpButtonClicked(sender:UIButton){
        let nextVC = TermsOfServiceViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func haveAccountButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
}
