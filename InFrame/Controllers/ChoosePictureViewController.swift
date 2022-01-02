//
//  ChoosePictureViewController.swift
//  InFrame
//
//  Created by 노연주 on 2021/12/03.
//

import UIKit
import SnapKit
import Then

class ChoosePictureViewController: UIViewController {
    //MARK: - Properties
    
    var chooseValues:Int = 0
    var image1:UIImage?
    var image2:UIImage?
    var image3:UIImage?
    var image4:UIImage?
    
    lazy var choiceValueLabel = UILabel().then {
        $0.text = String(chooseValues)+"/4"
        $0.dynamicFont(fontSize: 14, currentFontName: "CarterOne")
        $0.textColor = .rgb(red: 196, green: 196, blue: 196)
    }
    
    private let downloadButton = UIButton().then {
        $0.setImage(UIImage(named: "InFrame_Download"), for: .normal)
        $0.addTarget(self, action: #selector(downloadButtonClicked(sender:)), for: .touchUpInside)
    }
    
    let choicePictures = ChoicePicturesView().then {
        $0.imageCheck1.checkButton.addTarget(self, action: #selector(choice1Clicked(sender:)), for: .touchUpInside)
        $0.imageCheck2.checkButton.addTarget(self, action: #selector(choice2Clicked(sender:)), for: .touchUpInside)
        $0.imageCheck3.checkButton.addTarget(self, action: #selector(choice3Clicked(sender:)), for: .touchUpInside)
        $0.imageCheck4.checkButton.addTarget(self, action: #selector(choice4Clicked(sender:)), for: .touchUpInside)
        $0.imageCheck5.checkButton.addTarget(self, action: #selector(choice5Clicked(sender:)), for: .touchUpInside)
        $0.imageCheck6.checkButton.addTarget(self, action: #selector(choice6Clicked(sender:)), for: .touchUpInside)
    }
    
    private let chooseFilterButton = ChoiceGradientButton().then {
        $0.dataSetting(buttonText: "필터 선택하러 가기")
        $0.addTarget(self, action: #selector(chooseFilterButtonClicked(sender:)), for: .touchUpInside)
    }
    
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
        if chooseValues == 4 {
            let nextVC = ChooseFilterViewController()
            let checkButton:[ImageCheckView] = [choicePictures.imageCheck1, choicePictures.imageCheck2, choicePictures.imageCheck3, choicePictures.imageCheck4, choicePictures.imageCheck5, choicePictures.imageCheck6]
            var images:[UIImage?] = [image1, image2, image3, image4]
            for i in 0..<6{
                for j in 0..<4 {
                    if checkButton[i].checkButton.isSelected == true && images[j] == nil {
                        images[j] = checkButton[i].choiceImage.image
                    }
                }
            }
            nextVC.imageFilterView.dataSetting(imageArray: images)
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    
    @objc func choice1Clicked(sender:UIButton){
        if chooseValues < 4 {
            if choicePictures.imageCheck1.checkButton.isSelected == true {
                agreeButtonUnSelected(button: choicePictures.imageCheck1.checkButton)
                chooseValues = chooseValues - 1
                choiceValueLabel.text = String(chooseValues)+"/4"
            } else {
                agreeButtonSelected(button: choicePictures.imageCheck1.checkButton)
                chooseValues = chooseValues + 1
                choiceValueLabel.text = String(chooseValues)+"/4"
            }
        }
    }
    
    @objc func choice2Clicked(sender:UIButton){
        if chooseValues < 4 {
            if choicePictures.imageCheck2.checkButton.isSelected == true {
                agreeButtonUnSelected(button: choicePictures.imageCheck2.checkButton)
                chooseValues = chooseValues - 1
                choiceValueLabel.text = String(chooseValues)+"/4"
            } else {
                agreeButtonSelected(button: choicePictures.imageCheck2.checkButton)
                chooseValues = chooseValues + 1
                choiceValueLabel.text = String(chooseValues)+"/4"
            }
        }
    }
    
    @objc func choice3Clicked(sender:UIButton){
        if chooseValues < 4 {
            if choicePictures.imageCheck3.checkButton.isSelected == true {
                agreeButtonUnSelected(button: choicePictures.imageCheck3.checkButton)
                chooseValues = chooseValues - 1
                choiceValueLabel.text = String(chooseValues)+"/4"
            } else {
                agreeButtonSelected(button: choicePictures.imageCheck3.checkButton)
                chooseValues = chooseValues + 1
                choiceValueLabel.text = String(chooseValues)+"/4"
            }
        }
    }
    
    @objc func choice4Clicked(sender:UIButton){
        if chooseValues < 4 {
            if choicePictures.imageCheck4.checkButton.isSelected == true {
                agreeButtonUnSelected(button: choicePictures.imageCheck4.checkButton)
                chooseValues = chooseValues - 1
                choiceValueLabel.text = String(chooseValues)+"/4"
            } else {
                agreeButtonSelected(button: choicePictures.imageCheck4.checkButton)
                chooseValues = chooseValues + 1
                choiceValueLabel.text = String(chooseValues)+"/4"
            }
        }
    }
    
    @objc func choice5Clicked(sender:UIButton){
        if chooseValues < 4 {
            if choicePictures.imageCheck5.checkButton.isSelected == true {
                agreeButtonUnSelected(button: choicePictures.imageCheck5.checkButton)
                chooseValues = chooseValues - 1
                choiceValueLabel.text = String(chooseValues)+"/4"
            } else {
                agreeButtonSelected(button: choicePictures.imageCheck5.checkButton)
                chooseValues = chooseValues + 1
                choiceValueLabel.text = String(chooseValues)+"/4"
            }
        }
    }
    
    @objc func choice6Clicked(sender:UIButton){
        if chooseValues < 4 {
            if choicePictures.imageCheck6.checkButton.isSelected == true {
                agreeButtonUnSelected(button: choicePictures.imageCheck6.checkButton)
                chooseValues = chooseValues - 1
                choiceValueLabel.text = String(chooseValues)+"/4"
            } else {
                agreeButtonSelected(button: choicePictures.imageCheck6.checkButton)
                chooseValues = chooseValues + 1
                choiceValueLabel.text = String(chooseValues)+"/4"
            }
        }
    }
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        addView()
        location()
    }
    
    // MARK: - Add View
    
    private func addView(){
        [choiceValueLabel, downloadButton, choicePictures, chooseFilterButton].forEach{ view.addSubview($0) }
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
        
        choicePictures.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(downloadButton.snp.bottom).offset(self.view.frame.height/58)
            make.width.equalToSuperview().dividedBy(1.16)
            make.height.equalToSuperview().dividedBy(2.37)
        }
        
        chooseFilterButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(self.view.frame.height/12.5)
            make.height.equalToSuperview().dividedBy(19.80)
            make.left.equalToSuperview().offset(self.view.frame.width/8.52)
        }
    }
    
    // MARK: - agreeButtonUnSelected
    private func agreeButtonUnSelected(button:UIButton){
        button.layer.sublayers?.remove(at: 0)
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.isSelected = false
    }
    
    // MARK: - agreeButtonSelected
    private func agreeButtonSelected(button:UIButton){
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width/16, height: self.view.frame.width/16))
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
