//
//  ToolBar.swift
//  MemoTree
//
//  Created by 山中力仁 on 2018/03/23.
//  Copyright © 2018年 yamayoshi. All rights reserved.
//

import UIKit

class ToolBar: UIView {
    override init(frame: CGRect){
        super.init(frame: frame)
        lincToolBar()
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        lincToolBar()
    }
    //xibファイルを読み込んでビューに追加する
    func lincToolBar() {
        let view = Bundle.main.loadNibNamed("ToolBar", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
}
