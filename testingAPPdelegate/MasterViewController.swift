//
//  MasterViewController.swift
//  testingAPPdelegate
//
//  Created by Javier Laguna on 12/03/2016.
//  Copyright © 2016 Javier Laguna. All rights reserved.
//

import UIKit
import PureLayout

class MasterViewController: UIViewController {
    
    var selectorViewRightConstraint: NSLayoutConstraint?
    
    var selectorViewLeftConstraint: NSLayoutConstraint?
    
    lazy var rightView: UIView = {
        
        let _rightView = UIView.newAutoLayoutView()
        
        _rightView.backgroundColor = .yellowColor()
        
        return _rightView
    }()
    
    lazy var leftView: UIView = {
        
        let _leftView = UIView.newAutoLayoutView()
        
        _leftView.backgroundColor = .blueColor()
        
        return _leftView
    }()
    
    lazy var selectorView: UIView = {
        
        let _selectorView = UIView.newAutoLayoutView()
        
        _selectorView.backgroundColor = .redColor()
        
        return _selectorView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(rightView)
        view.addSubview(leftView)
        view.addSubview(selectorView)

        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        
        self.updateViewConstraints()
        
        let delay = 1.5 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
       
        dispatch_after(time, dispatch_get_main_queue()) {
            
            UIView.animateWithDuration(1.5, animations: { () -> Void in
                
                self.swapConstraint()
                self.view.layoutIfNeeded()
            })
        }
    }
    
    override func updateViewConstraints() {
        
        super.updateViewConstraints()
        
        rightView.autoPinEdgeToSuperviewEdge(.Top)
        
        rightView.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 5.0)
        
        rightView.autoPinEdgeToSuperviewEdge(.Right)
        
        /*--------------*/
        
        leftView.autoPinEdge(.Right, toEdge: .Left, ofView: rightView)
        
        leftView.autoPinEdgeToSuperviewEdge(.Top)
        
        leftView.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 5.0)
        
        leftView.autoPinEdgeToSuperviewEdge(.Left)
        
        leftView.autoMatchDimension(.Width, toDimension: .Width, ofView: rightView)
        
        /*--------------*/
        
        selectorView.autoPinEdgeToSuperviewEdge(.Bottom)
        
        if let _ = self.selectorViewRightConstraint {
        
        }
        else {
        
            selectorViewLeftConstraint = selectorView.autoPinEdge(.Left, toEdge: .Left, ofView: rightView)
            selectorViewRightConstraint = selectorView.autoPinEdge(.Right, toEdge: .Right, ofView: rightView)
        }
        
        selectorView.autoSetDimension(.Height, toSize: 5.0)
    }
    
    func swapConstraint() {
        
        selectorViewLeftConstraint?.constant = selectorViewLeftConstraint!.constant - leftView.frame.size.width
        selectorViewRightConstraint?.constant = selectorViewRightConstraint!.constant - leftView.frame.size.width

    }
}

