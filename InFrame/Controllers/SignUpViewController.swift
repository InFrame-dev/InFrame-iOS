//
//  SignUpViewController.swift
//  InFrame
//
//  Created by 김유진 on 2021/09/27.
//

import UIKit
import Alamofire

class SignUpViewController: UIViewController {
    // MARK: - Properties
    final class API : APIService<KakaoDataModel>{
        //MARK: - SingleTon
        static let shared = APIService<KakaoDataModel>()
    }
    
    private let signUpTitleLabel = UILabel().then{
        $0.text = "SignUp"
        $0.dynamicFont(fontSize: 30, currentFontName: "CarterOne")
        $0.updateGradientTextColor_horizontal(gradientColors: [UIColor.rgb(red: 126, green: 152, blue: 212), UIColor.rgb(red: 251, green: 186, blue: 200)])
    }
    
    private let emailCheckButton = UIButton().then{
        $0.backgroundColor = UIColor.rgb(red: 222, green: 222, blue: 222)
        $0.setTitle("이메일 인증", for: .normal)
        $0.dynamicFont(fontSize: 6.5, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    private let emailInputview = InputView().then{
        $0.dataSetting(titleText: "Email", placeholderText: "이메일을 입력해주세요.")
    }
    
    private let passwordInputview = InputView().then{
        $0.dataSetting(titleText: "Password", placeholderText: "비밀번호 입력해주세요.")
    }
    
    private let passwordCheckInputview = InputView().then{
        $0.dataSetting(titleText: "Password Check", placeholderText: "비밀번호를 다시 입력해주세요.")
    }
    
    private let passwardConditionLabel = UILabel().then{
        $0.text = "비밀번호는 5~20자의 영문 소문자와 1개 이상의 숫자로 구성해주세요!"
        $0.textColor = UIColor.rgb(red: 178, green: 178, blue: 178)
        $0.dynamicFont(fontSize: 8, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    private let signUpButton = GradientButton().then{
        $0.dataSetting(buttonText: "회원가입")
        $0.addTarget(SignUpViewController.self, action: #selector(signUpButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private let haveAccountButton = UIButton().then{
        $0.setTitle("이미 계정이 있으신가요?", for: .normal)
        $0.dynamicFont(fontSize: 11, currentFontName: "AppleSDGothicNeo-Bold")
        $0.setTitleColor(UIColor.rgb(red: 178, green: 178, blue: 178), for: .normal)
        $0.addTarget(SignUpViewController.self, action: #selector(haveAccountButtonClicked(sender:)), for: .touchUpInside)
    }
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        
        addView()
        location()
    }
    
    // MARK: - addView
    private func addView(){
        [signUpTitleLabel, emailInputview, passwordInputview, passwardConditionLabel, passwordCheckInputview, signUpButton, haveAccountButton].forEach { view.addSubview($0) }
    }
    
    //MARK: - location
    private func location(){
        signUpTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/5.75)
            make.left.equalToSuperview().offset(self.view.frame.width/5.75)
        }
        emailInputview.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalTo(signUpTitleLabel.snp.bottom).offset(self.view.frame.height/15.03)
            make.height.equalToSuperview().dividedBy(16)
        }
        passwordInputview.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalTo(emailInputview.snp.bottom).offset(self.view.frame.height/35.3)
            make.height.equalToSuperview().dividedBy(16)
        }
        passwardConditionLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordInputview.snp.bottom).offset(self.view.frame.height/200)
            make.left.equalToSuperview().offset(self.view.frame.width/6.46)
        }
        passwordCheckInputview.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalTo(passwardConditionLabel.snp.bottom).offset(self.view.frame.height/35.3)
            make.height.equalToSuperview().dividedBy(16)
        }
        signUpButton.snp.makeConstraints { make in
            make.left.equalTo(passwardConditionLabel)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(19.8)
            make.top.equalTo(passwordCheckInputview.snp.bottom).offset(self.view.frame.height/19.8)
        }
        haveAccountButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-self.view.frame.height/11.94)
            make.centerX.equalToSuperview()
        }
    }
    
    //MARK: - Selectors    
    @objc func signUpButtonClicked(sender:UIButton){
        if isValidEmail(email: emailInputview.getInfo()) == true{
            if isValidPassword(password: passwordInputview.getInfo()) == true{
                if isValidPassword(password: passwordCheckInputview.getInfo()) == true{
                    if samePassword() == true{
                        
                        signupAPI()
                        
                    }else{ passwordCheckInputview.shakeView(passwordCheckInputview) }
                }else{ passwordCheckInputview.shakeView(passwordCheckInputview) }
            }else{ passwordInputview.shakeView(passwordInputview) }
        }else{ emailInputview.shakeView(emailInputview) }
    }
    
    @objc func haveAccountButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - samePassword
    private func samePassword() -> Bool{
        if passwordInputview.getInfo() == passwordCheckInputview.getInfo(){
            return true
        }else{
            return false
        }
    }
    
    // MARK: - isValidEmail
    private func isValidEmail(email: String?) -> Bool {
        guard email != nil else { return false }
        
        let idRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let pred = NSPredicate(format:"SELF MATCHES %@", idRegEx)
        return pred.evaluate(with: email)
    }
    
    // MARK: - isValidPassword
    private func isValidPassword(password: String?) -> Bool {
        guard password != nil else { return false }
            
        let passwordRegEx = ("(?=.*[A-Za-z~!@#$%^&*])(?=.*[0-9]).{8,}")
        let pred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return pred.evaluate(with: password)
    }
    
    private func signupAPI(){
        let param: Parameters = ["email": emailInputview.getInfo(), "password": passwordCheckInputview.getInfo()]

        API.shared.request(url: "http://52.78.178.248:8080/signup", method: .post, param: param, header: .none, JSONDecodeUsingStatus: false) { result in
            switch result {
            case .success(let data):
                print(data)
                print("success")
                
                UserDefaults.standard.set(self.emailInputview.getInfo(), forKey: "userEmail")
                
                let nextVC = SignUpEmailCheckViewController()
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
