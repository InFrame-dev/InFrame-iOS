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
    }
    
    private let blackFrameButton = FrameColorButton().then {
        $0.dataSetting(color: .black)
    }
    
    private let gradienFrameButton = FrameColorButton().then {
        $0.dataSetting(color: .orange)
    }
    
    private let yellowFrameButton = FrameColorButton().then {
        $0.dataSetting(color: .rgb(red: 248, green: 238, blue: 156))
    }
    
    private let greenFrameButton = FrameColorButton().then {
        $0.dataSetting(color: .rgb(red: 190, green: 236, blue: 203))
    }
    
    private let blueFrameButton = FrameColorButton().then {
        $0.dataSetting(color: .rgb(red: 183, green: 198, blue: 235))
    }
    
    private let purpleFrameButton = FrameColorButton().then {
        $0.dataSetting(color: .rgb(red: 173, green: 172, blue: 241))
    }
    
    private lazy var frameColorButtonStack = UIStackView(arrangedSubviews: [whiteFrameButton, blackFrameButton, gradienFrameButton, yellowFrameButton, greenFrameButton, blueFrameButton, purpleFrameButton]).then {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = self.view.frame.height/24.61
    }
    
    private let chooseDownButton = ChoiceGradientButton().then {
        $0.dataSetting(buttonText: "사진 저장하기")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    
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
