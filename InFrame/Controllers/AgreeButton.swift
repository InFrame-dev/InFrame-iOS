//
//  AgreeButton.swift
//  InFrame
//
//  Created by 김유진 on 2021/09/27.
//

import UIKit

class AgreeButton: UIButton {

    //MARK: - LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        configureUI()
    }
    
    //MARK: - helpers
    func configureUI(){
        self.backgroundColor = UIColor.rgb(red: 250, green: 250, blue: 250)
        self.layer.borderColor = UIColor.rgb(red: 225, green: 225, blue: 225).cgColor
        self.layer.cornerRadius = 5
    }
}
