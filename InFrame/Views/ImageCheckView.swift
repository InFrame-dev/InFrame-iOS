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

    private let choiceImage = UIImageView().then {
        $0.backgroundColor = .gray
    }
    
    private let checkButton = UIButton().then {
        $0.setImage(UIImage(named: "InFrame_AgreeButtonImage"), for: .normal)
        $0.backgroundColor = .black
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
            make.top.equalTo(choiceImage).offset(viewBounds.height/18.26)
            make.left.equalTo(choiceImage).offset(viewBounds.width/23.28)
            make.width.equalTo(choiceImage).dividedBy(8.57)
            make.height.equalTo(checkButton.snp.width)
        }
    }
    
    // MARK: - dataSetting
    func dataSetting(image:UIImage){
        choiceImage.backgroundColor = .white
        choiceImage.image = image
    }
}
