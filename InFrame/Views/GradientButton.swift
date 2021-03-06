//
//  GradientButton.swift
//  InFrame
//
//  Created by 김유진 on 2021/12/01.
//

import Foundation
import UIKit

final class GradientButton: UIButton{
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
        let view = UIView(frame: CGRect(x: 0, y: 0, width: viewBounds.width/1.4, height: viewBounds.height/19.80))
        let gradient = CAGradientLayer()

        gradient.frame = view.bounds
        gradient.colors = [UIColor.rgb(red: 126, green: 152, blue: 212).cgColor, UIColor.rgb(red: 250, green: 186, blue: 200).cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)

        self.layer.insertSublayer(gradient, at: 0)
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        self.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    // MARK: - dataSetting
    func dataSetting(buttonText: String){
        self.setTitle(buttonText, for: .normal)
    }
}
