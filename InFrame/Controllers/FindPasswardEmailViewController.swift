//
//  FindPasswardEmailViewController.swift
//  InFrame
//
//  Created by 김유진 on 2021/09/28.
//

import UIKit
import Alamofire

class FindPasswardEmailViewController: UIViewController {
    // MARK: - Properties
    final class API : APIService<KakaoDataModel>{
        //MARK: - SingleTon
        static let shared = APIService<KakaoDataModel>()
    }
    
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
    
    private let emailInputView = InputView().then{
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
    
    // MARK: - Helpers
    private func configureUI(){
        self.view.backgroundColor = .white
        
        emailInputView.callKeyboard()
        addView()
        location()
    }
    
    // MARK: - addView
    private func addView(){
        [backButton, findPasswardTitleLabel, writeEmailLabel, emailInputView, nextButton].forEach { view.addSubview($0) }
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
        emailInputView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalTo(writeEmailLabel.snp.bottom).offset(self.view.frame.height/15.03)
            make.height.equalToSuperview().dividedBy(16)
            make.centerX.equalToSuperview()
        }
        nextButton.snp.makeConstraints { make in
            make.left.equalTo(emailInputView).offset(self.view.frame.width/6.46)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(19.8)
            make.top.equalTo(emailInputView.snp.bottom).offset(self.view.frame.height/19.8)
        }
    }
    
    // MARK: - Selectors
    @objc private func nextButtonClicked(sender:UIButton){
        if isValidEmail(email: emailInputView.getInfo()) == true{
            
            findPasswordAPI()

        }else{ emailInputView.shakeView(emailInputView) }
    }
    
    @objc private func backButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - isValidEmail
    private func isValidEmail(email: String?) -> Bool {
        guard email != nil else { return false }
        
        let idRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let pred = NSPredicate(format:"SELF MATCHES %@", idRegEx)
        return pred.evaluate(with: email)
    }

    private func findPasswordAPI(){
        let userEmail: String = UserDefaults.standard.string(forKey: "userEmail")!
        
        let param: Parameters = ["email": emailInputView.getInfo()]

        API.shared.request(url: "http://52.78.178.248:8080/findPassword", method: .post, param: param, header: .none, JSONDecodeUsingStatus: false) { result in
            switch result {
            case .success(let data):
                print(data)
                print("success")
                
                let nextVC = NewPasswordEmailCheckViewController()
                self.navigationController?.pushViewController(nextVC, animated: true)
                    
                break
            case .requestErr(let err):
                print(err)
                break
            case .pathErr:
                print("pathErr")
                break
            case .serverErr:
                print("serverErr")
                break
            case .networkFail:
                print("networkFail")
                break
            case .tokenErr:
                print("tokenErr")
                break
            case .authorityErr:
                print("authorityErr")
                break
            }
        }
    }
}
