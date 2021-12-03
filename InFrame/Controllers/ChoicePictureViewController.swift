//
//  ChoicePictureViewController.swift
//  InFrame
//
//  Created by 노연주 on 2021/12/03.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    //MARK: - Properties
    
    private let choiceValueLabel = UILabel().then {
        $0.text = "3/4"
        $0.dynamicFont(fontSize: 14, currentFontName: "CarterOne")
        $0.textColor = .rgb(red: 196, green: 196, blue: 196)
    }
    
    private let downloadButton = UIButton().then {
        $0.setImage(UIImage(named: "InFrame_Download"), for: .normal)
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
        [choiceValueLabel, downloadButton].forEach{ view.addSubview($0) }
    }
    
    // MARK: - Corner Radius
    
    private func cornerRadius(){
        
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
    }
    
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        ViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif

