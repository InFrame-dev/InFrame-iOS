//
//  TermsCustomButtonView.swift
//  Arr
//
//  Created by 노연주 on 2021/08/28.
//

import UIKit
import SnapKit
import Then

class TermsCustomButtonView : UIButton {
    var bgColor: UIColor? {
        didSet{
            backgroundColor = bgColor
        }
    }
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        backgroundColor = .rgb(red: 255, green: 255, blue: 255)
        layer.borderColor = UIColor.rgb(red: 255, green: 135, blue: 133).cgColor
        layer.borderWidth = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

