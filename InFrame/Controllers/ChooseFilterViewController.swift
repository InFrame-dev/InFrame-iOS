//
//  ChooseFilterViewController.swift
//  InFrame
//
//  Created by 노연주 on 2021/12/05.
//

import UIKit
import SnapKit
import Then

final class ChooseFilterViewController: UIViewController {
    //MARK: - Properties
    private let viewBounds = UIScreen.main.bounds
    
    private var context = CIContext()
    
    var images:[UIImage?]?
    
    let imageFilterView = ImageFilterView()
    
    private lazy var blackButton = FilterButton().then {
        $0.addTarget(self, action: #selector(chooseBlackFilterClicked(sender:)), for: .touchUpInside)
    }
    
    private lazy var basicButton = FilterButton().then {
        $0.addTarget(self, action: #selector(chooseBasicFilterClicked(sender:)), for: .touchUpInside)
    }
    
    private lazy var lightButton = FilterButton().then {
        $0.addTarget(self, action: #selector(chooseLightFilterClicked(sender:)), for: .touchUpInside)
    }
    
    private lazy var filterButtonStackView = UIStackView(arrangedSubviews: [blackButton, basicButton, lightButton]).then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = self.view.frame.width/26.79
    }
    
    private lazy var chooseFrameButton = ChoiceGradientButton().then {
        $0.dataSetting(buttonText: "프레임 선택하러 가기")
        $0.addTarget(self, action: #selector(chooseFrameButtonClicked(sender:)), for: .touchUpInside)
    }

    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    
    @objc private func chooseFrameButtonClicked(sender:UIButton){
        let nextVC = ChooseFrameViewController()
        nextVC.lastImage1 = imageFilterView.imageFilter1.image
        nextVC.lastImage2 = imageFilterView.imageFilter2.image
        nextVC.lastImage3 = imageFilterView.imageFilter3.image
        nextVC.lastImage4 = imageFilterView.imageFilter4.image
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc private func chooseBlackFilterClicked(sender:UIButton){
        self.resetImage()
        applyFilter(to: imageFilterView.imageFilter1.image!, filterName: "CIPhotoEffectNoir") { image in
            self.imageFilterView.imageFilter1.image = image
        }
        applyFilter(to: imageFilterView.imageFilter2.image!, filterName: "CIPhotoEffectNoir") { image in
            self.imageFilterView.imageFilter2.image = image
        }
        applyFilter(to: imageFilterView.imageFilter3.image!, filterName: "CIPhotoEffectNoir") { image in
            self.imageFilterView.imageFilter3.image = image
        }
        applyFilter(to: imageFilterView.imageFilter4.image!, filterName: "CIPhotoEffectNoir") { image in
            self.imageFilterView.imageFilter4.image = image
        }
    }
    
    @objc private func chooseBasicFilterClicked(sender:UIButton){
        resetImage()
    }
    
    @objc private func chooseLightFilterClicked(sender:UIButton){
        self.resetImage()
        applyFilter(to: imageFilterView.imageFilter1.image!, filterName: "CIExposureAdjust") { image in
            self.imageFilterView.imageFilter1.image = image
        }
        applyFilter(to: imageFilterView.imageFilter2.image!, filterName: "CIExposureAdjust") { image in
            self.imageFilterView.imageFilter2.image = image
        }
        applyFilter(to: imageFilterView.imageFilter3.image!, filterName: "CIExposureAdjust") { image in
            self.imageFilterView.imageFilter3.image = image
        }
        applyFilter(to: imageFilterView.imageFilter4.image!, filterName: "CIExposureAdjust") { image in
            self.imageFilterView.imageFilter4.image = image
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
        [imageFilterView, filterButtonStackView, chooseFrameButton].forEach { view.addSubview($0) }
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
    
    private func resetImage(){
        imageFilterView.imageFilter1.image = images?[0]
        imageFilterView.imageFilter2.image = images?[1]
        imageFilterView.imageFilter3.image = images?[2]
        imageFilterView.imageFilter4.image = images?[3]
    }
    
    private func filterPreviewImage(){
        imageFilterView.dataSetting(imageArray: images!)
        applyFilter(to: imageFilterView.imageFilter1.image!, filterName: "CIPhotoEffectNoir") { image in
            self.blackButton.dataSetting(image: image, koreanText: "흑백", englishText: "BLACK")
        }

        basicButton.dataSetting(image: imageFilterView.imageFilter1.image!, koreanText: "기본", englishText: "BASIC")

        applyFilter(to: imageFilterView.imageFilter1.image!, filterName: "CIExposureAdjust") { image in
            self.lightButton.dataSetting(image: image, koreanText: "밝게", englishText: "LIGHT")
        }
    }
}
