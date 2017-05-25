//
//  JustAnimator.swift
//  JustTransitioningAnimation
//
//  Created by Just on 2017/5/24.
//  Copyright © 2017年 Just. All rights reserved.
//

import UIKit

enum JustPresentationStatus {
    case present, dismiss
}

class JustAnimator: NSObject, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    fileprivate var status: JustPresentationStatus = .present
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let vc = JustPresentationController(presentedViewController: presented, presenting: presenting)
        return vc
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        switch status {
        case .present:
            //来到这里说明要执行展开操作
            //拿到展现视图
            let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) ?? UIView()
            //把高度压缩为0
            toView.transform = CGAffineTransform(scaleX: 1.0, y: 0)
            
            //把视图添加容器上,
            transitionContext.containerView.addSubview(toView)
            
            //设置锚点(由默认的中点移到上面)
            toView.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
            
            //执行动画
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: { () -> Void in
                //清空transform
                toView.transform = CGAffineTransform.identity
            }, completion: { (_) -> Void in
                //动画执行完毕后,一定要告诉系统
                transitionContext.completeTransition(true)
            })
        case .dismiss:
            //来到这里说明要执行关闭操作
            let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)
            //执行动画
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: { () -> Void in
                //注意: 可能是因为CGFloat不准确,所以写0.0是不准确的
                //压扁(垂直方向收回去)
                fromView?.transform = CGAffineTransform(scaleX: 1.0, y: 0.000000001)
            }, completion: { (_) -> Void in
                //告诉系统,动画执行完毕
                transitionContext.completeTransition(true)
            })

        }
    }
    
}
