//
//  UIViewController+.swift
//  EFNavigationBar
//
//  Created by EyreFree on 2020/6/03.
//
//  Copyright (c) 2019 EyreFree <eyrefree@eyrefree.org>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import EFFoundation
import Foundation

public extension CGFloat {
    
    static var _topSafeAreaHeight: CGFloat = 0
    
    static var statusBarHeight: CGFloat = topSafeAreaHeight
    
    static var topSafeAreaHeight: CGFloat {
        guard _topSafeAreaHeight == 0
        else { return _topSafeAreaHeight }
        
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        _topSafeAreaHeight = scene?.windows.first?.safeAreaInsets.top ?? 0
        return _topSafeAreaHeight
    }
    
    static var _bottomSafeAreaHeight: CGFloat = 0
    
    static var bottomSafeAreaHeight: CGFloat {
        guard _bottomSafeAreaHeight == 0
        else { return _bottomSafeAreaHeight }
        
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        _bottomSafeAreaHeight = scene?.windows.first?.safeAreaInsets.bottom ?? 0
        
        return _bottomSafeAreaHeight
    }
    
    static var tabBarHeight: CGFloat {
        return bottomSafeAreaHeight + 44
    }
    
    static var navigationBarHeight: CGFloat = 44
    
    static var statusBarAndNavigationBarHeight: CGFloat {
        return topSafeAreaHeight + navigationBarHeight
    }
    
    static var topSafeAreaWithoutStatusBarHeight: CGFloat {
        return topSafeAreaHeight - 20 // 这个要跟极速确认一下
    }
    
}

public struct EFNavigationBarConfig {
    
    public var statusBarStyle: UIStatusBarStyle = UIStatusBarStyle.default
    
    public var title: String?
    public var height: CGFloat = CGFloat.statusBarAndNavigationBarHeight
    public var backgroundColor: UIColor = UIColor.white
    
    public var bottomLineColor: UIColor = UIColor(red: 32.0 / 255.0, green: 36.0 / 255.0, blue: 38.0 / 255.0, alpha: 0.06)
    
    public var titleColor: UIColor = UIColor.black
    public var titleSize: CGFloat = 16 {
        didSet {
            titleFont = UIFont.systemFont(ofSize: titleSize)
        }
    }
    public var titleFont: UIFont = UIFont.pingFangSCMedium(ofSize: 16)
    let titleHeight: CGFloat = CGFloat.navigationBarHeight
    let titleWidth: CGFloat = CGFloat.screenWidth - 2 * CGFloat.navigationBarHeight
    
    public var buttonTitleColor: UIColor = UIApplication.shared.keyWindow()?.tintColor ?? UIColor.black
    public var buttonTitleSize: CGFloat = UIFont.labelFontSize {
        didSet {
            buttonTitleFont = UIFont.systemFont(ofSize: buttonTitleSize)
        }
    }
    public var buttonTitleFont: UIFont = UIFont.systemFont(ofSize: UIFont.labelFontSize)
    public var buttonMargin: CGFloat = 0
    public var buttonWidth: CGFloat = CGFloat.navigationBarHeight
    public var buttonHeight: CGFloat = CGFloat.navigationBarHeight
}
