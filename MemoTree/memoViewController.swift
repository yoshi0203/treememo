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
    @IBOutlet weak var doneBtn: UIBarButtonItem!
    
    //(タイトル,本文)
    var memoList: [[Any]] = []
    let userDefaults: UserDefaults = UserDefaults.standard
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //保存されるリストをゲットしてくる
        if userDefaults.object(forKey: appDelegate.memoListTitle) != nil {
            memoList = userDefaults.object(forKey: appDelegate.memoListTitle) as! [[Any]]
            if appDelegate.newMemoFlag {
                appDelegate.newMemoFlag = false
                titleField.text = ""
                memoAria.text = ""
            }else{
                let memoData = memoList[appDelegate.cellRow] as! [String]
                titleField.text = memoData[0]
                memoAria.text = memoData[1]
            }
            
            appDelegate.memoArea = memoAria
            
        }else{
            userDefaults.register(defaults: [appDelegate.memoListTitle : ""])
            userDefaults.synchronize()
        }
        
        //キーボードの完了ボタン編集
        let doneToolBar = UINib(nibName: "ToolBar", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! DoneToolBar
        doneToolBar.frame = CGRect(x: 0, y: 0, width: 320 , height: 40)
        doneToolBar.sizeToFit()
        memoAria.inputAccessoryView = doneToolBar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //保存ボタン
    @IBAction func actSaveBtn(_ sender: UIBarButtonItem) {
        memoSave()
        self.navigationController?.popToRootViewController(animated: true)
    }
    func memoSave() {
        var titleVal: String = ""
        var memoVal: String = ""
        
        if titleField.text != "" {
            titleVal = titleField.text!
        }else{
            titleVal = "無題"
        }
        
        memoVal = memoAria.text!
        
        let memoSet = [titleVal,memoVal]
        memoList.append(memoSet)
        userDefaults.set(memoList , forKey: appDelegate.memoListTitle)
        userDefaults.synchronize()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        titleField.resignFirstResponder()
        memoAria.resignFirstResponder()
    }
}

