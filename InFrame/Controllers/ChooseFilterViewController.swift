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
    private let viewBounds = UIScreen.main.bounds
    
    private var context = CIContext()
    
    let imageFilterView = ImageFilterView()
    
    private let blackButton = FilterButton().then {
        $0.addTarget(self, action: #selector(chooseBlackFilterClicked(sender:)), for: .touchUpInside)
    }
    
    private let basicButton = FilterButton().then {
        $0.addTarget(self, action: #selector(chooseBasicFilterClicked(sender:)), for: .touchUpInside)
    }
    
    private let lightButton = FilterButton().then {
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
    
    private var imageUrl1 = UIImageView().then{
        $0.image = UIImage(named: "InFrame_TestImage")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private var imageUrl2 = UIImageView().then{
        $0.image = UIImage(named: "InFrame_TestImage")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private var imageUrl3 = UIImageView().then{
        $0.image = UIImage(named: "InFrame_TestImage")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private var imageUrl4 = UIImageView().then{
        $0.image = UIImage(named: "InFrame_TestImage")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private lazy var imageTopStackView = UIStackView(arrangedSubviews: [imageUrl1, imageUrl2]).then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = viewBounds.width/31.25
    }

    private lazy var imagebottomStackView = UIStackView(arrangedSubviews: [imageUrl3, imageUrl4]).then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = viewBounds.width/31.25
    }

    
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
        applyFilter(to: UIImage(named: "InFrame_TestImage")!, filterName: "CIPhotoEffectNoir") { image in
            self.resetImage(image: image)
        }
    }
    
    @objc private func chooseBasicFilterClicked(sender:UIButton){
        resetImage(image: UIImage(named: "InFrame_TestImage")!)
    }
    
    @objc private func chooseLightFilterClicked(sender:UIButton){
        applyFilter(to: UIImage(named: "InFrame_TestImage")!, filterName: "CIExposureAdjust") { image in
            self.resetImage(image: image)
        }
    }
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        addView()
        location()
        filterPreviewImage()
    }
    
    // MARK: - Add View
    
    private func addView(){
        [imageFilterView, filterButtonStackView, chooseFrameButton, imageTopStackView, imagebottomStackView].forEach { view.addSubview($0) }
    }
    
    // MARK: - Location
    private func location(){
        imageFilterView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(viewBounds.height/4.16)
            make.width.equalToSuperview().dividedBy(1.16)
            make.height.equalToSuperview().dividedBy(3.64)
        }
        
        filterButtonStackView.snp.makeConstraints { make in
            make.top.equalTo(imageFilterView.snp.bottom).offset(viewBounds.height/10.68)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.21)
            make.height.equalToSuperview().dividedBy(6.44)
        }
        
        chooseFrameButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(viewBounds.height/12.5)
            make.height.equalToSuperview().dividedBy(19.80)
            make.left.equalToSuperview().offset(viewBounds.width/8.52)
        }
        
        imageTopStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(viewBounds.height/5.37)
            make.width.equalToSuperview().dividedBy(1.157)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(7.73)
        }
        
        imagebottomStackView.snp.makeConstraints { make in
            make.top.equalTo(imageTopStackView.snp.bottom).offset(viewBounds.width/31.25)
            make.width.equalToSuperview().dividedBy(1.157)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(7.73)
        }
    }
 
    func applyFilter(to inputImage: UIImage, filterName: String, completion: @escaping ((UIImage) -> ())) {
        let filter = CIFilter(name: filterName)!
        
        if filterName == "CIExposureAdjust"{
            filter.setValue(0.3, forKey: kCIInputEVKey)
        }
        
        if let sourceImage = CIImage(image: inputImage) {
            filter.setValue(sourceImage, forKey: kCIInputImageKey)
            
            if let cgimg = self.context.createCGImage(filter.outputImage!, from: filter.outputImage!.extent) {
                let processedImage = UIImage(cgImage: cgimg, scale: inputImage.scale, orientation: inputImage.imageOrientation)
                
                completion(processedImage)
            }
        }
    }
    
    private func resetImage(image: UIImage){
        imageUrl1.image = image
        imageUrl2.image = image
        imageUrl3.image = image
        imageUrl4.image = image
    }
    
    private func filterPreviewImage(){
        applyFilter(to: UIImage(named: "InFrame_TestImage")!, filterName: "CIPhotoEffectNoir") { image in
            self.blackButton.dataSetting(image: image, koreanText: "흑백", englishText: "BLACK")
        }

        basicButton.dataSetting(image: imageUrl1.image!, koreanText: "기본", englishText: "BASIC")

        applyFilter(to: UIImage(named: "InFrame_TestImage")!, filterName: "CIExposureAdjust") { image in
            self.lightButton.dataSetting(image: image, koreanText: "밝게", englishText: "LIGHT")
        }
    }
}
