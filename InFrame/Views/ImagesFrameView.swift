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
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private let frameImage2 = UIImageView().then {
        $0.backgroundColor = .gray
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private let frameImage3 = UIImageView().then {
        $0.backgroundColor = .gray
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private let frameImage4 = UIImageView().then {
        $0.backgroundColor = .gray
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
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
    
    let inFrameLabel = UILabel().then {
        $0.text = "InFrame"
        $0.textColor = .white
        $0.dynamicFont(fontSize: 15, currentFontName: "CarterOne")
    }
    
    private let dateLabel = UILabel().then {
        var formatter_date = DateFormatter()
        formatter_date.dateFormat = "yyyy.MM.dd"
        var current_date_string = formatter_date.string(from: Date())
        $0.text = current_date_string
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
        self.layer.applySketchShadow(color: .black, alpha: 0.25, x: 2, y: 2, blur: 10, spread: 0)
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
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.center.equalToSuperview()
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
    func dataSetting(image1: UIImage?, image2: UIImage?, image3: UIImage?, image4: UIImage?){
        [frameImage1, frameImage2, frameImage3, frameImage4].forEach { $0.backgroundColor = .white }
        frameImage1.image = image1
        frameImage2.image = image2
        frameImage3.image = image3
        frameImage4.image = image4
    }
    
    func layerSetting(startColor:CGColor, endColor:CGColor){
        backgroundLayer.colors = [startColor, endColor]
    }
}
