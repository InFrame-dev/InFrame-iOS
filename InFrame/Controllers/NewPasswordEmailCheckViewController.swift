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
    
    private let checkEmailLabel = UILabel().then{
        $0.text = "이메일의 확인버튼을 클릭해주세요!"
        $0.dynamicFont(fontSize: 16, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    private let nextButton = GradientButton().then{
        $0.dataSetting(buttonText: "확인버튼 클릭했어요!")
        $0.addTarget(self, action: #selector(nextButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private let emailImageView = UIImageView().then{
        $0.image = UIImage(named: "InFrame_EmailCheckImage")
    }
    
    private let imageBackgroundView = UIView().then{
        $0.backgroundColor = .white
        $0.layer.applySketchShadow(x: 0, y: 4, blur: 20)
        $0.layer.cornerRadius = 13
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
        [backButton, findPasswardTitleLabel, checkEmailLabel, nextButton, imageBackgroundView].forEach { view.addSubview($0) }
        [emailImageView].forEach { imageBackgroundView.addSubview($0) }
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
        checkEmailLabel.snp.makeConstraints { make in
            make.left.equalTo(findPasswardTitleLabel)
            make.top.equalTo(findPasswardTitleLabel.snp.bottom)
        }
        imageBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(checkEmailLabel.snp.bottom).offset(self.view.frame.height/20)
            make.left.equalTo(checkEmailLabel)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(4.34)
        }
        emailImageView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-self.view.frame.height/320)
            make.width.height.equalToSuperview().dividedBy(1.1)
            make.centerX.equalToSuperview()
        }
        nextButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/6.46)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(19.8)
            make.top.equalTo(imageBackgroundView.snp.bottom).offset(self.view.frame.height/19.8)
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
