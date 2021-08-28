//
//  TermInButtonView.swift
//  Arr
//
//  Created by 노연주 on 2021/08/28.
//

import UIKit
import SnapKit
import Then

class TermInButtonView : UIButton {
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        setBackgroundImage(UIImage(named: "Arr-termInButton"), for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

