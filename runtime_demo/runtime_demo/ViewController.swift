//
//  ViewController.swift
//  runtime_demo
//
//  Created by new on 2017/5/17.
//  Copyright © 2017年 9-kylins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK:- 控件属性
    @IBOutlet var pageControl: UIPageControl!
    
    //MARK:- 系统回调方法
    override func viewDidLoad() {
        super.viewDidLoad()
     
        runtime()
    }
}

//MARK:- runtime
// 修改pageControl的小点样式
extension ViewController {
    
    func runtime() {
        
        // 1, 利用runtime 遍历出pageControl的所有属性
        var count : UInt32 = 0
        let ivars = class_copyIvarList(UIPageControl.self, &count)
        for i in 0..<count {
            
            let ivar = ivars?[Int(i)]
            let name = ivar_getName(ivar)
            print(String(cString: name!))
            
            /* 打印出来的所有属性
             _lastUserInterfaceIdiom
             _indicators
             _currentPage
             _displayedPage
             _pageControlFlags
             _currentPageImage // 图片样式
             _pageImage // 图片样式
             _currentPageImages
             _pageImages
             _backgroundVisualEffectView
             _currentPageIndicatorTintColor
             _pageIndicatorTintColor
             _legibilitySettings
             _numberOfPages
             */
        }
        
        // 2, 利用kvc修改图片
        pageControl.setValue(UIImage(named: "page"), forKey: "_pageImage")
        pageControl.setValue(UIImage(named: "currentpage"), forKey: "_currentPageImage")
    }
}








