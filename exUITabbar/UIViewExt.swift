//
//  UIViewExt.swift
//  HomeApp
//
//  Created by hjkim on 2020/03/09.
//  Copyright © 2020 hjk. All rights reserved.
//

import Foundation

import UIKit
extension UIView {

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}

//extension UIView
//{
//    func fixInView(_ container: UIView!) -> Void{
//        self.translatesAutoresizingMaskIntoConstraints = false;
//        self.frame = container.frame;
//        container.addSubview(self);
//        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
//        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
//        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
//        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
//    }
//}
// MARK: -- View
extension UIView {
    enum AnchorType {
        case top, bottom, left, right,centerY, centerX, width, height
    }
    /// autolayout 설정
    func setConstraintConstant(parentView: UIView,
                       active: [(AnchorType, CGFloat)] ){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        for ( anchor, constant ) in active {
            switch anchor {
            case .top :
                self.topAnchor.constraint(equalTo: parentView.topAnchor, constant: constant).isActive = true
            case .bottom :
                self.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: constant).isActive = true
            case .left :
                self.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: constant).isActive = true
            case .right :
                self.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: constant).isActive = true
            case .centerY :
                self.centerYAnchor.constraint(equalTo: parentView.centerYAnchor, constant: constant).isActive = true
            case .centerX :
                self.centerXAnchor.constraint(equalTo: parentView.centerXAnchor, constant: constant).isActive = true
            case .width:
                self.widthAnchor.constraint(equalToConstant: constant).isActive = true
            case .height:
                self.heightAnchor.constraint(equalToConstant: constant).isActive = true
            }
            
        }
    }
    
    /// autolayout 설정
    func setConstraint(parentView: UIView,
                       active: [AnchorType] ){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        for anchor in active {
            switch anchor{
            case .top :
                self.topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
            case .bottom :
                self.bottomAnchor.constraint(equalTo: parentView.bottomAnchor).isActive = true
            case .left :
                self.leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
            case .right :
                self.trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
            case .centerX:
                self.centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
            case .centerY:
                self.centerYAnchor.constraint(equalTo: parentView.centerYAnchor).isActive = true
            default:
                break;
            }
            
        }
    }
    
    /// xib과 함께 커스텀뷰를 만들때 해당뷰의 배경뷰를 self로 사용할 수 있게 만듬
    func fixInView(_ container: UIView!) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false
        self.frame = container.frame
        container.addSubview(self)
        
        self.setConstraint(parentView: container,
                           active: [.top,.bottom,.left,.right])
    }
    
    
    func commonInit(nibName: String,
                    view: UIView) {
        
        Bundle.main.loadNibNamed(nibName,
                                 owner: self,
                                 options: nil)
        view.fixInView(self)
    }
    
    func commonInit(nibName: String) {
        
        Bundle.main.loadNibNamed(nibName,
                                 owner: self,
                                 options: nil)
    }
    
    
}
