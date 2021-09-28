//
//  MainViewController.swift
//  InFrame
//
//  Created by 김유진 on 2021/09/28.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - Properties
    private let inFrameTitleLabel = UILabel().then{
        $0.text = "InFrame"
        $0.dynamicFont(fontSize: 30, currentFontName: "CarterOne")
        $0.updateGradientTextColor_horizontal(gradientColors: [UIColor.rgb(red: 126, green: 152, blue: 212), UIColor.rgb(red: 251, green: 186, blue: 200)])
    }

    private let saveLabel = UILabel().then{
        $0.text = "여러분의 순간을 특별하게 저장해보세요!"
        $0.dynamicFont(fontSize: 16, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    // MARK: - Helpers
    func configureUI(){
        addView()
        
        addLayout()
    }
    
    func addView(){
        self.view.backgroundColor = .white
        self.view.addSubview(inFrameTitleLabel)
        self.view.addSubview(saveLabel)
    }
    
    func addLayout(){
        inFrameTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/9.02)
            make.left.equalToSuperview().offset(self.view.frame.width/7.81)
        }
        
        saveLabel.snp.makeConstraints { make in
            make.left.equalTo(inFrameTitleLabel)
            make.top.equalTo(inFrameTitleLabel.snp.bottom)
        }
    }
    
    // MARK: - Selectors
    
}
