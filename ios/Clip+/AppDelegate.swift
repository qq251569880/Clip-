//
//  AppDelegate.swift
//  Clip+
//
//  Created by 张宏台 on 14/10/28.
//  Copyright (c) 2014年 张宏台. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        //通知栏
        
        
        
        var acceptAction:UIMutableUserNotificationAction = UIMutableUserNotificationAction();
        acceptAction.identifier = "ACCEPT_IDENTIFIER";
        acceptAction.title = "转换";
        acceptAction.activationMode = UIUserNotificationActivationMode.Background;
        acceptAction.destructive = false;
        acceptAction.authenticationRequired = false;
        
        var inviteCategory:UIMutableUserNotificationCategory = UIMutableUserNotificationCategory();
        inviteCategory.identifier = "INVITE_CATEGORY";
        inviteCategory.setActions([acceptAction], forContext: .Default);
        inviteCategory.setActions([acceptAction], forContext: .Minimal);
        
        var catSet = NSSet(objects: inviteCategory);
        var types:UIUserNotificationType = UIUserNotificationType.Alert | UIUserNotificationType.Badge;
        var mySettings:UIUserNotificationSettings = UIUserNotificationSettings(forTypes: types
            , categories: catSet);
        UIApplication.sharedApplication().registerUserNotificationSettings(mySettings);

        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        UIApplication.sharedApplication().cancelAllLocalNotifications();
        if localNotif != nil{
            localNotif!.fireDate = NSDate(timeIntervalSinceNow:3);
            
            UIApplication.sharedApplication().scheduleLocalNotification(localNotif!);
        }

    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        println("11");
        UIApplication.sharedApplication().cancelAllLocalNotifications();
        if localNotif != nil{
            localNotif!.fireDate = NSDate(timeIntervalSinceNow:3);
            
            UIApplication.sharedApplication().scheduleLocalNotification(localNotif!);
        }
        

    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forLocalNotification notification: UILocalNotification, completionHandler: () -> Void){
        var pasteBoard:UIPasteboard = UIPasteboard.generalPasteboard();
        var pasteText = pasteBoard.string;
        if pasteText != nil && pasteText != ""{
            var Text2:String = trimSpace(pasteText!);
            pasteBoard.string = switchFormat(Text2);
            
        }
        if localNotif != nil{
            localNotif!.fireDate = NSDate(timeIntervalSinceNow:3);

            UIApplication.sharedApplication().scheduleLocalNotification(localNotif!);
        }
        completionHandler();
    }

}

