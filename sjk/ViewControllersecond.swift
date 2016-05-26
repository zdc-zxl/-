//
//  ViewControllersecond.swift
//  sjk
//
//  Created by dllm on 16/5/9.
//  Copyright © 2016年 zdc. All rights reserved.
//

import UIKit

class ViewControllersecond: UIViewController {
    var db:SQLiteDB!

    override func viewDidLoad() {
        super.viewDidLoad()
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists t_one(uid integer primary key,red varchar(20),blue varchar(20),win varchar(20),redfont varchar(20),bluefont varchar(20))")
        //如果有数据则加载
        //initUser()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //saveUser()
    }
    
    //@IBOutlet weak var show: UILabel!
   // @IBOutlet weak var reed: UITextField!
    
    @IBOutlet weak var show: UILabel!
    @IBOutlet weak var redman: UITextField!
  //  @IBOutlet weak var write: UITextField!
    
    @IBOutlet weak var hhz: UILabel!
    @IBOutlet weak var blueman: UITextField!
    @IBOutlet weak var rn: UILabel!
    @IBOutlet weak var bn: UILabel!
    var tep=0;
    var r=0;
    var b2=0;
    
   /*func initUser() {//读出数据
        let data = db.query("select * from t_one")
        if data.count > 0 {
            //获取最后一行数据显示
            let user = data[data.count - 1]
            redman.text = user["red"] as? String
            blueman.text = user["red"] as? String
            
        }
    }
    
    func saveUser() {//写入数据库
        let red = redman.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into t_one(red) values('\(red)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
    }
*/
    @IBAction func INdb(sender: AnyObject) {
        //向数据库存入数据
        let red=redman.text!;
        let redfont=redwin.text!;
        let blue=blueman.text!;
        let bluefont=bluewin.text!;
        let win=show.text!;
        let sql = "insert into t_one(red, redfont,blue,bluefont,win) values('\(red)','\(redfont)','\(blue)','\(bluefont)','\(win)')"
        
        //print("sql: \(sql)")
        let result = db.execute(sql)
        print(result)

         //let result = db.execute(sql)
        
    }
    
    @IBAction func ride(sender: AnyObject) {
        let userdata = db.query("select * from t_one")
        if (userdata.count > 0) {
            //获取最后一行数据显示
            let user = userdata[userdata.count - 1]
            redman.text = user["red"] as? String
            blueman.text = user["blue"] as? String
            redwin.text = user["redfont"] as?String
            bluewin.text = user["bluefont"] as?String

            
        }
       

    }

   
    @IBOutlet weak var redf: UILabel!//红方得分
    @IBOutlet weak var bluef: UILabel!
    //蓝方得分
    @IBOutlet weak var redwin: UILabel!
    @IBOutlet weak var bluewin: UILabel!
    var a=0;
    var b=0;
    var a1=0;
    var b1=0;
    @IBAction func redbutton(sender: AnyObject) {
        if(tep==0)
        {
            a++
            if(a<11)
            {
                redf.text!="\(a)"
            }
            else if(a==11)
            {
                a1++
                redf.text!="\(a)"
                //redf.text!=""
                redwin.text!="\(a1)"
                a=0
            }
          /*  else
            {
                a=0;
                redf.text!=""
            }
*/
                if(a1==3)
                {
                    hhz.text!+="获胜者:"
                    show.text!=redman.text!;
           
                    tep=1;
                }
        }
        else
        {
            redf.text!=""
        }
        
    }
    
    @IBAction func bluef(sender: AnyObject) {
        if(tep==0)
        {
            b++
            // bluef.text!="\(b)"
        
            if(b<11)
            {
                bluef.text!="\(b)"
            }
            else if(b==11)
            {
                b1++
                bluef.text!="\(b)"
                //redf.text!=""
                bluewin.text!="\(b1)"
            b=0
            }
            /*else
            {
                b=0;
                bluef.text!=""
            }*/
                if(b1==3)
                {
            
                    show.textColor=UIColor.blueColor();
                    hhz.textColor=UIColor.blueColor();
                    hhz.text!+="获胜者:"
                    show.text!+=blueman.text!;
                        tep=1;
                    //show.text!=redman.text!;
            }
        }
        else
        {
           bluef.text!=""
        }
        

    }
    @IBAction func clean(sender: AnyObject) {
        a=0;
        redf.text!=""

        b=0;
        bluef.text!=""
    }
    
    @IBAction func redno(sender: AnyObject) {
        r++
        rn.text!="\(r)"
    }
    
    @IBAction func blueno(sender: AnyObject) {
        b2++
        bn.text!="\(b2)"
    }
    
    @IBAction func new(sender: AnyObject) {
        //全部初始化
        redwin.text!="";
        redf.text!="";
        bluef.text!="";
        bluewin.text!="";
        redman.text!="";
        blueman.text!="";
        a=0;
        a1=0;
        b=0;
        b1=0;
        rn.text!="";
        bn.text!="";
        show.text!="";
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
