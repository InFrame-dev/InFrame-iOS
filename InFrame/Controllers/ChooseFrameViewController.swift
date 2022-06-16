//
//  ChooseFrameViewController.swift
//  InFrame
//
//  Created by 노연주 on 2021/12/05.
//

import UIKit
import SnapKit
import Then

final class ChooseFrameViewController: UIViewController {
    //MARK: - Properties

    var lastImage1:UIImage?
    var lastImage2:UIImage?
    var lastImage3:UIImage?
    var lastImage4:UIImage?

    private let imageFrameView = ImagesFrameView()

    private lazy var whiteFrameButton = FrameColorButton().then {
        $0.dataSetting(color: .white)
        $0.addTarget(self, action: #selector(whiteButtonClicked(sender:)), for: .touchUpInside)
    }

    private lazy var blackFrameButton = FrameColorButton().then {
        $0.dataSetting(color: .black)
        $0.addTarget(self, action: #selector(blackButtonClicked(sender:)), for: .touchUpInside)
    }

    private lazy var gradienFrameButton = GradientFrameColorButton().then {
        $0.addTarget(self, action: #selector(gradientButtonClicked(sender:)), for: .touchUpInside)
    }

    private lazy var yellowFrameButton = FrameColorButton().then {
        $0.dataSetting(color: .rgb(red: 248, green: 238, blue: 156))
        $0.addTarget(self, action: #selector(yellowButtonClicked(sender:)), for: .touchUpInside)
    }

    private lazy var greenFrameButton = FrameColorButton().then {
        $0.dataSetting(color: .rgb(red: 190, green: 236, blue: 203))
        $0.addTarget(self, action: #selector(greenButtonClicked(sender:)), for: .touchUpInside)
    }

    private lazy var blueFrameButton = FrameColorButton().then {
        $0.dataSetting(color: .rgb(red: 183, green: 198, blue: 235))
        $0.addTarget(self, action: #selector(blueButtonClicked(sender:)), for: .touchUpInside)
    }

    private lazy var purpleFrameButton = FrameColorButton().then {
        $0.dataSetting(color: .rgb(red: 173, green: 172, blue: 241))
        $0.addTarget(self, action: #selector(purpleButtonClicked(sender:)), for: .touchUpInside)
    }

    private lazy var frameColorButtonStack = UIStackView(arrangedSubviews: [whiteFrameButton, blackFrameButton, gradienFrameButton, yellowFrameButton, greenFrameButton, blueFrameButton, purpleFrameButton]).then {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = self.view.frame.height/24.61
    }

    private lazy var chooseDownButton = ChoiceGradientButton().then {
        $0.dataSetting(buttonText: "사진 저장하기")
        $0.addTarget(self, action: #selector(chooseSaveButtonClicked(sender:)), for: .touchUpInside)
    }

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    //MARK: - Selectors

    @objc private func chooseSaveButtonClicked(sender:UIButton){
        // 사진 저장 코드
        let saveImage = imageFrameView.asImage()
        UIImageWriteToSavedPhotosAlbum(saveImage, self, nil, nil)
        let nextVC = MainViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

    @objc private func whiteButtonClicked(sender:UIButton){
        imageFrameView.layerSetting(startColor: UIColor.rgb(red: 255, green: 255, blue: 255).cgColor, endColor: UIColor.rgb(red: 255, green: 255, blue: 255).cgColor)
        imageFrameView.inFrameLabel.textColor = .black
    }

    @objc private func blackButtonClicked(sender:UIButton){
        imageFrameView.layerSetting(startColor: UIColor.rgb(red: 0, green: 0, blue: 0).cgColor, endColor: UIColor.rgb(red: 0, green: 0, blue: 0).cgColor)
        imageFrameView.inFrameLabel.textColor = .white
    }

    @objc private func gradientButtonClicked(sender:UIButton){
        imageFrameView.layerSetting(startColor: UIColor.rgb(red: 216, green: 227, blue: 255).cgColor, endColor: UIColor.rgb(red: 255, green: 231, blue: 236).cgColor)
        imageFrameView.inFrameLabel.textColor = .white
    }

    @objc private func yellowButtonClicked(sender:UIButton){
        imageFrameView.layerSetting(startColor: UIColor.rgb(red: 248, green: 238, blue: 156).cgColor, endColor: UIColor.rgb(red: 248, green: 238, blue: 156).cgColor)
        imageFrameView.inFrameLabel.textColor = .white
    }

    @objc private func greenButtonClicked(sender:UIButton){
        imageFrameView.layerSetting(startColor: UIColor.rgb(red: 190, green: 236, blue: 203).cgColor, endColor: UIColor.rgb(red: 190, green: 236, blue: 203).cgColor)
        imageFrameView.inFrameLabel.textColor = .white
    }

    @objc private func blueButtonClicked(sender:UIButton){
        imageFrameView.layerSetting(startColor: UIColor.rgb(red: 183, green: 198, blue: 235).cgColor, endColor: UIColor.rgb(red: 183, green: 198, blue: 235).cgColor)
        imageFrameView.inFrameLabel.textColor = .white
    }

    @objc private func purpleButtonClicked(sender:UIButton){
        imageFrameView.layerSetting(startColor: UIColor.rgb(red: 173, green: 172, blue: 241).cgColor, endColor: UIColor.rgb(red: 173, green: 172, blue: 241).cgColor)
        imageFrameView.inFrameLabel.textColor = .white
    }


    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        imageFrameView.dataSetting(image1: self.lastImage1, image2: self.lastImage2, image3: self.lastImage3, image4: self.lastImage4)
        addView()
        location()
    }

    // MARK: - Add View

    private func addView(){
        [imageFrameView, frameColorButtonStack, chooseDownButton].forEach { view.addSubview($0)}
    }

    // MARK: - Location

    private func location(){
        imageFrameView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/6.94)
            make.top.equalToSuperview().offset(self.view.frame.height/9.02)
            make.width.equalToSuperview().dividedBy(1.98)
            make.height.equalToSuperview().dividedBy(1.48)
        }

        frameColorButtonStack.snp.makeConstraints { make in
            make.centerY.equalTo(imageFrameView)
            make.left.equalTo(imageFrameView.snp.right).offset(self.view.frame.width/10.71)
            make.width.equalToSuperview().dividedBy(9.38)
            make.height.equalToSuperview().dividedBy(1.7)
        }

        chooseDownButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(self.view.frame.height/12.5)
            make.height.equalToSuperview().dividedBy(19.80)
            make.left.equalToSuperview().offset(self.view.frame.width/8.52)
        }
    }

}
