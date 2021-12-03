//
//  TakePictureViewController.swift
//  InFrame
//
//  Created by 노연주 on 2021/11/28.
//

import UIKit
import Then
import SnapKit

class TakePictureViewController: UIViewController {
    //MARK: - Properties
    
    private let backButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "InFrame_BackButtonImage"), for: .normal)
    }
    
    private let returnButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "InFrame_Return"), for: .normal)
    }
    
    private let takeValueLabel = UILabel().then {
        $0.text = "3/6"
        $0.dynamicFont(fontSize: 14, currentFontName: "CarterOne")
        $0.textColor = .rgb(red: 196, green: 196, blue: 196)
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
        cornerRadius()
        location()
    }
    
    // MARK: - Add View
    
    private func addView(){
        [backButton, returnButton, takeValueLabel].forEach { view.addSubview($0)
        }
    }
    
    // MARK: - Corner Radius
    
    private func cornerRadius(){
        
    }
    
    // MARK: - Location
    
    private func location(){
        backButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/15)
            make.top.equalToSuperview().offset(self.view.frame.height/10.02)
            make.width.equalToSuperview().dividedBy(46.88)
            make.height.equalToSuperview().dividedBy(47.76)
        }
        
        returnButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(self.view.frame.width/12.93)
            make.centerY.equalTo(backButton)
            make.width.equalToSuperview().dividedBy(19.74)
            make.height.equalToSuperview().dividedBy(42.74)
        }
        
        takeValueLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(self.view.frame.height/5.38)
        }
    }
    
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct TakePictureViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        TakePictureViewController()
    }
}
@available(iOS 13.0, *)
struct TakePictureViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            TakePictureViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif

