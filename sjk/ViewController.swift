//
//  ViewController.swift
//  sjk
//
//  Created by dllm on 16/5/5.
//  Copyright © 2016年 zdc. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    var db:SQLiteDB!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists t_user(uid integer primary key,uname varchar(20))")
        //如果有数据则加载
        
    }
    
    //点击保存
   
    
    
    //从SQLite加载数据
    
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

