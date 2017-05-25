//
//  ViewController.swift
//  JustTransitioningAnimation
//
//  Created by Just on 2017/5/24.
//  Copyright © 2017年 Just. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //弹出菜单
        let viewController = JustTableViewController()
        viewController.transitioningDelegate = popoverAnimator
        viewController.modalPresentationStyle = .custom
        present(viewController, animated: true, completion: nil)
    }
    //懒加载转场
    fileprivate lazy var popoverAnimator: JustAnimator = {
        
        let pa = JustAnimator()
        //在这里设置弹出菜单的位置和大小
        return pa
    }()
}

