//
//  memoViewController.swift
//  MemoTree
//
//  Created by 山中力仁 on 2018/02/27.
//  Copyright © 2018年 yamayoshi. All rights reserved.
//

import UIKit

class memoViewController: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var memoAria: UITextView!
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    //(タイトル,本文)
    var memoList = [(String,String)]()
    let userDefaults: UserDefaults = UserDefaults.standard
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //保存されるリストをゲットしてくる
        if userDefaults.object(forKey: appDelegate.memoListTitle) != nil {
            memoList = userDefaults.object(forKey: appDelegate.memoListTitle) as! [(String, String)]
            let aaa = memoList[0]
            titleField.text = aaa.0
            memoAria.text = aaa.1
        }else{
            userDefaults.register(defaults: [appDelegate.memoListTitle : ""])
            userDefaults.synchronize()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func actSaveBtn(_ sender: UIBarButtonItem) {
        memoSave()
        self.dismiss(animated: false, completion: nil)
    }
    func memoSave() {
        var titleVal: String = ""
        var memoVal: String = ""
        
        if titleField.text != nil {
            titleVal = titleField.text!
        }
        
        if memoAria.text != nil {
            memoVal = memoAria.text!
        }
        
        let memoSet = (titleVal,memoVal)
        memoList.append(memoSet)
        let aaa = NSKeyedArchiver.archivedData(withRootObject: memoList )
        
        userDefaults.set(aaa, forKey: appDelegate.memoListTitle)
        userDefaults.synchronize()
    }
}

