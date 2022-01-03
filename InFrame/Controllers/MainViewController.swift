//
//  MainViewController.swift
//  InFrame
//
//  Created by 김유진 on 2021/09/28.
//

import UIKit
import BSImagePicker

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
        $0.addTarget(self, action: #selector(choosePictureButtonClicked(sender:)), for: .touchUpInside)
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
    private func configureUI(){
        addView()
        location()
    }
    
    // MARK: - addView
    private func addView(){
        self.view.backgroundColor = .white
        [inFrameTitleLabel, saveLabel, takePictureButton,choosePictureButton].forEach { view.addSubview($0) }
        [takePictureLabel, takePictureImageView].forEach { takePictureButton.addSubview($0) }
        [choosePictureLabel, choosePictureImageView].forEach { choosePictureButton.addSubview($0) }
    }
    
    // MARK: - addLayout
    private func location(){
        inFrameTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/7)
            make.left.equalToSuperview().offset(self.view.frame.width/7.81)
        }
        saveLabel.snp.makeConstraints { make in
            make.left.equalTo(inFrameTitleLabel)
            make.top.equalTo(inFrameTitleLabel.snp.bottom)
        }
        takePictureButton.snp.makeConstraints { make in
            make.left.equalTo(inFrameTitleLabel)
            make.top.equalTo(saveLabel.snp.bottom).offset(self.view.frame.height/18)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(4.64)
        }
        takePictureLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-self.view.frame.height/47.76)
            make.centerX.equalToSuperview()
        }
        takePictureImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2.8)
            make.height.equalToSuperview().dividedBy(2.4)
            make.top.equalToSuperview().offset(self.view.frame.height/30)
        }
        choosePictureButton.snp.makeConstraints { make in
            make.left.equalTo(takePictureButton)
            make.top.equalTo(takePictureButton.snp.bottom).offset(self.view.frame.height/27.06)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(4.64)
        }
        choosePictureLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-self.view.frame.height/47.76)
            make.centerX.equalToSuperview()
        }
        choosePictureImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalToSuperview().dividedBy(2)
            make.top.equalToSuperview().offset(self.view.frame.height/50)
        }
    }
    
    // MARK: - Selectors
    @objc private func takePictureButtonClicked(sender:UIButton){
        let nextVC = TakePictureViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc private func choosePictureButtonClicked(sender:UIButton){
        
    }
}
