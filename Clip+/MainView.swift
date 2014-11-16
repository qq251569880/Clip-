//
//  MainViewController.swift
//  Clip+
//
//  Created by 张宏台 on 14/10/31.
//  Copyright (c) 2014年 张宏台. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UIViewController,UITextViewDelegate {
    

    @IBOutlet var subView: UIView!
    @IBOutlet weak var upTextView: UITextView!
    @IBOutlet weak var bottomTextView: UITextView!
    var activeTextView: UITextView? = nil;
    var subViewY:CGFloat = 0;
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var topView:UIToolbar = UIToolbar(frame: CGRectMake(0, 0, 320, 30));
        var spaceBtn:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: self, action: nil)
        var doneBtn:UIBarButtonItem = UIBarButtonItem(title: "Done", style: .Done, target: self, action: "dismissKeyBoard")
        topView.setItems([spaceBtn,doneBtn], animated: true);
        upTextView.inputAccessoryView = topView;
        bottomTextView.inputAccessoryView = topView;
        
        upTextView.delegate = self;
        bottomTextView.delegate = self;
        subViewY = subView.frame.origin.y;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func dismissKeyBoard(){
        if(activeTextView != nil){
            activeTextView!.resignFirstResponder();
            
        }
    }
  
    //开始编辑输入框的时候，软键盘出现，执行此事件
    func textViewDidBeginEditing(textView: UITextView)
    {
        var frame1:CGRect = textView.frame;
        println(self.view.frame);
        var offset:CGFloat = 286 - (self.view.frame.size.height - frame1.origin.y - frame1.height);//键盘高度226
        
        var animationDuration:NSTimeInterval  = 0.30;
        UIView.beginAnimations("ResizeForKeyboard",context:nil);
        UIView.setAnimationDuration(animationDuration)
        
        //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
        if(offset > 0) {
            self.subView.frame = CGRectMake(0.0, -offset, self.view.frame.size.width, self.view.frame.size.height);
        }
        activeTextView = textView;
        UIView.commitAnimations()
    }
    
    
    //输入框编辑完成以后，将视图恢复到原始状态
    func textViewDidEndEditing(textView: UITextView)
    {
        self.subView.frame = CGRectMake(0, subViewY, self.view.frame.size.width, self.view.frame.size.height);
        activeTextView = nil;
    }

    @IBAction func setBtnClick(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("setIdentifier",sender:self)
    }
    
    @IBAction func otherBtnClick(sender: UIBarButtonItem) {
    }
    
    @IBAction func upPasteClick(sender: UIButton) {
        var pasteBoard:UIPasteboard = UIPasteboard.generalPasteboard();
        upTextView.text = pasteBoard.string;
    }
    @IBAction func upCopyClick(sender: UIButton) {
        var pasteBoard:UIPasteboard = UIPasteboard.generalPasteboard();
        //var textData = upTextView.text.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        //pasteBoard.setValue(upTextView.text, forPasteboardType: "String")
        pasteBoard.string = upTextView.text;
        //println(pasteBoard.string);
    }
    @IBAction func upSwitchClick(sender: UIButton) {
        
    }
    @IBAction func clearBtnClick(sender: UIButton) {
        upTextView.text = "";
        bottomTextView.text = "";
    }
    @IBAction func bottomSwitchClick(sender: UIButton) {
        
    }
    @IBAction func bottomPasteClick(sender: UIButton) {
        var pasteBoard:UIPasteboard = UIPasteboard.generalPasteboard();
        bottomTextView.text = pasteBoard.string;
    }
    @IBAction func bottomCopyClick(sender: UIButton) {
        var pasteBoard:UIPasteboard = UIPasteboard.generalPasteboard();
        pasteBoard.string = upTextView.text;
    }
    
    //TextView代理
    
}

