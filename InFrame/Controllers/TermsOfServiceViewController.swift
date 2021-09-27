//
//  TermsOfServiceViewController.swift
//  InFrame
//
//  Created by 김유진 on 2021/09/27.
//

import UIKit

class TermsOfServiceViewController: UIViewController {
    //MARK: - Properties
    private lazy var termsOfServiceTitleLabel = UILabel().then{
        $0.text = "Terms of service"
        $0.dynamicFont(fontSize: 30, currentFontName: "CarterOne")
        $0.updateGradientTextColor_horizontal(gradientColors: termsOfServiceTitleLabelColorArray)
    }
    
    private lazy var agreeLabel = UILabel().then{
        $0.text = "이용약관에 동의해주세요!"
        $0.dynamicFont(fontSize: 16, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = .black
    }
    
    private let allAgreeBackgroundView = UIView().then{
        $0.backgroundColor = UIColor.rgb(red: 252, green: 252, blue: 252)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.rgb(red: 212, green: 212, blue: 212).cgColor
        $0.layer.cornerRadius = 5
    }
    
    private let otherAgreeBackgroundView = UIView().then{
        $0.backgroundColor = UIColor.rgb(red: 252, green: 252, blue: 252)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.rgb(red: 212, green: 212, blue: 212).cgColor
        $0.layer.cornerRadius = 5
    }
    
    private let allAgreeLabel = UILabel().then{
        $0.text = "모두 확인, 동의합니다."
        $0.textColor = UIColor.rgb(red: 155, green: 155, blue: 155)
        $0.dynamicFont(fontSize: 11, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    private let useAgreeLabel = UILabel().then{
        $0.text = "이용약관 동의 (필수)"
        $0.textColor = UIColor.rgb(red: 155, green: 155, blue: 155)
        $0.dynamicFont(fontSize: 11, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    private let personalAgreeLabel = UILabel().then{
        $0.text = "개인정보 취급방침 동의 (필수)"
        $0.textColor = UIColor.rgb(red: 155, green: 155, blue: 155)
        $0.dynamicFont(fontSize: 11, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    private let marketingAgreeLabel = UILabel().then{
        $0.text = "마케팅 정보 수신 동의 (필수)"
        $0.textColor = UIColor.rgb(red: 155, green: 155, blue: 155)
        $0.dynamicFont(fontSize: 11, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    private let locationAgreeLabel = UILabel().then{
        $0.text = "위치기반서비스 동의 (필수)"
        $0.textColor = UIColor.rgb(red: 155, green: 155, blue: 155)
        $0.dynamicFont(fontSize: 11, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    private lazy var agreeLabelStackView = UIStackView(arrangedSubviews: [useAgreeLabel, personalAgreeLabel, marketingAgreeLabel,locationAgreeLabel]).then{
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = self.view.frame.height/81
    }
    
    private let allAgreeButton = UIButton().then{
        $0.backgroundColor = UIColor.white
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.rgb(red: 225, green: 225, blue: 225).cgColor
        $0.layer.cornerRadius = 5
    }
    
    private let useAgreeButton = UIButton().then{
        $0.backgroundColor = UIColor.white
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.rgb(red: 225, green: 225, blue: 225).cgColor
        $0.layer.cornerRadius = 5
    }
    
    private let personalAgreeButton = UIButton().then{
        $0.backgroundColor = UIColor.white
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.rgb(red: 225, green: 225, blue: 225).cgColor
        $0.layer.cornerRadius = 5
    }
    
    private let marketingAgreeButton = UIButton().then{
        $0.backgroundColor = UIColor.white
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.rgb(red: 225, green: 225, blue: 225).cgColor
        $0.layer.cornerRadius = 5
    }
    
    private let locationAgreeButton = UIButton().then{
        $0.backgroundColor = UIColor.white
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.rgb(red: 225, green: 225, blue: 225).cgColor
        $0.layer.cornerRadius = 5
    }
    
    private lazy var agreeButtonStackView = UIStackView(arrangedSubviews: [useAgreeButton, personalAgreeButton, marketingAgreeButton,locationAgreeButton]).then{
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = self.view.frame.height/81
    }
    
    private let allAgreeArrowButton = UIButton().then{
        $0.setImage(UIImage(named: "InFrame_Arrow"), for: .normal)
    }
    
    private let useAgreeArrowButton = UIButton().then{
        $0.setImage(UIImage(named: "InFrame_Arrow"), for: .normal)
    }
    
    private let personalAgreeArrowButton = UIButton().then{
        $0.setImage(UIImage(named: "InFrame_Arrow"), for: .normal)
    }
    
    private let marketingAgreeArrowButton = UIButton().then{
        $0.setImage(UIImage(named: "InFrame_Arrow"), for: .normal)
    }
    
    private let locationAgreeArrowButton = UIButton().then{
        $0.setImage(UIImage(named: "InFrame_Arrow"), for: .normal)
    }
    
    private lazy var agreeArrowButtonStackView = UIStackView(arrangedSubviews: [useAgreeArrowButton, personalAgreeArrowButton, marketingAgreeArrowButton, locationAgreeArrowButton]).then{
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = self.view.frame.height/81
    }
    
    private let termsOfServiceTitleLabelColorArray = [UIColor.rgb(red: 126, green: 152, blue: 212), UIColor.rgb(red: 251, green: 186, blue: 200)]
    
    lazy var completeButton = UIButton().then{
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
        $0.setTitle("완료", for: .normal)
        $0.dynamicFont(fontSize: 13, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
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
        self.view.addSubview(termsOfServiceTitleLabel)
        self.view.addSubview(agreeLabel)
        self.view.addSubview(allAgreeBackgroundView)
        self.view.addSubview(otherAgreeBackgroundView)
        self.view.addSubview(completeButton)
        allAgreeBackgroundView.addSubview(allAgreeButton)
        allAgreeBackgroundView.addSubview(allAgreeLabel)
        allAgreeBackgroundView.addSubview(allAgreeArrowButton)
        otherAgreeBackgroundView.addSubview(agreeButtonStackView)
        otherAgreeBackgroundView.addSubview(agreeLabelStackView)
        otherAgreeBackgroundView.addSubview(agreeArrowButtonStackView)
    }
    
    //MARK: - addLayout
    func addLayout(){
        termsOfServiceTitleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/5.75)
            make.top.equalToSuperview().offset(self.view.frame.height/4.6)
        }
        
        agreeLabel.snp.makeConstraints { make in
            make.left.equalTo(termsOfServiceTitleLabel)
            make.top.equalTo(termsOfServiceTitleLabel.snp.bottom)
        }
        
        allAgreeBackgroundView.snp.makeConstraints { make in
            make.left.equalTo(agreeLabel)
            make.top.equalTo(agreeLabel.snp.bottom).offset(self.view.frame.height/25.37)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(19.8)
        }
        
        otherAgreeBackgroundView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(allAgreeBackgroundView)
            make.top.equalTo(allAgreeBackgroundView.snp.bottom).offset(self.view.frame.height/58)
            make.height.equalToSuperview().dividedBy(6.54)
        }
        
        agreeButtonStackView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/26.78)
            make.height.equalToSuperview().dividedBy(1.2)
            make.width.equalToSuperview().dividedBy(13.57)
            make.centerY.equalToSuperview()
        }
        
        agreeLabelStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(agreeButtonStackView.snp.right).offset(self.view.frame.width/50)
            make.height.equalToSuperview().dividedBy(1.2)
            make.width.equalToSuperview().dividedBy(1.6)
        }
        
        agreeArrowButtonStackView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-self.view.frame.width/26.78)
            make.height.equalToSuperview().dividedBy(1.2)
            make.width.equalToSuperview().dividedBy(13.57)
            make.centerY.equalToSuperview()
        }
        
        allAgreeButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(self.view.frame.width/26.78)
            make.width.equalToSuperview().dividedBy(13.57)
            make.height.equalTo(allAgreeButton.snp.width)
        }
        
        allAgreeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(agreeButtonStackView.snp.right).offset(self.view.frame.width/50)
        }
        
        allAgreeArrowButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-self.view.frame.width/26.78)
            make.width.equalToSuperview().dividedBy(13.57)
            make.height.equalTo(allAgreeArrowButton.snp.width)
            make.centerY.equalToSuperview()
        }
        
        completeButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalTo(otherAgreeBackgroundView)
            make.top.equalTo(otherAgreeBackgroundView.snp.bottom).offset(self.view.frame.height/15)
            make.height.equalToSuperview().dividedBy(19.80)
        }
    }
}


