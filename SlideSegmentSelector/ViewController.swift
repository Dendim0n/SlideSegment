//
//  ViewController.swift
//  SlideSegmentSelector
//
//  Created by 任岐鸣 on 2016/11/28.
//  Copyright © 2016年 Ned. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let doSomething:(Int) -> Void = {
            num in
            print("clicked:\(num)")
        }
        
        let segment1 = SlideSegmentSelector.init(singlePage: true,  length: 180, withAnimate: true,direction: .horizontal,doClosure: doSomething)
        segment1.backgroundColor = .lightGray
        view.addSubview(segment1)
        segment1.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-180)
            make.height.equalTo(50)
            make.width.equalToSuperview()
        }
        segment1.titleArray = ["1","2","3","4"]
        
        let segment2 = SlideSegmentSelector.init(singlePage: false, length: 180, withAnimate: false, direction: .horizontal,doClosure: doSomething)
        
        segment2.backgroundColor = .lightGray
        view.addSubview(segment2)
        segment2.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-100)
            make.height.equalTo(50)
            make.width.equalToSuperview()
        }
        segment2.titleArray = ["1","2","3","4"]
        
        let segment3 = SlideSegmentSelector.init(singlePage: true,  length: 180, withAnimate: true, direction: .vertical,doClosure: doSomething)
        segment3.backgroundColor = .lightGray
        view.addSubview(segment3)
        segment3.snp.makeConstraints { (make) in
            make.height.equalTo(300)
            make.bottom.equalToSuperview().offset(-10)
            make.left.equalToSuperview().offset(10)
            make.width.equalTo(50)
        }
        segment3.titleArray = ["1","2","3","4"]
        
        let segment4 = SlideSegmentSelector.init(singlePage: false, length: 180, withAnimate: true, direction: .vertical,doClosure: doSomething)
        
        segment4.backgroundColor = .lightGray
        view.addSubview(segment4)
        segment4.snp.makeConstraints { (make) in
            make.height.equalTo(300)
            make.bottom.equalToSuperview().offset(-10)
            make.right.equalToSuperview().offset(-10)
            make.width.equalTo(50)
        }
        segment4.titleArray = ["1","2","3","4"]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

