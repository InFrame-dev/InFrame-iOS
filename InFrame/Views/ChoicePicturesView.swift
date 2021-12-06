//
//  ChoicePicturesView.swift
//  InFrame
//
//  Created by 노연주 on 2021/12/04.
//

import UIKit

class ChoicePicturesView: UIView {
    // MARK: - Properties
    private let viewBounds = UIScreen.main.bounds
    
    private let imageCheck1 = ImageCheckView()
    private let imageCheck2 = ImageCheckView()
    private let imageCheck3 = ImageCheckView()
    private let imageCheck4 = ImageCheckView()
    private let imageCheck5 = ImageCheckView()
    private let imageCheck6 = ImageCheckView()
    
    private lazy var imageCheckLine1 = UIStackView(arrangedSubviews: [imageCheck1, imageCheck2]).then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = viewBounds.width/27
    }
    
    private lazy var imageCheckLine2 = UIStackView(arrangedSubviews: [imageCheck3, imageCheck4]).then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = viewBounds.width/27
    }
    
    private lazy var imageCheckLine3 = UIStackView(arrangedSubviews: [imageCheck5, imageCheck6]).then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = viewBounds.width/27
    }
    
    private lazy var imageCheckView = UIStackView(arrangedSubviews: [imageCheckLine1, imageCheckLine2, imageCheckLine3]).then {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = viewBounds.height/58
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
        [imageCheckView].forEach { addSubview($0) }
    }
    
    // MARK: - location
    private func location(){
        imageCheckView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - dataSetting
    func dataSetting(image1: UIImage, image2: UIImage, image3: UIImage, image4: UIImage, image5: UIImage, image6: UIImage){
        imageCheck1.dataSetting(image: image1)
        imageCheck1.dataSetting(image: image2)
        imageCheck1.dataSetting(image: image3)
        imageCheck1.dataSetting(image: image4)
        imageCheck1.dataSetting(image: image5)
        imageCheck1.dataSetting(image: image6)
    }
}
