//
//  Extension.swift
//  Arr
//
//  Created by 노연주 on 2021/08/25.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat ,green: CGFloat,blue:CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    static func rgba(red: CGFloat ,green: CGFloat,blue:CGFloat, alpha:CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    
    static let TERM_CHECKED = UIColor.rgb(red: 255, green: 135, blue: 133)
    static let TERM_UNCHECKED = UIColor.rgb(red: 255, green: 255, blue: 255)
}

extension UIView {
    func roundCorners(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
}

extension UILabel {
    func dynamicFont(fontSize size: CGFloat, currentFontName: String) {
    let bounds = UIScreen.main.bounds
    let height = bounds.size.height
    
    switch height {
    case 480.0: //Iphone 3,4S => 3.5 inch
        self.font = UIFont(name: currentFontName, size: size * 0.7)
      break
    case 568.0: //iphone 5, SE => 4 inch
        self.font = UIFont(name: currentFontName, size: size * 0.8)
      break
    case 667.0: //iphone 6, 6s, 7, 8 => 4.7 inch
        self.font = UIFont(name: currentFontName, size: size * 0.92)
      break
    case 736.0: //iphone 6s+ 6+, 7+, 8+ => 5.5 inch
        self.font = UIFont(name: currentFontName, size: size * 0.95)
      break
    case 812.0: //iphone X, XS => 5.8 inch
        self.font = UIFont(name: currentFontName, size: size)
      break
    case 896.0: //iphone XR => 6.1 inch  // iphone XS MAX => 6.5 inch
        self.font = UIFont(name: currentFontName, size: size * 1.15)
      break
    default:
      print("not an iPhone")
      break
    }
  }
}

extension UITextView {
    func dynamicFont(fontSize size: CGFloat, currentFontName: String) {
    let bounds = UIScreen.main.bounds
    let height = bounds.size.height

    switch height {
    case 480.0: //Iphone 3,4S => 3.5 inch
        self.font = UIFont(name: currentFontName, size: size * 0.7)
      break
    case 568.0: //iphone 5, SE => 4 inch
        self.font = UIFont(name: currentFontName, size: size * 0.8)
      break
    case 667.0: //iphone 6, 6s, 7, 8 => 4.7 inch
        self.font = UIFont(name: currentFontName, size: size * 0.92)
      break
    case 736.0: //iphone 6s+ 6+, 7+, 8+ => 5.5 inch
        self.font = UIFont(name: currentFontName, size: size * 0.95)
      break
    case 812.0: //iphone X, XS => 5.8 inch
        self.font = UIFont(name: currentFontName, size: size)
      break
    case 896.0: //iphone XR => 6.1 inch  // iphone XS MAX => 6.5 inch
        self.font = UIFont(name: currentFontName, size: size * 1.15)
      break
    case 926.0: //iphone 12 Pro Max
        self.font = UIFont(name:currentFontName, size: size * 1.18)
    default:
      print("not an iPhone")
      break
    }
  }
}

extension UIButton {
    func dynamicFont(fontSize size: CGFloat, currentFontName: String) {
    let bounds = UIScreen.main.bounds
    let height = bounds.size.height

    switch height {
    case 480.0: //Iphone 3,4S => 3.5 inch
        self.titleLabel?.font = UIFont(name: currentFontName, size: size * 0.7)
      break
    case 568.0: //iphone 5, SE => 4 inch
        self.titleLabel?.font = UIFont(name: currentFontName, size: size * 0.8)
      break
    case 667.0: //iphone 6, 6s, 7, 8 => 4.7 inch
        self.titleLabel?.font = UIFont(name: currentFontName, size: size * 0.92)
      break
    case 736.0: //iphone 6s+ 6+, 7+, 8+ => 5.5 inch
        self.titleLabel?.font = UIFont(name: currentFontName, size: size * 0.95)
      break
    case 812.0: //iphone X, XS => 5.8 inch
        self.titleLabel?.font = UIFont(name: currentFontName, size: size)
      break
    case 896.0: //iphone XR => 6.1 inch  // iphone XS MAX => 6.5 inch
        self.titleLabel?.font = UIFont(name: currentFontName, size: size * 1.15)
      break
    case 926.0: //iphone 12 Pro Max
        self.titleLabel?.font = UIFont(name:currentFontName, size: size * 1.18)
    default:
      print("not an iPhone")
      break
    }
  }
}


extension UITextField {
    func dynamicFont(fontSize size: CGFloat, currentFontName: String) {
    let bounds = UIScreen.main.bounds
    let height = bounds.size.height

    switch height {
    case 480.0: //Iphone 3,4S => 3.5 inch
        self.font = UIFont(name: currentFontName, size: size * 0.7)
      break
    case 568.0: //iphone 5, SE => 4 inch
        self.font = UIFont(name: currentFontName, size: size * 0.8)
      break
    case 667.0: //iphone 6, 6s, 7, 8 => 4.7 inch
        self.font = UIFont(name: currentFontName, size: size * 0.92)
      break
    case 736.0: //iphone 6s+ 6+, 7+, 8+ => 5.5 inch
        self.font = UIFont(name: currentFontName, size: size * 0.95)
      break
    case 812.0: //iphone X, XS => 5.8 inch
        self.font = UIFont(name: currentFontName, size: size)
      break
    case 896.0: //iphone XR => 6.1 inch  // iphone XS MAX => 6.5 inch
        self.font = UIFont(name: currentFontName, size: size * 1.15)
      break
    case 926.0: //iphone 12 Pro Max
        self.font = UIFont(name:currentFontName, size: size * 1.18)
    default:
      print("not an iPhone")
      break
    }
  }
}
