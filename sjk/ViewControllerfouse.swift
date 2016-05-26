//
//  ViewControllerfouse.swift
//  sjk
//
//  Created by dllm on 16/5/26.
//  Copyright © 2016年 zdc. All rights reserved.
//

import UIKit

class ViewControllerfouse: UIViewController {
    var db:SQLiteDB!
    
    @IBOutlet weak var redone: UITextField!
   // @IBOutlet var redtwo: UIView!
    @IBOutlet weak var redtwo: UITextField!
    @IBOutlet weak var bluethree: UITextField!
    @IBOutlet weak var bluefour: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists t_people1(uid integer primary key,red_one varchar(20),red_two varchar(20),blue_one varchar(20),blue_two varchar(20))")
        //如果有数据则加载
        //initUser()
        
        // Do any additional setup after loading the view.
    }

        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func read(sender: AnyObject) {
        //将比赛人员记录到数据库中
     let red_one=redone.text!
    let red_two=redtwo.text!
    let blue_one=bluethree.text!
        let blue_two=bluefour.text!
        
        let sql = "insert into t_people1(red_one, red_two,blue_one,blue_two) values('\(red_one)','\(red_two)','\(blue_one)','\(blue_two)')"
        
        //print("sql: \(sql)")
        let result = db.execute(sql)
        print(result)
        
        //let result = db.execute(sql)
        
 
    }

    @IBAction func readpeople(sender: AnyObject) {
        let user = db.query("select * from t_people1")
        if (user.count > 0) {
            //获取最后一行数据显示
            let user = user[user.count - 1]
                       //red_one_font.text = user["redfont"] as?String
            //bluewin.text = user["bluefont"] as?String
            redone.text=user["red_one"] as?String
            redtwo.text=user["red_two"] as?String
            bluethree.text=user["blue_one"] as?String
            bluefour.text=user["blue_two"] as?String
        }
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
