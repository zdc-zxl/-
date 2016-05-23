//
//  ViewControllerthried.swift
//  sjk
//
//  Created by dllm on 16/5/23.
//  Copyright © 2016年 zdc. All rights reserved.
//

import UIKit

class ViewControllerthried: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        }
        else
      {
        red++
        redfont.text!="\(red)"
        }
        if(b==3)
        {
            win.text!="红队获胜"
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
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
