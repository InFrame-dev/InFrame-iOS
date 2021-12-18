//
//  FrameColorButton.swift
//  InFrame
//
//  Created by 노연주 on 2021/12/05.
//

import UIKit

class FrameColorButton: UIButton {
    // MARK: - Properties
    private let viewBounds = UIScreen.main.bounds
    
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
        self.layer.cornerRadius = viewBounds.width/18.75
        self.layer.shadowRadius = viewBounds.width/18.75
        self.layer.applySketchShadow(x: 0, y: 4, blur: 4)
    }
    
    // MARK: - dataSetting
    func dataSetting(color: UIColor){
        self.backgroundColor = color
    }
}
