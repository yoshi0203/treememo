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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //保存されるリストをゲットしてくる
        let aaa = memoList[0]
        
        titleField.text = aaa.0
        memoAria.text = aaa.1
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func actSaveBtn(_ sender: UIBarButtonItem) {
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
        }
    }
    
   
}
