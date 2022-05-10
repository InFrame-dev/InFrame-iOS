//
//  TakePictureViewController.swift
//  InFrame
//
//  Created by 노연주 on 2021/11/28.
//

import UIKit
import Then
import SnapKit
import AVFoundation

class TakePictureViewController: UIViewController, AVCapturePhotoCaptureDelegate {
    //MARK: - Properties
    
    var captureSession: AVCaptureSession!
    var stillImageOutput: AVCapturePhotoOutput!
    var videoPreviewLayer: AVCaptureVideoPreviewLayer!
    
    var takeValues:Int = 1
    
    var image1:UIImage?
    var image2:UIImage?
    var image3:UIImage?
    var image4:UIImage?
    var image5:UIImage?
    var image6:UIImage?
    
    private let backButton = UIButton().then {
        $0.setImage(UIImage(named: "InFrame_BackButtonImage"), for: .normal)
        $0.addTarget(TakePictureViewController.self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private let returnButton = UIButton().then {
        $0.setImage(UIImage(named: "InFrame_Return"), for: .normal)
        $0.addTarget(TakePictureViewController.self, action: #selector(returnButtonClicked(sender:)), for: .touchUpInside)
    }
    
    lazy var takeValueLabel = UILabel().then {
        $0.text = String(takeValues) + "/6"
        $0.dynamicFont(fontSize: 14, currentFontName: "CarterOne")
        $0.textColor = .rgb(red: 196, green: 196, blue: 196)
    }
    
    private let takeImageView = UIView().then {
        $0.backgroundColor = .gray
    }
    
    private let takeButton = UIButton().then {
        $0.setImage(UIImage(named: "InFrame_TakeButton"), for: .normal)
        $0.addTarget(TakePictureViewController.self, action: #selector(takeButtonClicked(sender:)), for: .touchUpInside)
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = .high
        
        guard let backCamera = AVCaptureDevice.default(for: AVMediaType.video)
            else {
                print("후면 카메라 접근 불가")
                return
        }
        
        do {
            let input = try AVCaptureDeviceInput(device: backCamera)
            stillImageOutput = AVCapturePhotoOutput()
            
            if captureSession.canAddInput(input) && captureSession.canAddOutput(stillImageOutput) {
                captureSession.addInput(input)
                captureSession.addOutput(stillImageOutput)
                setupLivePreview()
            }
        }
        catch let error  {
            print("Error Unable to initialize back camera:  \(error.localizedDescription)")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.captureSession.stopRunning()
    }
    
    //MARK: - Selectors
    
    @objc private func backButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func returnButtonClicked(sender:UIButton){
        print("return")
        // 카메라 전환 기능 코드
        captureSession?.beginConfiguration()
        let currentInput = captureSession?.inputs.first as? AVCaptureDeviceInput
        captureSession?.removeInput(currentInput!)

        let newCameraDevice = currentInput?.device.position == .back ? camera(with: .front) : camera(with: .back)
        let newVideoInput = try? AVCaptureDeviceInput(device: newCameraDevice!)
        captureSession?.addInput(newVideoInput!)
        captureSession?.commitConfiguration()
    }
    
    @objc private func takeButtonClicked(sender:UIButton){
        print("take")
        // 카메라 촬영 기능 코드
        if(takeValues == 7) {
            let nextVC = ChoosePictureViewController()
            
            nextVC.choicePictures.imageCheck1.dataSetting(image: image1)
            nextVC.choicePictures.imageCheck2.dataSetting(image: image2)
            nextVC.choicePictures.imageCheck3.dataSetting(image: image3)
            nextVC.choicePictures.imageCheck4.dataSetting(image: image4)
            nextVC.choicePictures.imageCheck5.dataSetting(image: image5)
            nextVC.choicePictures.imageCheck6.dataSetting(image: image6)
            
            self.navigationController?.pushViewController(nextVC, animated: true)
        } else {
            let settings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
            stillImageOutput.capturePhoto(with: settings, delegate: self)
            takeValues = takeValues + 1
            takeValueLabel.text = String(takeValues) + "/6"
        }
    }
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        addView()
        location()
    }
    
    // MARK: - Add View
    
    private func addView(){
        [backButton, returnButton, takeValueLabel, takeImageView, takeButton].forEach { view.addSubview($0) }
    }
    
    // MARK: - Location
    
    private func location(){
        backButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/15)
            make.top.equalToSuperview().offset(self.view.frame.height/10.02)
            make.width.equalToSuperview().dividedBy(46.88)
            make.height.equalToSuperview().dividedBy(47.76)
        }
        
        returnButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(self.view.frame.width/12.93)
            make.centerY.equalTo(backButton)
            make.width.equalToSuperview().dividedBy(19.74)
            make.height.equalTo(returnButton.snp.width)
        }
        
        takeValueLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(self.view.frame.height/5.38)
        }
        
        takeImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(takeValueLabel.snp.bottom).offset(self.view.frame.height/16.57)
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(3.14)
        }
        
        takeButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(self.view.frame.height/14)
            make.width.equalToSuperview().dividedBy(6.25)
            make.height.equalTo(takeButton.snp.width)
        }
    }
    
    func setupLivePreview() {
        
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        
        videoPreviewLayer.videoGravity = .resizeAspectFill
        videoPreviewLayer.connection?.videoOrientation = .portrait
        takeImageView.layer.addSublayer(videoPreviewLayer)
        DispatchQueue.global(qos: .userInitiated).async { //[weak self] in
            self.captureSession.startRunning()
            DispatchQueue.main.async {
                self.videoPreviewLayer.frame = self.takeImageView.bounds
            }
        }
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        
        guard let imageData = photo.fileDataRepresentation()
            else { return }
        
        let image = UIImage(data: imageData)
        
        switch takeValues-1 {
        case 1:
            image1 = image
        case 2:
            image2 = image
        case 3:
            image3 = image
        case 4:
            image4 = image
        case 5:
            image5 = image
        case 6:
            image6 = image
        default:
            return
        }
    }
    
    func camera(with position: AVCaptureDevice.Position) -> AVCaptureDevice? {
        let devices = AVCaptureDevice.devices(for: AVMediaType.video)
        return devices.filter { $0.position == position }.first
    }
}
