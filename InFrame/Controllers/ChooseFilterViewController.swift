//
//  ChooseFilterViewController.swift
//  InFrame
//
//  Created by 노연주 on 2021/12/05.
//

import UIKit
import SnapKit
import Then

class ChooseFilterViewController: UIViewController {
    //MARK: - Properties
    
    private let imageFilterView = ImageFilterView()
    
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
        [imageFilterView].forEach { view.addSubview($0) }
    }
    
    // MARK: - Location
    
    private func location(){
        imageFilterView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(self.view.frame.height/4.16)
            make.width.equalToSuperview().dividedBy(1.16)
            make.height.equalToSuperview().dividedBy(3.64)
        }
    }
    
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct ChooseFilterViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        ChooseFilterViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ChooseFilterViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
