//
//  FilterButton.swift
//  InFrame
//
//  Created by 노연주 on 2021/12/05.
//

import UIKit

class FilterButton: UIButton {
    // MARK: - Properties
    private let viewBounds = UIScreen.main.bounds
    
    private let filterButtonBackground = FilterButtonLayerView()
    
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
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.3
    }
    
    // MARK: - addView
    private func addView(){
        [filterButtonBackground].forEach { addSubview($0) }
    }
    
    // MARK: - dataSetting
    func dataSetting(image:UIImage, koreanText:String, englishText:String){
        filterButtonBackground.dataSetting(image: image, koreanText: koreanText, englishText: englishText)
    }
}
