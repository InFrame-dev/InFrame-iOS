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
    
    private let termsOfServiceTitleLabelColorArray = [UIColor.rgb(red: 126, green: 152, blue: 212), UIColor.rgb(red: 251, green: 186, blue: 200)]
    
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
    }
    
    //MARK: - addLayout
    func addLayout(){
        termsOfServiceTitleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/5.75)
            make.top.equalToSuperview().offset(self.view.frame.height/5.68)
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
    }
}


