//
//  ImagesFrameView.swift
//  InFrame
//
//  Created by 노연주 on 2021/12/05.
//

import UIKit

class ImagesFrameView: UIView {
    // MARK: - Properties
    private let viewBounds = UIScreen.main.bounds

    private let frameImage1 = UIImageView().then {
        $0.backgroundColor = .gray
    }
    
    private let frameImage2 = UIImageView().then {
        $0.backgroundColor = .gray
    }
    
    private let frameImage3 = UIImageView().then {
        $0.backgroundColor = .gray
    }
    
    private let frameImage4 = UIImageView().then {
        $0.backgroundColor = .gray
    }
    
    private lazy var backgroundLayer = CAGradientLayer().then {
        $0.frame = CGRect(x: 0, y: 0, width: viewBounds.width/1.98, height: viewBounds.height/1.48)
        $0.colors = [UIColor.rgb(red: 216, green: 227, blue: 255).cgColor, UIColor.rgb(red: 255, green: 231, blue: 236).cgColor]
        $0.startPoint = CGPoint(x: 0, y: 0)
        $0.endPoint = CGPoint(x: 1, y: 1)
    }
    
    private lazy var backgroundFrameView = UIView().then {
        $0.layer.insertSublayer(backgroundLayer, at: 0)
    }
    
    private lazy var imageStackView = UIStackView(arrangedSubviews: [frameImage1, frameImage2, frameImage3, frameImage4]).then {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = viewBounds.height/62.46
    }
    
    private let inFrameLabel = UILabel().then {
        $0.text = "InFrame"
        $0.textColor = .white
        $0.dynamicFont(fontSize: 15, currentFontName: "CarterOne")
    }
    
    private let dateLabel = UILabel().then {
        $0.text = "2021.11.13"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = .rgb(red: 119, green: 119, blue: 119)
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
        [backgroundFrameView, imageStackView, inFrameLabel, dateLabel].forEach { addSubview($0) }
    }
    
    // MARK: - location
    private func location(){
        backgroundFrameView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imageStackView.snp.makeConstraints { make in
            make.top.equalTo(backgroundFrameView).offset(viewBounds.height/62.46)
            make.centerX.equalTo(backgroundFrameView)
            make.width.equalTo(viewBounds.width/2.30)
            make.height.equalTo(viewBounds.height/1.70)
        }
        
        inFrameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageStackView.snp.bottom).offset(viewBounds.height/54.13)
            make.left.equalTo(imageStackView).offset(viewBounds.width/46.88)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(inFrameLabel)
            make.right.equalTo(imageStackView).inset(viewBounds.width/46.88)
        }
    }
    
    // MARK: - dataSetting
    func dataSetting(image1: String, image2: String, image3: String, image4: String){
        [frameImage1, frameImage2, frameImage3, frameImage4].forEach { $0.backgroundColor = .white }
        frameImage1.image = UIImage(named: image1)
        frameImage2.image = UIImage(named: image2)
        frameImage3.image = UIImage(named: image3)
        frameImage4.image = UIImage(named: image4)
    }
    
    func layerSetting(startColor:CGColor, endColor:CGColor){
        backgroundLayer.colors = [startColor, endColor]
    }
}
