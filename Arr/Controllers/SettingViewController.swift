//
//  SettingViewController.swift
//  Arr
//
//  Created by 노연주 on 2021/09/02.
//

import UIKit
import SnapKit
import Then

class SettingViewController:UIViewController {
    //MARK: - Properties
    
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
        
    }
    
    func cornerRadius(){
        
    }
    
    func location(){
        
    }
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct SettingViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        SettingViewController()
    }

}
@available(iOS 13.0, *)
struct SettingViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            SettingViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif

