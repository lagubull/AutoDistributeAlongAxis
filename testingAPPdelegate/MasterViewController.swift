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

    lazy var aboveView: UIView = {
        
        let _aboveView = UIView.newAutoLayoutView()
        
        _aboveView.backgroundColor = .yellowColor()
        
        return _aboveView
    }()
    
    var belowView: UIView = {
        
        let _belowView = UIView.newAutoLayoutView()
        
        _belowView.backgroundColor = .blueColor()
        
        return _belowView
    }()
    
    var views: NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .redColor()
        
        view.addSubview(aboveView)
        view.addSubview(belowView)
        
         views = [aboveView, belowView]
        }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        
        self.updateViewConstraints()
    }
    
    override func updateViewConstraints() {
        
        super.updateViewConstraints()
        
        aboveView.autoPinEdgeToSuperviewEdge(.Top)
        aboveView.autoPinEdgeToSuperviewEdge(.Left)
        aboveView.autoPinEdgeToSuperviewEdge(.Right)

        belowView.autoPinEdge(.Top, toEdge: .Bottom, ofView: aboveView)
        
        belowView.autoPinEdgeToSuperviewEdge(.Bottom)
        belowView.autoPinEdgeToSuperviewEdge(.Left)
        belowView.autoPinEdgeToSuperviewEdge(.Right)
        
        views!.autoDistributeViewsAlongAxis(.Vertical,alignedTo:ALAttribute.Right, withFixedSpacing:0.0)
    }
}

