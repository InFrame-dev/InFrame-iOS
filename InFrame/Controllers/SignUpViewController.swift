//
//  SignUpViewController.swift
//  InFrame
//
//  Created by 김유진 on 2021/09/27.
//

import UIKit

class SignUpViewController: UIViewController {
    //MARK: - Properties
    private lazy var signUpTitleLabel = UILabel().then{
        $0.text = "SignUp"
        $0.dynamicFont(fontSize: 30, currentFontName: "CarterOne")
        $0.updateGradientTextColor_horizontal(gradientColors: signUpTitleLabelColorArray)
    }
    
    var signUpTitleLabelColorArray = [UIColor.rgb(red: 126, green: 152, blue: 212), UIColor.rgb(red: 251, green: 186, blue: 200)]
    
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
        self.view.addSubview(signUpTitleLabel)
    }
    
    //MARK: - addLayout
    func addLayout(){
        signUpTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/4.65)
            make.left.equalToSuperview().offset(self.view.frame.width/5.75)
        }
    }
    
    //MARK: - Selectors
}
