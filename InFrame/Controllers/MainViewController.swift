//
//  MainViewController.swift
//  InFrame
//
//  Created by 김유진 on 2021/09/28.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - Properties
    private let inFrameTitleLabel = UILabel().then{
        $0.text = "InFrame"
        $0.dynamicFont(fontSize: 30, currentFontName: "CarterOne")
        $0.updateGradientTextColor_horizontal(gradientColors: [UIColor.rgb(red: 126, green: 152, blue: 212), UIColor.rgb(red: 251, green: 186, blue: 200)])
    }

    private let saveLabel = UILabel().then{
        $0.text = "여러분의 순간을 특별하게 저장해보세요!"
        $0.dynamicFont(fontSize: 16, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    private let takePictureButton = MainButton().then{
        $0.addTarget(self, action: #selector(takePictureButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private let takePictureLabel = UILabel().then{
        $0.text = "사진 찍기"
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    private let takePictureImageView = UIImageView().then{
        $0.image = UIImage(named: "InFrame_TakePicture")
    }
    
    private let choosePictureButton = MainButton().then{
        $0.addTarget(self, action: #selector(takePictureButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private let choosePictureLabel = UILabel().then{
        $0.text = "사진 선택하기"
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    private let choosePictureImageView = UIImageView().then{
        $0.image = UIImage(named: "InFrame_ChoosePicture")
    }
    
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    // MARK: - Helpers
    func configureUI(){
        addView()
        
        addLayout()
    }
    
    func addView(){
        self.view.backgroundColor = .white
        self.view.addSubview(inFrameTitleLabel)
        self.view.addSubview(saveLabel)
        self.view.addSubview(takePictureButton)
        takePictureButton.addSubview(takePictureLabel)
        takePictureButton.addSubview(takePictureImageView)
        self.view.addSubview(choosePictureButton)
        choosePictureButton.addSubview(choosePictureLabel)
        choosePictureButton.addSubview(choosePictureImageView)
    }
    
    func addLayout(){
        inFrameTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/9.02)
            make.left.equalToSuperview().offset(self.view.frame.width/7.81)
        }
        
        saveLabel.snp.makeConstraints { make in
            make.left.equalTo(inFrameTitleLabel)
            make.top.equalTo(inFrameTitleLabel.snp.bottom)
        }
        
        takePictureButton.snp.makeConstraints { make in
            make.left.equalTo(inFrameTitleLabel)
            make.top.equalTo(saveLabel.snp.bottom).offset(self.view.frame.height/27.06)
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalToSuperview().dividedBy(5.92)
        }
        
        takePictureLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-self.view.frame.height/47.76)
            make.centerX.equalToSuperview()
        }
        
        takePictureImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.5)
            make.height.equalToSuperview().dividedBy(2.4)
            make.top.equalToSuperview().offset(self.view.frame.height/30)
        }
        
        choosePictureButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-self.view.frame.width/7.81)
            make.top.equalTo(saveLabel.snp.bottom).offset(self.view.frame.height/27.06)
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalToSuperview().dividedBy(5.92)
        }
        
        choosePictureLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-self.view.frame.height/47.76)
            make.centerX.equalToSuperview()
        }
        
        choosePictureImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.8)
            make.height.equalToSuperview().dividedBy(2)
            make.top.equalToSuperview().offset(self.view.frame.height/50)
        }
    }
    
    // MARK: - Selectors
    @objc func takePictureButtonClicked(sender:UIButton){
        
    }
}
