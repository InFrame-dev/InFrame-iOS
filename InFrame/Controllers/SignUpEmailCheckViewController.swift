//
//  SignUpEmailCheckViewController.swift
//  InFrame
//
//  Created by 김유진 on 2021/12/15.
//

import UIKit

class SignUpEmailCheckViewController: UIViewController{
    
    // MARK: - Properties
    private let signUpTitleLabel = UILabel().then{
        $0.text = "SignUp"
        $0.dynamicFont(fontSize: 30, currentFontName: "CarterOne")
        $0.updateGradientTextColor_horizontal(gradientColors: [UIColor.rgb(red: 126, green: 152, blue: 212), UIColor.rgb(red: 251, green: 186, blue: 200)])
    }
    private let introLabel = UILabel().then{
        $0.text = "이메일로 전송된 코드 6자리를 입력해주세요!"
        $0.dynamicFont(fontSize: 13, currentFontName: "AppleSDGothicNeo-UltraLight")
        $0.textColor = UIColor.rgb(red: 106, green: 106, blue: 106)
    }
    private let codeBackgroundView = UIView().then{
        $0.backgroundColor = UIColor.rgb(red: 250, green: 250, blue: 250)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.rgb(red: 225, green: 225, blue: 225).cgColor
        $0.layer.cornerRadius = 5
    }
    private let codeTextField = UITextField().then{
        $0.placeholder = "코드 6자리를 입력해주세요."
        $0.textColor = UIColor.rgb(red: 152, green: 152, blue: 152)
        $0.dynamicFont(fontSize: 11, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textAlignment = .center
    }
    private let signUpButton = GradientButton().then{
        $0.dataSetting(buttonText: "다음으로 가기")
        $0.addTarget(self, action: #selector(signUpButtonClicked(sender:)), for: .touchUpInside)
    }
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        
        addView()
        
        location()
    }
    
    // MARK: - addView
    private func addView(){
        [signUpTitleLabel, introLabel, codeBackgroundView, signUpButton].forEach { view.addSubview($0) }
        [codeTextField].forEach { codeBackgroundView.addSubview($0) }
    }
    
    // MARK: - location
    private func location(){
        signUpTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/5.75)
            make.left.equalToSuperview().offset(self.view.frame.width/5.75)
        }
        introLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(signUpTitleLabel.snp.bottom).offset(self.view.frame.height/8.92)
        }
        codeBackgroundView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(introLabel.snp.bottom).offset(self.view.frame.height/45.11)
            $0.width.equalToSuperview().dividedBy(2.35)
            $0.height.equalToSuperview().dividedBy(17.6)
        }
        codeTextField.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalToSuperview().dividedBy(1.3)
            $0.height.equalToSuperview().dividedBy(2)
        }
        signUpButton.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.45)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(19.8)
            make.top.equalTo(codeBackgroundView.snp.bottom).offset(self.view.frame.height/5.4)
        }
    }
    
    // MARK: - Selectors
    @objc private func signUpButtonClicked(sender:UIButton){
        let nextVC = TermsOfServiceViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
