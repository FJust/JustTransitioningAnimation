//
//  JustPresentationController.swift
//  JustTransitioningAnimation
//
//  Created by Just on 2017/5/24.
//  Copyright © 2017年 Just. All rights reserved.
//

import UIKit

class JustPresentationController: UIPresentationController {

    override func containerViewWillLayoutSubviews() {
        presentedView?.frame = CGRect(x: UIScreen.main.bounds.size.width / 2 - 100, y: 56, width: 200, height: 350)
        containerView?.insertSubview(converView, at: 0)
    }
    //MARK: -懒加载蒙版
    fileprivate lazy var converView: UIView = {
        
        //创建蒙版
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.3)
        view.frame = UIScreen.main.bounds
        
        //为蒙版view添加一个监听,点击蒙版的时候,转场消失
        let tap = UITapGestureRecognizer(target: self,action: #selector(close))
        view.addGestureRecognizer(tap)
        return view
    }()
    
    func close() {
        presentedViewController.dismiss(animated: true, completion: nil)
    }
}
