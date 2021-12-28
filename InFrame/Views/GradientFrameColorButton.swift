//
//  GradientFrameColorButton.swift
//  InFrame
//
//  Created by 노연주 on 2021/12/18.
//

import UIKit

class GradientFrameColorButton: UIButton {
    // MARK: - Properties
    private let viewBounds = UIScreen.main.bounds
    
    private lazy var backgroundLayer = CAGradientLayer().then {
        $0.frame = CGRect(x: 0, y: 0, width: viewBounds.width/9.375, height: viewBounds.height/20.3)
        $0.colors = [UIColor.rgb(red: 216, green: 227, blue: 255).cgColor, UIColor.rgb(red: 255, green: 231, blue: 236).cgColor]
        $0.startPoint = CGPoint(x: 0, y: 0)
        $0.endPoint = CGPoint(x: 0, y: 1)
        $0.cornerRadius = viewBounds.width/18.75
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
        self.layer.cornerRadius = viewBounds.width/18.75
        self.layer.shadowRadius = viewBounds.width/18.75
        self.layer.insertSublayer(backgroundLayer, at: 0)
        self.layer.applySketchShadow(x: 0, y: 4, blur: 4)
    }
}
