//
//  ViewController.swift
//  MemoTree
//
//  Created by 山中力仁 on 2018/02/20.
//  Copyright © 2018年 yamayoshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newMemoBtn: UIBarButtonItem!
    
    let userDefault: UserDefaults = UserDefaults.standard
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //セクション数設定
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //セル数設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var memoListCnt = 0
        if userDefault.object(forKey: "memoDefault") != nil {
            let memoList = userDefault.object(forKey: "memoDefault") as! [[String]]
            memoListCnt = memoList.count
        }
        return memoListCnt
    }
    
    //セル設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell")!
        if userDefault.object(forKey: "memoDefault") != nil {
            let memoList = userDefault.object(forKey: "memoDefault") as! [[String]]
            let memoTitle = memoList[indexPath.row]
            let title = cell.viewWithTag(2) as! UILabel
            title.text = memoTitle[0]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        memoEdit(cellRow:indexPath.row)
    }
    
    @IBAction func actNewMemoBtn(_ sender: UIBarButtonItem) {
        appDelegate.newMemoFlag = true
        let memoView = self.storyboard?.instantiateViewController(withIdentifier: "memoView")
        self.navigationController?.pushViewController(memoView!, animated: true)
    }
    
    func memoEdit(cellRow: Int){
        appDelegate.cellRow = cellRow
        let memoView = self.storyboard?.instantiateViewController(withIdentifier: "memoView")
        self.navigationController?.pushViewController(memoView!, animated: true)
    }
}

