//
//  ImageFilterView.swift
//  InFrame
//
//  Created by 노연주 on 2021/12/05.
//

import UIKit

class ImageFilterView: UIView {
    // MARK: - Properties
    private let viewBounds = UIScreen.main.bounds
    
    private let imageFilter1 = UIImageView()
    
    private let imageFilter2 = UIImageView()
    
    private let imageFilter3 = UIImageView()
    
    private let imageFilter4 = UIImageView()
    
    private lazy var imageFilterLine1 = UIStackView(arrangedSubviews: [imageFilter1, imageFilter2]).then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = viewBounds.width/27
    }
    
    private lazy var imageFilterLine2 = UIStackView(arrangedSubviews: [imageFilter3, imageFilter4]).then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = viewBounds.width/27
    }
    
    private lazy var imageFilterView = UIStackView(arrangedSubviews: [imageFilterLine1, imageFilterLine2]).then {
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
        [imageFilterView].forEach { addSubview($0) }
    }
    
    // MARK: - location
    private func location(){
        imageFilterView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - dataSetting
    func dataSetting(imageArray: [UIImage?]){
        imageFilter1.backgroundColor = .white
        imageFilter2.backgroundColor = .white
        imageFilter3.backgroundColor = .white
        imageFilter4.backgroundColor = .white
        
        imageFilter1.image = imageArray[0]
        imageFilter2.image = imageArray[1]
        imageFilter3.image = imageArray[2]
        imageFilter4.image = imageArray[3]
    }
}
