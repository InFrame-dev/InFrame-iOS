//
//  ChooseFrameViewController.swift
//  InFrame
//
//  Created by 노연주 on 2021/12/05.
//

import UIKit
import SnapKit
import Then

class ChooseFrameViewController: UIViewController {
    //MARK: - Properties
    
    private let imageFrameView = ImagesFrameView()
    
    private let whiteFrameButton = FrameColorButton().then {
        $0.dataSetting(color: .white)
        $0.addTarget(self, action: #selector(whiteButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private let blackFrameButton = FrameColorButton().then {
        $0.dataSetting(color: .black)
        $0.addTarget(self, action: #selector(blackButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private let gradienFrameButton = GradientFrameColorButton().then {
        $0.addTarget(self, action: #selector(gradientButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private let yellowFrameButton = FrameColorButton().then {
        $0.dataSetting(color: .rgb(red: 248, green: 238, blue: 156))
        $0.addTarget(self, action: #selector(yellowButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private let greenFrameButton = FrameColorButton().then {
        $0.dataSetting(color: .rgb(red: 190, green: 236, blue: 203))
        $0.addTarget(self, action: #selector(greenButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private let blueFrameButton = FrameColorButton().then {
        $0.dataSetting(color: .rgb(red: 183, green: 198, blue: 235))
        $0.addTarget(self, action: #selector(blueButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private let purpleFrameButton = FrameColorButton().then {
        $0.dataSetting(color: .rgb(red: 173, green: 172, blue: 241))
        $0.addTarget(self, action: #selector(purpleButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private lazy var frameColorButtonStack = UIStackView(arrangedSubviews: [whiteFrameButton, blackFrameButton, gradienFrameButton, yellowFrameButton, greenFrameButton, blueFrameButton, purpleFrameButton]).then {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = self.view.frame.height/24.61
    }
    
    private let chooseDownButton = ChoiceGradientButton().then {
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
        print("사진 저장하기")
        // 사진 저장 코드
        let saveImage = imageFrameView.asImage()
        UIImageWriteToSavedPhotosAlbum(saveImage, self, nil, nil)
        let nextVC = MainViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc private func whiteButtonClicked(sender:UIButton){
        print("white")
        imageFrameView.layerSetting(startColor: UIColor.rgb(red: 255, green: 255, blue: 255).cgColor, endColor: UIColor.rgb(red: 255, green: 255, blue: 255).cgColor)
        imageFrameView.inFrameLabel.textColor = .black
    }
    
    @objc private func blackButtonClicked(sender:UIButton){
        print("black")
        imageFrameView.layerSetting(startColor: UIColor.rgb(red: 0, green: 0, blue: 0).cgColor, endColor: UIColor.rgb(red: 0, green: 0, blue: 0).cgColor)
    }

    @objc private func gradientButtonClicked(sender:UIButton){
        print("gradient")
        imageFrameView.layerSetting(startColor: UIColor.rgb(red: 216, green: 227, blue: 255).cgColor, endColor: UIColor.rgb(red: 255, green: 231, blue: 236).cgColor)
    }

    @objc private func yellowButtonClicked(sender:UIButton){
        print("yellow")
        imageFrameView.layerSetting(startColor: UIColor.rgb(red: 248, green: 238, blue: 156).cgColor, endColor: UIColor.rgb(red: 248, green: 238, blue: 156).cgColor)
    }

    @objc private func greenButtonClicked(sender:UIButton){
        print("green")
        imageFrameView.layerSetting(startColor: UIColor.rgb(red: 190, green: 236, blue: 203).cgColor, endColor: UIColor.rgb(red: 190, green: 236, blue: 203).cgColor)
    }

    @objc private func blueButtonClicked(sender:UIButton){
        print("blue")
        imageFrameView.layerSetting(startColor: UIColor.rgb(red: 183, green: 198, blue: 235).cgColor, endColor: UIColor.rgb(red: 183, green: 198, blue: 235).cgColor)
    }

    @objc private func purpleButtonClicked(sender:UIButton){
        print("purple")
        imageFrameView.layerSetting(startColor: UIColor.rgb(red: 173, green: 172, blue: 241).cgColor, endColor: UIColor.rgb(red: 173, green: 172, blue: 241).cgColor)
    }

    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
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

//MARK: - Preview
#if DEBUG
import SwiftUI
struct ChooseFrameViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        ChooseFrameViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ChooseFrameViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
