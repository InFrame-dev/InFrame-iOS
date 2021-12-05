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
    
    private let blackButton = FilterButton().then {
        $0.dataSetting(image: "InFrame_FilterBlack", koreanText: "흑백", englishText: "BLACK")
    }
    
    private let basicButton = FilterButton().then {
        $0.dataSetting(image: "InFrame_FilterBasic", koreanText: "기본", englishText: "BASIC")
    }
    
    private let lightButton = FilterButton().then {
        $0.dataSetting(image: "InFrame_FilterLight", koreanText: "밝게", englishText: "LIGHT")
    }
    
    private lazy var filterButtonStackView = UIStackView(arrangedSubviews: [blackButton, basicButton, lightButton]).then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = self.view.frame.width/26.79
    }
    
    private let chooseFrameButton = ChoiceGradientButton().then {
        $0.dataSetting(buttonText: "프레임 선택하러 가기")
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
        [imageFilterView, filterButtonStackView, chooseFrameButton].forEach { view.addSubview($0) }
    }
    
    // MARK: - Location
    
    private func location(){
        imageFilterView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(self.view.frame.height/4.16)
            make.width.equalToSuperview().dividedBy(1.16)
            make.height.equalToSuperview().dividedBy(3.64)
        }
        
        filterButtonStackView.snp.makeConstraints { make in
            make.top.equalTo(imageFilterView.snp.bottom).offset(self.view.frame.height/10.68)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.21)
            make.height.equalToSuperview().dividedBy(6.44)
        }
        
        chooseFrameButton.snp.makeConstraints { make in
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
