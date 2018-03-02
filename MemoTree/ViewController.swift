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
        return 1
    }
    
    //セル設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell")!
        if userDefault.object(forKey: "memoDefault") != nil {
//            let memoList = userDefault.object(forKey: "memoDefault") as! [(String, String)]
            let memoList = NSKeyedUnarchiver.unarchiveObject(with: userDefault.object(forKey: "memoDefault") as! Data)
            let aaa = memoList as! [(String , String)]
            let title = cell.viewWithTag(2) as! UILabel
            title.text = aaa[indexPath.row].0
        }
        return cell
    }
    @IBAction func actNewMemoBtn(_ sender: UIBarButtonItem) {
        let memoView = self.storyboard?.instantiateViewController(withIdentifier: "memoView")
        present(memoView!, animated: false ,completion: nil)
    }
}

