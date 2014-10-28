//
//  ViewController.swift
//  Clip+
//
//  Created by 张宏台 on 14/10/28.
//  Copyright (c) 2014年 张宏台. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tView: UITableView!
    
    //user define
    var screenHeight:CGFloat = 0.0;
    override func viewDidLoad() {
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
        let identifier:String = "menuCell"
        var cell : UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(identifier) as? UITableViewCell
        if cell == nil {
            cell = UITableViewCell(style:.Subtitle,reuseIdentifier:identifier)
        }else
        {
            println("cell is nil")
        }
        cell!.textLabel.text = "some"
        cell!.detailTextLabel!.text =  "some thing"
        cell!.detailTextLabel!.textColor = UIColor.lightGrayColor()
/*        println("add \(indexPath!.row) classify \(GclassifyArray[indexPath!.row].roomClassifyName)")
        cell!.textLabel.text = GclassifyArray[indexPath!.row].roomClassifyName
        cell!.detailTextLabel.text =  GclassifyArray[indexPath!.row].roomClassifyDiscription
        cell!.detailTextLabel.textColor = UIColor.lightGrayColor()
*/        return cell!
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 3//GclassifyArray.count
    }
    //UITableViewDelegate协议实现
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!){
        //start a Chat
/*        chatRoomClassify = (GclassifyArray[indexPath.row].roomClassifyName);
        
        classifyId = GclassifyArray[indexPath.row].roomSortId
        println("Now switch to \(chatRoomClassify)")
  */
        self.performSegueWithIdentifier("helpInfo",sender:self)
        
    }
    func tableView(tableView:UITableView, heightForRowAtIndexPath indexPath:NSIndexPath) -> CGFloat{
        //println("\(indexPath.row):\(ourCellContents[indexPath.row].cellHeight)")
        return screenHeight / 7.0;
        
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

