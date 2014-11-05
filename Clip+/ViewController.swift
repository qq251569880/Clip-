//
//  ViewController.swift
//  Clip+
//
//  Created by 张宏台 on 14/10/30.
//  Copyright (c) 2014年 张宏台. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tView: UITableView!
    
    //user define
    var screenHeight:CGFloat = 0.0;
    var keyString:NSString = "";
    override func viewDidLoad() {
        initRoomClassifyArray();
        tView.delegate = self
        tView.dataSource = self
        screenHeight = tView.frame.height
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->UITableViewCell{
        let identifier:String = "menuCell";
        var cell : UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(identifier) as? UITableViewCell
        if cell == nil {
            cell = UITableViewCell(style:.Subtitle,reuseIdentifier:identifier);
        }else
        {
            println("cell is nil");
        }
        println("add \(indexPath.row) classify \(GmenuArray[indexPath.row].menuDisplay)")
        cell!.textLabel.text = GmenuArray[indexPath.row].menuDisplay;
        cell!.detailTextLabel!.text =   GmenuArray[indexPath.row].menuDiscription;
        cell!.detailTextLabel!.textColor = UIColor.lightGrayColor()
        return cell!
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return GmenuArray.count;
    }
    //UITableViewDelegate协议实现
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!){
        //start a Chat
/*        chatRoomClassify = (GclassifyArray[indexPath.row].roomClassifyName);
        
        classifyId = GclassifyArray[indexPath.row].roomSortId
        println("Now switch to \(chatRoomClassify)")
  */        
        if (indexPath.row == 0){
            //测试md5加密
            var passwd:NSString = "123";
            keyString = passwd.md5Encrypt();
            println("key \(keyString)");

        }else if (indexPath.row == 1){
            //测试md5加密
//             var keyAlert = KeyAlertViewController(initWithTitle:@"密码修改",
//                                                   message:nil,
//                                                   delegate:self,
//                                                   cancelButtonTitle:@"确定",
//                                                   otherButtonTitles:@"取消", nil);
//             keyAlert.show();
        }else if(indexPath.row == 2){
            var content:NSString = "abc";
            var encode  = content.AES256EncryptWithKey(keyString);
            println("encode str \(encode)");
        }else{
            self.performSegueWithIdentifier("helpInfo",sender:self)
        }
    }
    func tableView(tableView:UITableView, heightForRowAtIndexPath indexPath:NSIndexPath) -> CGFloat{
        //println("\(indexPath.row):\(ourCellContents[indexPath.row].cellHeight)")
        return 60;
        
    }    //UITableViewDelegate协议实现

/*    override func prepareForSegue(segue:UIStoryboardSegue,sender:AnyObject ){
        
        if (segue.identifier == "helpInfo") {
            var chatclassifyController:IHClassifyRoomViewController  = segue.destinationViewController as IHClassifyRoomViewController;
            chatclassifyController.chatRoomClassify = chatRoomClassify;
            chatclassifyController.classifyId = classifyId
            
            println("Chat classify is \(chatRoomClassify)")
        }else if (segue.identifier == "myselfInfo") {
            var infoController:IHInfoViewController  = segue.destinationViewController as IHInfoViewController;
            infoController.infoDelegate = self;
            currentInfoController = infoController
        }else{
            println("segue id = \(segue.identifier)")
        }
    }*/

}

