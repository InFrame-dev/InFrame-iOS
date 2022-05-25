//
//  InputView.swift
//  InFrame
//
//  Created by 김유진 on 2021/12/01.
//

import Foundation
import UIKit

final class InputView: UIView{
    // MARK: - Properties
    private let viewBounds = UIScreen.main.bounds
    
    private let mainTitleLabel = UILabel().then{
        $0.dynamicFont(fontSize: 13, currentFontName: "CarterOne")
    }
    
    private let infoTextField = UITextField().then{
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Medium")
        $0.textColor = UIColor.rgb(red: 123, green: 123, blue: 123)
    }
    
    private lazy var lineView = UIView().then{
        let view = UIView(frame: CGRect(x: 0, y: 0, width: viewBounds.width/1.4, height: 1))
        let gradient = CAGradientLayer()

        gradient.frame = view.bounds
        gradient.colors = [UIColor(red: 104/255, green: 134/255, blue: 197/255, alpha: 1).cgColor,UIColor(red: 255/255, green: 173/255, blue: 172/255, alpha: 1).cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)

        $0.layer.insertSublayer(gradient, at: 0)
        $0.clipsToBounds = true
    }
    
    // MARK: - LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configureUI()
    }
    
    // MARK: - Helpers
    private func configureUI(){
        addView()
        location()
    }
    
    // MARK: - addView
    private func addView(){
        [mainTitleLabel, infoTextField, lineView].forEach { addSubview($0) }
    }
    
    // MARK: - location
    private func location(){
        mainTitleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(viewBounds.width/6.46)
            make.top.equalToSuperview()
        }
        infoTextField.snp.makeConstraints { make in
            make.left.equalTo(mainTitleLabel).offset(viewBounds.width/172.5)
            make.height.equalToSuperview().dividedBy(2)
            make.centerX.equalToSuperview()
            make.top.equalTo(mainTitleLabel.snp.bottom).offset(viewBounds.width/172.5)
        }
        lineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.left.equalTo(mainTitleLabel)
            make.centerX.equalToSuperview()
            make.top.equalTo(infoTextField.snp.bottom).offset(viewBounds.width/172.5)
        }
    }
    
    // MARK: - dataSetting
    func dataSetting(titleText: String, placeholderText: String){
        mainTitleLabel.text = titleText
        infoTextField.placeholder = placeholderText
        
        mainTitleLabel.updateGradientTextColor_horizontal(gradientColors: [UIColor.rgb(red: 126, green: 152, blue: 212), UIColor.rgb(red: 251, green: 186, blue: 200)])
    }
    
    // MARK: - getInfo
    func getInfo() -> String{
        return infoTextField.text!
    }
    
    // MARK: - callKeyboard
    func callKeyboard(){
        infoTextField.becomeFirstResponder()
    }
    
    // MARK: - disappearKeyboard
    func disappearKeyboard(){
        infoTextField.resignFirstResponder()
    }
}
