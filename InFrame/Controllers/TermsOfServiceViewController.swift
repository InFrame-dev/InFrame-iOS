//
//  TermsOfServiceViewController.swift
//  InFrame
//
//  Created by 김유진 on 2021/09/27.
//

import UIKit

class TermsOfServiceViewController: UIViewController {
    // MARK: - Properties
    private let bound = UIScreen.main.bounds
    
    private let allAgreeArrowButton = UIButton().then{ $0.setImage(UIImage(named: "InFrame_Arrow"), for: .normal) }
    
    private let useAgreeArrowButton = UIButton().then{ $0.setImage(UIImage(named: "InFrame_Arrow"), for: .normal) }
    
    private let personalAgreeArrowButton = UIButton().then{ $0.setImage(UIImage(named: "InFrame_Arrow"), for: .normal) }
    
    private let marketingAgreeArrowButton = UIButton().then{ $0.setImage(UIImage(named: "InFrame_Arrow"), for: .normal) }
    
    private let locationAgreeArrowButton = UIButton().then{ $0.setImage(UIImage(named: "InFrame_Arrow"), for: .normal) }
    
    private lazy var otherAgreeButtonArray = [useAgreeButton, personalAgreeButton, marketingAgreeButton, locationAgreeButton]
    
    private let termsOfServiceTitleLabel = UILabel().then{
        $0.text = "Terms of service"
        $0.dynamicFont(fontSize: 30, currentFontName: "CarterOne")
        $0.updateGradientTextColor_horizontal(gradientColors: [UIColor.rgb(red: 126, green: 152, blue: 212), UIColor.rgb(red: 251, green: 186, blue: 200)])
    }
    
    private let agreeLabel = UILabel().then{
        $0.text = "이용약관에 동의해주세요!"
        $0.dynamicFont(fontSize: 16, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = .black
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
    
    private let allAgreeButton = UIButton().then{
        $0.backgroundColor = UIColor.white
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.rgb(red: 225, green: 225, blue: 225).cgColor
        $0.layer.cornerRadius = 5
        $0.setImage(UIImage(named: "InFrame_AgreeButtonImage"), for: .normal)
        $0.addTarget(self, action: #selector(allAgreeButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private let useAgreeButton = UIButton().then{
        $0.backgroundColor = UIColor.white
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.rgb(red: 225, green: 225, blue: 225).cgColor
        $0.layer.cornerRadius = 5
        $0.setImage(UIImage(named: "InFrame_AgreeButtonImage"), for: .normal)
        $0.addTarget(self, action: #selector(useAgreeButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private let personalAgreeButton = UIButton().then{
        $0.backgroundColor = UIColor.white
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.rgb(red: 225, green: 225, blue: 225).cgColor
        $0.layer.cornerRadius = 5
        $0.setImage(UIImage(named: "InFrame_AgreeButtonImage"), for: .normal)
        $0.addTarget(self, action: #selector(personalAgreeButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private let marketingAgreeButton = UIButton().then{
        $0.backgroundColor = UIColor.white
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.rgb(red: 225, green: 225, blue: 225).cgColor
        $0.layer.cornerRadius = 5
        $0.setImage(UIImage(named: "InFrame_AgreeButtonImage"), for: .normal)
        $0.addTarget(self, action: #selector(marketingAgreeButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private let locationAgreeButton = UIButton().then{
        $0.backgroundColor = UIColor.white
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.rgb(red: 225, green: 225, blue: 225).cgColor
        $0.layer.cornerRadius = 5
        $0.setImage(UIImage(named: "InFrame_AgreeButtonImage"), for: .normal)
        $0.addTarget(self, action: #selector(locationAgreeButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private lazy var agreeButtonStackView = UIStackView(arrangedSubviews: [useAgreeButton, personalAgreeButton, marketingAgreeButton,locationAgreeButton]).then{
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = self.view.frame.height/81
        $0.isUserInteractionEnabled = true
    }
    
    private let completeButton = GradientButton().then{
        $0.dataSetting(buttonText: "완료")
        $0.addTarget(self, action: #selector(completeButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private lazy var agreeArrowButtonStackView = UIStackView(arrangedSubviews: [useAgreeArrowButton, personalAgreeArrowButton, marketingAgreeArrowButton, locationAgreeArrowButton]).then{
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = self.view.frame.height/81
    }
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    // MARK: - Helpers
    private func configureUI(){
        self.view.backgroundColor = .white
        
        addView()
        location()
    }
    
    // MARK: - addView
    private func addView(){
        [termsOfServiceTitleLabel, agreeLabel, allAgreeBackgroundView, otherAgreeBackgroundView, completeButton].forEach { view.addSubview($0) }
        [allAgreeButton, allAgreeLabel, allAgreeArrowButton].forEach { allAgreeBackgroundView.addSubview($0) }
        [agreeButtonStackView, agreeLabelStackView, agreeArrowButtonStackView].forEach { otherAgreeBackgroundView.addSubview($0) }
    }
    
    // MARK: - location
    private func location(){
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
    
    // MARK: - Selectores
    @objc func completeButtonClicked(sender:UIButton){
        let nextVC = MainViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func allAgreeButtonClicked(sender:UIButton){
        if allAgreeButton.isSelected == true{
            agreeButtonUnSelected(button: allAgreeButton)
            agreeButtonUnSelected(button: useAgreeButton)
            agreeButtonUnSelected(button: personalAgreeButton)
            agreeButtonUnSelected(button: marketingAgreeButton)
            agreeButtonUnSelected(button: locationAgreeButton)
        }else{
            agreeButtonSelected(button: allAgreeButton)
            for i in 0...otherAgreeButtonArray.count-1{
                if otherAgreeButtonArray[i].isSelected == false{
                    agreeButtonSelected(button: otherAgreeButtonArray[i])
                }
            }
        }
    }
    
    @objc func useAgreeButtonClicked(sender:UIButton){
        if useAgreeButton.isSelected == true{
            agreeButtonUnSelected(button: useAgreeButton)
            if allAgreeButton.isSelected == true{agreeButtonUnSelected(button: allAgreeButton)}
        }else{
            if personalAgreeButton.isSelected == true && marketingAgreeButton.isSelected == true && locationAgreeButton.isSelected == true{
                agreeButtonSelected(button: allAgreeButton)
            }
            agreeButtonSelected(button: useAgreeButton)
        }
    }
    
    @objc func personalAgreeButtonClicked(sender:UIButton){
        if personalAgreeButton.isSelected == true{
            agreeButtonUnSelected(button: personalAgreeButton)
            if allAgreeButton.isSelected == true{agreeButtonUnSelected(button: allAgreeButton)}
        }else{
            if useAgreeButton.isSelected == true && marketingAgreeButton.isSelected == true && locationAgreeButton.isSelected == true{
                agreeButtonSelected(button: allAgreeButton)
            }
            agreeButtonSelected(button: personalAgreeButton)
        }
    }
    
    @objc func marketingAgreeButtonClicked(sender:UIButton){
        if marketingAgreeButton.isSelected == true{
            agreeButtonUnSelected(button: marketingAgreeButton)
            if allAgreeButton.isSelected == true{agreeButtonUnSelected(button: allAgreeButton)}
        }else{
            if personalAgreeButton.isSelected == true && useAgreeButton.isSelected == true && locationAgreeButton.isSelected == true{
                agreeButtonSelected(button: allAgreeButton)
            }
            agreeButtonSelected(button: marketingAgreeButton)
        }
    }
    
    @objc func locationAgreeButtonClicked(sender:UIButton){
        if locationAgreeButton.isSelected == true{
            agreeButtonUnSelected(button: locationAgreeButton)
            if allAgreeButton.isSelected == true{agreeButtonUnSelected(button: allAgreeButton)}
        }else{
            if personalAgreeButton.isSelected == true && marketingAgreeButton.isSelected == true && useAgreeButton.isSelected == true{
                agreeButtonSelected(button: allAgreeButton)
            }
            agreeButtonSelected(button: locationAgreeButton)
        }
    }
    
    // MARK: - agreeButtonUnSelected
    private func agreeButtonUnSelected(button:UIButton){
        button.layer.sublayers?.remove(at: 0)
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.isSelected = false
    }
    
    // MARK: - agreeButtonSelected
    private func agreeButtonSelected(button:UIButton){
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width/16, height: self.view.frame.width/16))
        let gradient = CAGradientLayer()

        gradient.frame = view.bounds
        gradient.colors = [UIColor(red: 126/255, green: 152/255, blue: 212/255, alpha: 1).cgColor,UIColor(red: 250/255, green: 186/255, blue: 200/255, alpha: 1).cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)

        button.layer.insertSublayer(gradient, at: 0)
        button.layer.borderWidth = 0
        button.clipsToBounds = true
        button.isSelected = true
    }
}


