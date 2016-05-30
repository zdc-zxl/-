//
//  ViewControllerthried.swift
//  sjk
//
//  Created by dllm on 16/5/23.
//  Copyright © 2016年 zdc. All rights reserved.
//

import UIKit

class ViewControllerthried: UIViewController {
  var db:SQLiteDB!
    override func viewDidLoad() {
        super.viewDidLoad()
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists t_two(uid integer primary key,red varchar(20),blue varchar(20),win_one varchar(20),red_one varchar(20),red_two varchar(20),blue_one varchar(20) ,blue_two varchar(20),red_one_font varchar(20),red_two_font varchar(20),blue_one_font varchar(20),blue_two_font varchar(20))")
        //red 红方胜场 ,blue 蓝方胜场 ,win 获胜方，red_one,red_two,blue_one,blue_two纪录比赛名
        //red_one_font,red_two_font,blue_one_font,blue_two_font个人比赛分数
     initUserbuttontitle()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var win: UILabel!
    //红方
    @IBOutlet weak var redfont: UILabel!

    @IBOutlet weak var redwin: UILabel!
    
    
   
    @IBOutlet weak var redonefont: UILabel!
    @IBOutlet weak var redtwodont: UILabel!
    var b=0;
    var red=0;
    var red1=0;
    var rone=0
    var rtwo=0
    var temp1=0;
    @IBAction func redoneadd(sender: AnyObject) {
    //红方第一个队员加分
    
    if(temp1==0)
    {
        rone++

        redonefont.text!="\(rone)"
      if(red==10)
        {
            b++
            red=0
            redfont.text!="11"
            redwin.text!="\(b)"
            //red=0;
            blue=0;
        }
        else
      {
        red++
        redfont.text!="\(red)"
        }
       
        if(b==3)
        {  win.textColor=UIColor.redColor();
            win.text!="红队获胜"
            temp1=1;
        }
    }
    
        
    }

    @IBAction func redtwoadd(sender: AnyObject) {
    //红方第二个队员加分
        if(temp1==0)
        {
      rtwo++
        redtwodont.text!="\(rtwo)"
        if(red==10)
        {
            b++
            red=0
            redfont.text!="11"
            redwin.text!="\(b)"
             blue=0;
        }
        else
        {
            red++
            redfont.text!="\(red)"
           
        }
        if(b==3)
        {   win.textColor=UIColor.redColor();
            win.text!="红队获胜"
            temp1=1;
        }
        
        }
    }
    
    //蓝方
    @IBOutlet weak var bluefont: UILabel!
    
    @IBOutlet weak var blueonefont: UILabel!
    
    @IBOutlet weak var bluetwofont: UILabel!
    var blue=0;
    var blue2=0;
    var a=0
    var bone=0;
    var btwo=0;
    //var temp2=0;
    @IBOutlet weak var bluewin: UILabel!
    
    
    @IBAction func blueoneadd(sender: AnyObject) {
        if(temp1==0)
        {
        bone++
        blueonefont.text!="\(bone)"
        if(blue==10)
        {
            a++
            blue=0
            bluefont.text!="11"
            bluewin.text!="\(a)"
            red=0;
           // blue=0;
        }
        else
        {
            blue++
            bluefont.text!="\(blue)"
        }
        if(a==3)
        {  win.textColor=UIColor.blueColor();
            win.text!="蓝队获胜"
            temp1=1;
        }
        }
    }
    
    
    @IBAction func bluetwofont(sender: AnyObject) {
        if(temp1==0)
        {
        btwo++
        bluetwofont.text!="\(btwo)"
        if(blue==10)
        {
            a++
            blue=0
            bluefont.text!="11"
            bluewin.text!="\(a)"
            red=0;
            //blue=0;
        }
        else
        {
            blue++
            bluefont.text!="\(blue)"
        }
        if(a==3)
        {
            win.textColor=UIColor.blueColor();
            win.text!="蓝队获胜"
            temp1=1;
        }
    }
    }
    
    @IBAction func clean(sender: AnyObject) {
        b=0;
        red=0;
        red1=0;
        rone=0
        rtwo=0
      
        blue=0;
        blue2=0;
        a=0
        bone=0;
        btwo=0;
        redfont.text!=""
        bluefont.text!=""
        redonefont.text!=""
        redtwodont.text!=""
        redwin.text!=""
        blueonefont.text!=""
        bluetwofont.text!=""
        bluewin.text!=""
        temp1=0
        win.text!=""
    }
    //red 红方胜场 ,blue 蓝方胜场 ,win_one 获胜方，red_one,red_two,blue_one,blue_two纪录比赛名
    //red_one_font,red_two_font,blue_one_font,blue_two_font个人比赛分数
    
    @IBAction func read(sender: AnyObject) {
        //向数据库存入数据
        //let red=redman.text!;
        let red=redwin.text!;
        //let blue=blueman.text!;
        let blue=bluewin.text!;
        //let win=win.text!;
        let win_one=win.text!
        let red_one_font=redonefont.text!
        let red_two_font=redtwodont.text!
        let blue_one_font=blueonefont.text!
        let blue_two_font=bluetwofont.text!
        let sql = "insert into t_two(red, blue,win_one,red_one_font,red_two_font,blue_one_font,blue_two_font) values('\(red)','\(blue)','\(win_one)','\(red_one_font)','\(red_two_font)','\(blue_one_font)','\(blue_two_font)')"
        
        print("sql: \(sql)")
        let result = db.execute(sql)
        print(result)
        
        //let result = db.execute(sql)
        
    }
    @IBAction func next(sender: AnyObject) {
      redfont.text!=""
    bluefont.text!=""
    }
    @IBAction func readnew(sender: AnyObject) {
        let userdata = db.query("select * from t_two")
        if (userdata.count > 0) {
            //获取最后一行数据显示
            let user = userdata[userdata.count - 1]
            redwin.text = user["red"] as? String
            bluewin.text = user["blue"] as? String
            //红蓝双方胜场
            //red_one_font.text = user["redfont"] as?String
            //bluewin.text = user["bluefont"] as?String
            redonefont.text = user["red_one_font"] as?String
            redtwodont.text = user["red_two_font"] as?String
            //红方个人得分
            blueonefont.text = user["blue_one_font"] as?String
            bluetwofont.text = user["blue_two_font"] as?String
            //蓝方个人得分
            win.text=user["win_one"] as?String
        }

    }
    
    @IBOutlet weak var redfirst: UIButton!
    @IBOutlet weak var redsecond: UIButton!
    @IBOutlet weak var bluefirst: UIButton!
    @IBOutlet weak var bluesecond: UIButton!
    var str1=true
    var str2=0
    var str3=0
    var str4=0;
    
    func initUserbuttontitle(){
         let userdata = db.query("select * from t_people1")
        if (userdata.count > 0) {
         let user = userdata[userdata.count - 1]
         let str1 =  user["red_one"] as?String
         let str2=user["red_two"]as?String
         let str3=user["blue_one"]as?String
         let str4=user["blue_two"]as?String
        redfirst.setTitle(str1, forState:UIControlState.Normal)
        redsecond.setTitle(str2, forState:UIControlState.Normal)
        bluefirst.setTitle(str3, forState:UIControlState.Normal)
        bluesecond.setTitle(str4, forState:UIControlState.Normal)
    }

    //测试
   
    //@IBOutlet weak var red_onea: UIButton!
    //修改按钮名称
  /*  func initUser() {//读出数据
        let data = db.query("select * from t_people1")
        if data.count > 0 {
            //获取最后一行数据显示
            let user = data[data.count - 1]
           
            // redman.text = user["red"] as? String
           // blueman.text = user["red"] as? String
            
            
        }
    }
    */
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    }
}
