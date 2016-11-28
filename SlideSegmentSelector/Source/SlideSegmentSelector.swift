//
//  SlideSegmentSelector.swift
//  SlideSegmentSelector
//
//  Created by 任岐鸣 on 2016/11/28.
//  Copyright © 2016年 Ned. All rights reserved.
//

import UIKit

class SlideSegmentSelector: UIView {
    
    enum LayoutDirection {
        case vertical
        case horizontal
    }
    
    var direction:LayoutDirection = .horizontal
    var allInSinglePage = true
    var segmentLength:CGFloat?
    
    typealias intClosure = (Int) -> Void
    var doSomething:intClosure?
    
    var titleArray = Array<String>() {
        didSet {
            btnArray = Array<CustomSegmentButton>()
            setUI()
        }
    }
    var currentSegment = 0 {
        didSet {
            if doSomething != nil {
                doSomething!(currentSegment)
            }
            for button in btnArray {
                if button.index == currentSegment {
                    button.bottomLine.alpha = 1
                    button.lblTitle.textColor = .yellow
                } else {
                    button.bottomLine.alpha = 0
                    button.lblTitle.textColor = .gray
                }
                
            }
        }
    }
    
    private var scrollView = UIScrollView()
    private let bottomLine = UIView()
    private var btnArray = Array<CustomSegmentButton>()
    
    init(singlePage:Bool,length:CGFloat?,direction:LayoutDirection,do:intClosure?) {
        super.init(frame: CGRect.zero)
        self.allInSinglePage = singlePage
        segmentLength = length
        self.direction = direction
        addSubview(scrollView)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        bottomLine.backgroundColor = .gray
        addSubview(bottomLine)
        bottomLine.snp.makeConstraints { (make) in
            make.height.equalTo(0.5)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        var length:CGFloat = 1
        if titleArray.count != 0 {
            length = self.frame.width / CGFloat(titleArray.count)
        }
        
        if !allInSinglePage {
            if segmentLength != nil {
                length = segmentLength!
            }
        }
        if direction == .horizontal {
            for index in 0...titleArray.count - 1 {
                
                let btn = CustomSegmentButton.init(frame: .zero)
                
                scrollView.addSubview(btn)
                btn.lblTitle.text = titleArray[index]
                
                btn.index = index
                btn.addTarget(self, action: #selector(clicked(btn:)), for: .touchUpInside)
                
                if index == 0 {
                    btn.lblTitle.textColor = .yellow
                    btn.snp.makeConstraints({ (make) in
                        make.leading.equalToSuperview()
                        make.height.equalToSuperview()
                        make.top.equalToSuperview()
                        if allInSinglePage {
                            make.width.equalToSuperview().dividedBy(titleArray.count)
                        } else {
                            make.width.equalTo(length)
                        }
                    })
                }else if index < titleArray.count - 1 {
                    btn.bottomLine.alpha = 0
                    btn.snp.makeConstraints({ (make) in
                        make.left.equalTo((btnArray.last?.snp.right)!)
                        make.height.equalToSuperview()
                        make.top.equalToSuperview()
                        if allInSinglePage {
                            make.width.equalToSuperview().dividedBy(titleArray.count)
                        } else {
                            make.width.equalTo(length)
                        }
                        
                    })
                } else {
                    btn.bottomLine.alpha = 0
                    btn.snp.makeConstraints({ (make) in
                        make.left.equalTo((btnArray.last?.snp.right)!)
                        make.height.equalToSuperview()
                        make.top.equalToSuperview()
                        if allInSinglePage {
                            make.width.equalToSuperview().dividedBy(titleArray.count)
                        } else {
                            make.width.equalTo(length)
                        }
                        make.right.equalToSuperview()
                    })
                }
                btnArray.append(btn)
            }
            bringSubview(toFront: bottomLine)
        } else if direction == .vertical {
            for index in 0...titleArray.count - 1 {
                
                let btn = CustomSegmentButton.init(frame: .zero)
                
                scrollView.addSubview(btn)
                btn.lblTitle.text = titleArray[index]
                
                btn.index = index
                btn.addTarget(self, action: #selector(clicked(btn:)), for: .touchUpInside)
                
                if index == 0 {
                    btn.lblTitle.textColor = .yellow
                    btn.snp.makeConstraints({ (make) in
                        make.left.equalToSuperview()
                        make.width.equalToSuperview()
                        make.top.equalToSuperview()
                        if allInSinglePage {
                            make.height.equalToSuperview().dividedBy(titleArray.count)
                        } else {
                            make.height.equalTo(length)
                        }
                    })
                }else if index < titleArray.count - 1 {
                    btn.bottomLine.alpha = 0
                    btn.snp.makeConstraints({ (make) in
                        make.left.equalToSuperview()
                        make.width.equalToSuperview()
                        make.top.equalTo((btnArray.last?.snp.bottom)!)
                        if allInSinglePage {
                            make.height.equalToSuperview().dividedBy(titleArray.count)
                        } else {
                            make.height.equalTo(length)
                        }
                        
                    })
                } else {
                    btn.bottomLine.alpha = 0
                    btn.snp.makeConstraints({ (make) in
                        make.top.equalTo((btnArray.last?.snp.bottom)!)
                        make.width.equalToSuperview()
                        make.left.equalToSuperview()
                        if allInSinglePage {
                            make.height.equalToSuperview().dividedBy(titleArray.count)
                        } else {
                            make.height.equalTo(length)
                        }
                        make.bottom.equalToSuperview()
                    })
                }
                btnArray.append(btn)
            }
        }
        
    }
    
    func clicked(btn:CustomSegmentButton) {
        currentSegment = btn.index
    }

}

class CustomSegmentButton: UIButton {
    
    var bottomLine = UIView()
    var index = 0
    var lblTitle = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.lblTitle.textColor = .gray
        self.lblTitle.font = UIFont.systemFont(ofSize: 14)
        addSubview(lblTitle)
        lblTitle.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        bottomLine.frame = CGRect.init(x: 0, y: self.frame.height - 2, width: self.frame.width, height: 2)
        addSubview(bottomLine)
        bottomLine.backgroundColor = .yellow
        bottomLine.snp.makeConstraints { (make) in
            make.height.equalTo(2.5)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
