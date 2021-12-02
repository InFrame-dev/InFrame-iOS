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
    
    private let emailInputview = InputView().then{
        $0.dataSetting(titleText: "Email", placeholderText: "이메일을 입력해주세요")
    }
    
    private lazy var nextButton = GradientButton().then{
        $0.dataSetting(buttonText: "다음")
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
        
        addView()
        location()
    }
    
    // MARK: - addView
    private func addView(){
        [backButton, findPasswardTitleLabel, writeEmailLabel, emailInputview, nextButton].forEach { view.addSubview($0) }
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
        writeEmailLabel.snp.makeConstraints { make in
            make.left.equalTo(findPasswardTitleLabel)
            make.top.equalTo(findPasswardTitleLabel.snp.bottom)
        }
        emailInputview.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalTo(writeEmailLabel.snp.bottom).offset(self.view.frame.height/15.03)
            make.height.equalToSuperview().dividedBy(16)
            make.centerX.equalToSuperview()
        }
        nextButton.snp.makeConstraints { make in
            make.left.equalTo(emailInputview).offset(self.view.frame.width/6.46)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(19.8)
            make.top.equalTo(emailInputview.snp.bottom).offset(self.view.frame.height/19.8)
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
