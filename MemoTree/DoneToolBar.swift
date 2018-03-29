//
//  DoneToolBar.swift
//  MemoTree
//
//  Created by 山中力仁 on 2018/03/30.
//  Copyright © 2018年 yamayoshi. All rights reserved.
//

import UIKit

class DoneToolBar: UIToolbar {
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet weak var DoneBtn: UIBarButtonItem!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBAction func actDoneBtn(_ sender: Any) {
        let memoArea = appDelegate.memoArea
        memoArea!.endEditing(true)
    }
    
}
