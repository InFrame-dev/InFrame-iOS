//
//  ChoicePictureViewController.swift
//  InFrame
//
//  Created by 노연주 on 2021/12/03.
//

import UIKit
import SnapKit
import Then

class ChoicePictureViewController: UIViewController {
    //MARK: - Properties
    
    private let choiceValueLabel = UILabel().then {
        $0.text = "3/4"
        $0.dynamicFont(fontSize: 14, currentFontName: "CarterOne")
        $0.textColor = .rgb(red: 196, green: 196, blue: 196)
    }
    
    private let downloadButton = UIButton().then {
        $0.setImage(UIImage(named: "InFrame_Download"), for: .normal)
        $0.addTarget(self, action: #selector(downloadButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private let chooseFilterButton = ChoiceGradientButton().then {
        $0.dataSetting(buttonText: "필터 선택하러 가기")
        $0.addTarget(self, action: #selector(chooseFilterButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private let choicePictures = ChoicePicturesView()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    
    @objc private func downloadButtonClicked(sender:UIButton){
        print("Download")
        // 사진 저장 기능 코드
    }
    
    @objc private func chooseFilterButtonClicked(sender:UIButton){
        print("필터 선택하러 가기")
//        let nextVC = 필터선택VC()
//        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        addView()
        location()
    }
    
    // MARK: - Add View
    
    private func addView(){
        [choiceValueLabel, downloadButton, chooseFilterButton, choicePictures].forEach{ view.addSubview($0) }
    }
    
    // MARK: - Location
    
    private func location(){
        choiceValueLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(self.view.frame.height/9.23)
        }
        
        downloadButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(self.view.frame.width/12.5)
            make.top.equalTo(choiceValueLabel.snp.bottom).offset(self.view.frame.height/15.92)
            make.width.equalToSuperview().dividedBy(22.06)
            make.height.equalTo(downloadButton.snp.width)
        }
        
        chooseFilterButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(self.view.frame.height/12.5)
            make.height.equalToSuperview().dividedBy(19.80)
            make.left.equalToSuperview().offset(self.view.frame.width/8.52)
        }
        
        choicePictures.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(downloadButton.snp.bottom).offset(self.view.frame.height/58)
            make.width.equalToSuperview().dividedBy(1.16)
            make.height.equalToSuperview().dividedBy(2.37)
        }
    }
    
}
