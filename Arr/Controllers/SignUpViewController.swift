//
//  SignUpViewController.swift
//  Arr
//
//  Created by 노연주 on 2021/08/26.
//

import UIKit
import SnapKit
import Then

class SignUpViewController: UIViewController{
    //MARK: - Properties
    
    lazy var titleLine = UIView().then {
        $0.backgroundColor = .rgb(red: 255, green: 214, blue: 214)
    }
    
    lazy var titleLabel = UILabel().then {
        $0.text = "Sign Up"
        $0.textColor = .rgb(red: 255, green: 135, blue: 133)
        $0.dynamicFont(fontSize: 23, currentFontName: "SeoulNamsanM")
    }
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
       
    //MARK: - Selectors
    
    //MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        addView()
        cornerRadius()
        location()
    }
    
    func addView(){
        view.addSubview(titleLine)
        view.addSubview(titleLabel)
    }
    
    func cornerRadius(){

    }
    
    func location(){
        titleLine.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/14.76)
            make.left.equalToSuperview().offset(self.view.frame.width/10.42)
            make.width.equalToSuperview().dividedBy(4.52)
            make.height.equalToSuperview().dividedBy(90.22)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(titleLine).offset(-self.view.frame.height/406)
            make.right.equalTo(titleLine).offset(self.view.frame.width/46.88)
        }
    }
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct SignUpViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        SignUpViewController()

    }

}
@available(iOS 13.0, *)
struct SignUpViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            SignUpViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
