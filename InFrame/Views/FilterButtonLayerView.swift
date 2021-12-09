//
//  FilterButtonLayerView.swift
//  InFrame
//
//  Created by 노연주 on 2021/12/05.
//

import UIKit

class FilterButtonLayerView: UIView {
    // MARK: - Properties
    private let viewBounds = UIScreen.main.bounds
    
    private let filterImage = UIImageView().then {
        $0.image = UIImage(named: "InFrame_FilterBlack")
    }
    
    private let filterKorean = UILabel().then {
        $0.text = "흑백"
        $0.textColor = .rgb(red: 58, green: 58, blue: 58)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    private let filterEnglish = UILabel().then {
        $0.text = "BLACK"
        $0.textColor = .rgb(red: 124, green: 124, blue: 124)
        $0.dynamicFont(fontSize: 10, currentFontName: "CarterOne")
    }
    
    // MARK: - LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureUI()
    }
    
    // MARK: - Helpers
    private func configureUI(){
        addView()
        location()
    }
    
    // MARK: - addView
    private func addView(){
        [filterImage, filterKorean, filterEnglish].forEach { addSubview($0) }
    }
    
    // MARK: - location
    private func location(){
        filterImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(viewBounds.height/40.6)
            make.left.equalToSuperview().offset(viewBounds.width/19.74)
            make.width.equalTo(viewBounds.width/6.82)
            make.height.equalTo(filterImage.snp.width)
        }
        
        filterKorean.snp.makeConstraints { make in
            make.top.equalTo(filterImage.snp.bottom).offset(viewBounds.height/90.22)
            make.centerX.equalTo(filterImage)
        }
        
        filterEnglish.snp.makeConstraints { make in
            make.top.equalTo(filterKorean.snp.bottom).offset(viewBounds.height/270.67)
            make.centerX.equalTo(filterImage)
        }
    }
    
    // MARK: - dataSetting
    func dataSetting(image:String, koreanText:String, englishText:String){
        filterImage.image = UIImage(named: image)
        filterKorean.text = koreanText
        filterEnglish.text = englishText
    }
}
