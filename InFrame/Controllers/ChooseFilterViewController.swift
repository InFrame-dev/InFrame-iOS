//
//  ChooseFilterViewController.swift
//  InFrame
//
//  Created by 노연주 on 2021/12/05.
//

import UIKit
import SnapKit
import Then

class ChooseFilterViewController: UIViewController {
    //MARK: - Properties
    
    private let imageFilterView = ImageFilterView()
    
    private let blackButton = FilterButton().then {
        $0.dataSetting(image: "InFrame_FilterBlack", koreanText: "흑백", englishText: "BLACK")
        $0.addTarget(self, action: #selector(chooseBlackFilterClicked(sender:)), for: .touchUpInside)
    }
    
    private let basicButton = FilterButton().then {
        $0.dataSetting(image: "InFrame_FilterBasic", koreanText: "기본", englishText: "BASIC")
        $0.addTarget(self, action: #selector(chooseBasicFilterClicked(sender:)), for: .touchUpInside)
    }
    
    private let lightButton = FilterButton().then {
        $0.dataSetting(image: "InFrame_FilterLight", koreanText: "밝게", englishText: "LIGHT")
        $0.addTarget(self, action: #selector(chooseLightFilterClicked(sender:)), for: .touchUpInside)
    }
    
    private lazy var filterButtonStackView = UIStackView(arrangedSubviews: [blackButton, basicButton, lightButton]).then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = self.view.frame.width/26.79
    }
    
    private let chooseFrameButton = ChoiceGradientButton().then {
        $0.dataSetting(buttonText: "프레임 선택하러 가기")
        $0.addTarget(self, action: #selector(chooseFrameButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private let imageUrl1 = URL(fileURLWithPath: "")
    private let imageUrl2 = URL(fileURLWithPath: "")
    private let imageUrl3 = URL(fileURLWithPath: "")
    private let imageUrl4 = URL(fileURLWithPath: "")

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    
    @objc private func chooseFrameButtonClicked(sender:UIButton){
        print("프레임 선택하러 가기")
        let nextVC = ChooseFrameViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc private func chooseBlackFilterClicked(sender:UIButton){
        imageFilterView.dataSetting(imageArray: applyFilterImage(imageUrlArray: [imageUrl1, imageUrl2, imageUrl3, imageUrl4], filter: "CIPhotoEffectNoir"))
    }
    
    @objc private func chooseBasicFilterClicked(sender:UIButton){
        imageFilterView.dataSetting(imageArray: applyFilterImage(imageUrlArray: [imageUrl1, imageUrl2, imageUrl3, imageUrl4], filter: "basic"))
    }

    @objc private func chooseLightFilterClicked(sender:UIButton){
        imageFilterView.dataSetting(imageArray: applyFilterImage(imageUrlArray: [imageUrl1, imageUrl2, imageUrl3, imageUrl4], filter: "CIPhotoEffectNoir"))
    }

    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        addView()
        location()
    }
    
    // MARK: - Add View
    
    private func addView(){
        [imageFilterView, filterButtonStackView, chooseFrameButton].forEach { view.addSubview($0) }
    }
    
    // MARK: - Location
    
    private func location(){
        imageFilterView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(self.view.frame.height/4.16)
            make.width.equalToSuperview().dividedBy(1.16)
            make.height.equalToSuperview().dividedBy(3.64)
        }
        
        filterButtonStackView.snp.makeConstraints { make in
            make.top.equalTo(imageFilterView.snp.bottom).offset(self.view.frame.height/10.68)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.21)
            make.height.equalToSuperview().dividedBy(6.44)
        }
        
        chooseFrameButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(self.view.frame.height/12.5)
            make.height.equalToSuperview().dividedBy(19.80)
            make.left.equalToSuperview().offset(self.view.frame.width/8.52)
        }
    }
    
    // 사진을 받아 필터를 적용시켜 반환하는 함수
    private func applyFilter(_ input: CIImage, intensity: Double, filterName: String) -> CIImage? {
        let sepiaFilter = CIFilter(name: filterName)
        sepiaFilter?.setValue(input, forKey: kCIInputImageKey)
        sepiaFilter?.setValue(intensity, forKey: kCIInputIntensityKey)
        return filterName == "" ? input : sepiaFilter?.outputImage
    }
    
    // 필터가 적용된 사진을 담은 배열을 반환하는 함수
    private func applyFilterImage(imageUrlArray:[URL], filter: String) -> [UIImage]{
        var resultImageArray: [UIImage] = []
        
        for i in 0...3{
            let beginImage = CIImage(contentsOf: imageUrlArray[i])
            resultImageArray.append(UIImage(ciImage: applyFilter(beginImage!, intensity: 0.8, filterName: filter)!))
        }
        
        return [UIImage]()
    }
}
