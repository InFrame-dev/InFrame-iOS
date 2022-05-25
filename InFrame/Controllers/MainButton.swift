//
//  MainButton.swift
//  InFrame
//
//  Created by 김유진 on 2021/09/28.
//

import UIKit

final class MainButton: UIButton {

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
    func configureUI(){
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 7
        self.layer.shadowOpacity = 0.3
    }
}
