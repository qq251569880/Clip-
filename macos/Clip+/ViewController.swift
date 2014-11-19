//
//  ViewController.swift
//  Clip+
//
//  Created by 张宏台 on 14/11/18.
//  Copyright (c) 2014年 张宏台. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var keyTextField: NSTextField!
    @IBOutlet weak var leftTextField: NSTextField!
    
    @IBOutlet weak var rightTextField: NSTextField!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        //默认密钥生成
        keyString = passWd.md5Encrypt();

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    @IBAction func rightSwitchClick(sender: AnyObject) {
        var Text1:String = leftTextField.stringValue;
        var Text2:String = trimSpace(Text1);
        var opString = switchFormat(Text2);
        if opString != nil {
            rightTextField.stringValue = opString!;
        }else
        {
            rightTextField.stringValue = "";
            rightTextField.placeholderString = "加解密错误";
        }
        
    }
    @IBAction func leftSwitchClick(sender: AnyObject) {
       var Text1:String = rightTextField.stringValue;
        var Text2:String = trimSpace(Text1);
        var opString = switchFormat(Text2);
        if opString != nil {
            leftTextField.stringValue = opString!;
        }else
        {
            rightTextField.stringValue = "";
            leftTextField.placeholderString = "加解密错误";
        }
    }
    
    @IBAction func setKeyClick(sender: AnyObject) {
        if keyTextField.stringValue != "" {
            keyString = keyTextField.stringValue.md5Encrypt();
            println("new key is \(keyString)");
        }else{
            passWd = defaultKey;
            keyString = passWd.md5Encrypt();
            println("use default key");
        }
    }

    
}

