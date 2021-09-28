//
//  MainViewController.swift
//  InFrame
//
//  Created by 김유진 on 2021/09/28.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - Properties
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    // MARK: - Helpers
    func configureUI(){
        addView()
        
        addLayout()
    }
    
    func addView(){
        self.view.backgroundColor = .white
    }
    
    func addLayout(){
        
    }
    
    // MARK: - Selectors
    
}
