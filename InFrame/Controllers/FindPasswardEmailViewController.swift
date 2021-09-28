//
//  FindPasswardEmailViewController.swift
//  InFrame
//
//  Created by 김유진 on 2021/09/28.
//

import UIKit

class FindPasswardEmailViewController: UIViewController {
    // MARK: - Properties
    private let backButton = UIButton().then{
        $0.setImage(UIImage(named: "InFrame_BackButtonImage"), for: .normal)
        $0.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private let findPasswardTitleLabel = UILabel().then{
        $0.text = "Find Passward"
        $0.dynamicFont(fontSize: 30, currentFontName: "CarterOne")
        $0.updateGradientTextColor_horizontal(gradientColors: [UIColor.rgb(red: 126, green: 152, blue: 212), UIColor.rgb(red: 251, green: 186, blue: 200)])
    }
    
    private let writeEmailLabel = UILabel().then{
        $0.text = "이메일을 입력해주세요!"
        $0.dynamicFont(fontSize: 16, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    private lazy var emailTitleLabel = UILabel().then{
        $0.text = "Email"
        $0.dynamicFont(fontSize: 13, currentFontName: "CarterOne")
        $0.updateGradientTextColor_horizontal(gradientColors: [UIColor.rgb(red: 126, green: 152, blue: 212), UIColor.rgb(red: 251, green: 186, blue: 200)])
    }
    
    private let emailTextField = UITextField().then{
        $0.placeholder = "이메일을 입력해주세요."
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Medium")
        $0.textColor = UIColor.rgb(red: 123, green: 123, blue: 123)
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
    
    private let emailCheckButton = UIButton().then{
        $0.backgroundColor = UIColor.rgb(red: 222, green: 222, blue: 222)
        $0.setTitle("이메일 인증", for: .normal)
        $0.dynamicFont(fontSize: 6.5, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    private lazy var nextButton = UIButton().then{
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
        $0.setTitle("다 음", for: .normal)
        $0.dynamicFont(fontSize: 13, currentFontName: "AppleSDGothicNeo-Bold")
        $0.addTarget(self, action: #selector(nextButtonClicked(sender:)), for: .touchUpInside)
    }
    
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - Helpers
    func configure(){
        addView()
        
        addLayout()
    }
    
    // MARK: - addView
    func addView(){
        self.view.backgroundColor = .white
        self.view.addSubview(backButton)
        self.view.addSubview(findPasswardTitleLabel)
        self.view.addSubview(writeEmailLabel)
        self.view.addSubview(emailTitleLabel)
        self.view.addSubview(emailTextField)
        self.view.addSubview(emailLineView)
        self.view.addSubview(emailCheckButton)
        self.view.addSubview(nextButton)
    }
    
    // MARK: - addLayout
    func addLayout(){
        backButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/6.04)
            make.top.equalToSuperview().offset(self.view.frame.height/8.63)
        }
        
        findPasswardTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(backButton)
            make.top.equalTo(backButton.snp.bottom).offset(self.view.frame.height/10.54)
        }
        
        writeEmailLabel.snp.makeConstraints { make in
            make.left.equalTo(findPasswardTitleLabel)
            make.top.equalTo(findPasswardTitleLabel.snp.bottom)
        }
        
        emailTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(writeEmailLabel)
            make.top.equalTo(writeEmailLabel.snp.bottom).offset(self.view.frame.height/15.03)
        }
        
        emailCheckButton.snp.makeConstraints { make in
            make.centerY.equalTo(emailTitleLabel)
            make.right.equalTo(emailLineView)
            make.height.equalToSuperview().dividedBy(50.75)
            make.width.equalToSuperview().dividedBy(7.5)
            
            emailCheckButton.layer.cornerRadius = self.view.frame.height/50.75/2
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
        
        nextButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalTo(emailLineView)
            make.top.equalTo(emailLineView).offset(self.view.frame.height/13.76)
            make.height.equalToSuperview().dividedBy(19.80)
        }
    }
    

    // MARK: - Selectors
    @objc func nextButtonClicked(sender:UIButton){
        let nextVC = NewPasswardViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func backButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
}
