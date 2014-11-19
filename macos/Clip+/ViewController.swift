//
//  ViewController.swift
//  Clip+
//
//  Created by 张宏台 on 14/11/18.
//  Copyright (c) 2014年 张宏台. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var leftTextField: UITextField!
    @IBOutlet weak var rightTextField: UITextField!

    @IBOutlet weak var keyTextField: UITextField!

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
    @IBAction func rightSwitchClick(sender: UIButton) {
        var Text1:String = leftTextField.text;
        var Text2:String = trimSpace(Text1);
        rightTextField.text = switchFormat(Text2);
        
    }
    @IBAction func leftSwitchClick(sender: UIButton) {
        var Text1:String = rightTextField.text;
        var Text2:String = trimSpace(Text1);
        leftTextField.text = switchFormat(Text2);
    }
    
    @IBAction func leftSwitchClick(sender: UIButton) {
        if keyTextField.text != "" {
            keyString = keyTextField.text.md5Encrypt();
            println("new key is \(keyString)");
        }else{
            passWd = defaultKey;
            keyString = passWd.md5Encrypt();
            println("use default key");
        }
    }

    
}

