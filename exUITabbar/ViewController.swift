//
//  ViewController.swift
//  exUITabbar
//
//  Created by hjkHack on 2020/11/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
class BaseViewController:UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNc()
        setupViews()
    }
    
    @objc func clicked(sender:UIButton){
        let vc = ThirdVC()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @objc func back(sender:UIBarButtonItem){
        self.navigationController?.popViewController(animated: false)
    }
    func setupNc(){
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationItem.backBarButtonItem = UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: #selector(back(sender:)))
        if let list = self.navigationController?.viewControllers {
            for (index,vc) in list.enumerated() {
                if vc == self {
                    title = "third vc index\(index)"
                    break
                }
            }

        }
    }
    
    func setupViews(){
        let colors = [ UIColor.blue, UIColor.red, UIColor.gray, UIColor.purple, UIColor.yellow, UIColor.lightGray]
        view.backgroundColor = colors.randomElement()
        
        let btn = UIButton()
        btn.addTarget(self, action: #selector(clicked(sender:)), for: .touchUpInside)
        btn.backgroundColor = UIColor.white
        btn.setTitle("next vc", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        view.addSubview(btn)
        btn.setConstraintConstant(parentView: view, active: [(.width, 200) , (.height, 100), (.centerY, 0), (.centerX, 0)])
    }
}

class FirstVC:BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "first"
        view.backgroundColor = .green
    }
}

class SecondVC:BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "second"
        view.backgroundColor = .orange
    }
}

class MyTabbarVC:UITabBarController {
    
}

class ThirdVC:BaseViewController {
    
}
