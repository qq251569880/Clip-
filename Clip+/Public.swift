//
// Public.swift
//  Clip+
//
//  Created by 张宏台 on 14/10/30.
//  Copyright (c) 2014年 张宏台. All rights reserved.
//
import Foundation
import UIKit

//主页菜单显示
struct MainMenuInfo{
    var menuId:Int
    var menuDisplay:String
    var menuDiscription:String
}

var GmenuArray:[MainMenuInfo] = [];

func initRoomClassifyArray(){

    GmenuArray = []
    var menuName = "使用帮助"
    var menuTip = "功能介绍，使用场景，以及如何使用"
    var menu = MainMenuInfo(menuId:1, menuDisplay:menuName,menuDiscription:menuTip)
    GmenuArray.append(menu)
    
    menu.menuId = 2
    menu.menuDisplay = "设置密钥"
    menu.menuDiscription = "设置用于加密的密钥"
    GmenuArray.append(menu)
    
    menu.menuId = 3
    menu.menuDisplay = "捐助"
    menu.menuDiscription = "看这里~看这里~"
    GmenuArray.append(menu)
    
    menu.menuId = 4
    menu.menuDisplay = "隐藏"
    menu.menuDiscription = "隐藏主页面，使用复制剪切、粘贴加解密"
    GmenuArray.append(menu)
    
    menu.menuId = 5
    menu.menuDisplay = "关于"
    menu.menuDiscription = "关于Clip+关于Data+++关于我们"
    GmenuArray.append(menu)
    
    menu.menuId = 6
    menu.menuDisplay = "退出"
    menu.menuDiscription = "完全退出应用"
    GmenuArray.append(menu)
   

}

