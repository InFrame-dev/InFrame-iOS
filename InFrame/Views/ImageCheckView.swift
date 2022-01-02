//
//  ImageCheckView.swift
//  InFrame
//
//  Created by 노연주 on 2021/12/03.
//

import UIKit

class ImageCheckView: UIView {
    // MARK: - Properties
    private let viewBounds = UIScreen.main.bounds

    let choiceImage = UIImageView().then {
        $0.backgroundColor = .gray
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private let checkButton = UIButton().then {
        $0.backgroundColor = UIColor.white
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.rgb(red: 225, green: 225, blue: 225).cgColor
        $0.layer.cornerRadius = 5
        $0.setImage(UIImage(named: "InFrame_AgreeButtonImage"), for: .normal)
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
        agreeButtonUnSelected(button: checkButton)
    }
    
    // MARK: - addView
    private func addView(){
        [choiceImage, checkButton].forEach { addSubview($0) }
    }
    
    // MARK: - location
    private func location(){
        choiceImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        checkButton.snp.makeConstraints { make in
            make.top.equalTo(choiceImage).offset(viewBounds.height/144.23)
            make.left.equalTo(choiceImage).offset(viewBounds.width/55.89)
            make.width.equalTo(choiceImage).dividedBy(8.57)
            make.height.equalTo(checkButton.snp.width)
        }
    }
    
    // MARK: - dataSetting
    func dataSetting(image:UIImage?){
        choiceImage.backgroundColor = .white
        choiceImage.image = image
    }
    
    // MARK: - agreeButtonUnSelected
    func agreeButtonUnSelected(button:UIButton){
        button.layer.sublayers?.remove(at: 0)
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.isSelected = false
    }
    
    // MARK: - agreeButtonSelected
    func agreeButtonSelected(button:UIButton){
        let view = UIView(frame: CGRect(x: 0, y: 0, width: viewBounds.width/16, height: viewBounds.width/16))
        let gradient = CAGradientLayer()

        gradient.frame = view.bounds
        gradient.colors = [UIColor(red: 126/255, green: 152/255, blue: 212/255, alpha: 1).cgColor,UIColor(red: 250/255, green: 186/255, blue: 200/255, alpha: 1).cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)

        button.layer.insertSublayer(gradient, at: 0)
        button.layer.borderWidth = 0
        button.clipsToBounds = true
        button.isSelected = true
    }
}
