//
//  NewPasswordEmailCheckViewController.swift
//  InFrame
//
//  Created by 김유진 on 2021/12/02.
//

import UIKit

class NewPasswordEmailCheckViewController: UIViewController{
    // MARK: - Properties
    private let backButton = UIButton().then{
        $0.setImage(UIImage(named: "InFrame_BackButtonImage"), for: .normal)
        $0.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
    }
    private let findPasswardTitleLabel = UILabel().then{
        $0.text = "Find Password"
        $0.dynamicFont(fontSize: 30, currentFontName: "CarterOne")
        $0.updateGradientTextColor_horizontal(gradientColors: [UIColor.rgb(red: 126, green: 152, blue: 212), UIColor.rgb(red: 251, green: 186, blue: 200)])
    }
    private let nextButton = GradientButton().then{
        $0.dataSetting(buttonText: "확인버튼 클릭했어요!")
        $0.addTarget(self, action: #selector(nextButtonClicked(sender:)), for: .touchUpInside)
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
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        codeTextField.becomeFirstResponder()
    }
    
    // MARK: - Helpers
    private func configureUI(){
        self.view.backgroundColor = .white
        
        addView()
        location()
    }
    
    // MARK: - addView
    private func addView(){
        [backButton, findPasswardTitleLabel, nextButton, introLabel, codeBackgroundView].forEach { view.addSubview($0) }
        [codeTextField].forEach { codeBackgroundView.addSubview($0) }
    }
    
    // MARK: - location
    private func location(){
        backButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/6.04)
            make.top.equalToSuperview().offset(self.view.frame.height/8.63)
        }
        findPasswardTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(backButton)
            make.top.equalTo(backButton.snp.bottom).offset(self.view.frame.height/10.54)
        }
        introLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(findPasswardTitleLabel.snp.bottom).offset(self.view.frame.height/14)
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
        nextButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/6.46)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(19.8)
            make.top.equalTo(codeTextField.snp.bottom).offset(self.view.frame.height/19.8)
        }
    }
    
    // MARK: - Selectors
    @objc private func nextButtonClicked(sender:UIButton){
        let nextVC = NewPasswordViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc private func backButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
}
