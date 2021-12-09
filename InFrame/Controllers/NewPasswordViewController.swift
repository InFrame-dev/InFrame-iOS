//
//  NewPasswardViewController.swift
//  InFrame
//
//  Created by 김유진 on 2021/09/28.
//

import UIKit

class NewPasswordViewController: UIViewController {
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
    
    private let writePasswordLabel = UILabel().then{
        $0.text = "새 비밀번호를 입력해주세요!"
        $0.dynamicFont(fontSize: 16, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    private let passwordInputview = InputView().then{
        $0.dataSetting(titleText: "New Password", placeholderText: "새로운 비밀번호를 입력해주세요")
    }
    
    private lazy var nextButton = GradientButton().then{
        $0.dataSetting(buttonText: "비밀번호 변경하기")
        $0.addTarget(self, action: #selector(nextButtonClicked(sender:)), for: .touchUpInside)
    }
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - Helpers
    private func configureUI(){
        self.view.backgroundColor = .white
        
        passwordInputview.callKeyboard()
        addView()
        location()
    }
    
    // MARK: - addView
    private func addView(){
        [backButton, findPasswardTitleLabel, writePasswordLabel, passwordInputview, nextButton].forEach { view.addSubview($0) }
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
        writePasswordLabel.snp.makeConstraints { make in
            make.left.equalTo(findPasswardTitleLabel)
            make.top.equalTo(findPasswardTitleLabel.snp.bottom)
        }
        passwordInputview.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalTo(writePasswordLabel.snp.bottom).offset(self.view.frame.height/15.03)
            make.height.equalToSuperview().dividedBy(16)
            make.centerX.equalToSuperview()
        }
        nextButton.snp.makeConstraints { make in
            make.left.equalTo(passwordInputview).offset(self.view.frame.width/6.46)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(19.8)
            make.top.equalTo(passwordInputview.snp.bottom).offset(self.view.frame.height/19.8)
        }
    }
    

    // MARK: - Selectors
    @objc func nextButtonClicked(sender:UIButton){
        if isValidPassword(password: passwordInputview.getInfo()) == true{
            
            navigationController?.popToRootViewController(animated: true)
            
        }else{ passwordInputview.shakeView(passwordInputview) }
    }
    
    @objc func backButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - isValidPassword
    private func isValidPassword(password: String?) -> Bool {
        guard password != nil else { return false }
            
        let passwordRegEx = ("(?=.*[A-Za-z~!@#$%^&*])(?=.*[0-9]).{8,}")
        let pred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return pred.evaluate(with: password)
    }
}
