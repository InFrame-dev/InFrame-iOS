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
    
    private let backButton = UIButton().then {
        $0.setImage(UIImage(named: "InFrame_BackButtonImage"), for: .normal)
        $0.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private let returnButton = UIButton().then {
        $0.setImage(UIImage(named: "InFrame_Return"), for: .normal)
        $0.addTarget(self, action: #selector(returnButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private let takeValueLabel = UILabel().then {
        $0.text = "3/6"
        $0.dynamicFont(fontSize: 14, currentFontName: "CarterOne")
        $0.textColor = .rgb(red: 196, green: 196, blue: 196)
    }
    
    private let takeImageView = UIView().then {
        $0.backgroundColor = .gray
    }
    
    private let takeButton = UIButton().then {
        $0.setImage(UIImage(named: "InFrame_TakeButton"), for: .normal)
        $0.addTarget(self, action: #selector(takeButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private let camera = UIImagePickerController().then{
        $0.sourceType = .camera
        $0.allowsEditing = false
        $0.cameraDevice = .rear
        $0.cameraFlashMode = .off
    }
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = .medium
        
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
    }
    
    @objc private func takeButtonClicked(sender:UIButton){
        print("take")
        // 카메라 촬영 기능 코드
        let settings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
        stillImageOutput.capturePhoto(with: settings, delegate: self)
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
        
        videoPreviewLayer.videoGravity = .resizeAspect
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
        
//        let image = UIImage(data: imageData)
//        captureImageView.image = image
    }
    
}
