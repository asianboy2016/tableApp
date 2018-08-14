//
//  ViewController.swift
//  ReviewTableToTable
//
//  Created by keisuke naruse on 2018/08/04.
//  Copyright © 2018年 keisuke naruse. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet var tableView: UITableView!
    
    let someArray:[String] = ["果物", "スポーツ", "アニメ", "野菜", "映画", "飲み物"]
    
    var chosenCell: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //tableViewにあるTableViewCellを登録
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil),forCellReuseIdentifier: "cell_01")
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
            
            return someArray.count
            
        }
        // 各セルの要素を指定
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->(UITableViewCell) {
            // UITableViewCellのインスタンスを生成
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell_01", for: indexPath) as! TableViewCell
            
            // セルのUILabelに配列の中身を順に表示
            cell.label.text = someArray[indexPath.row]
            
            return cell
           
            
        }
            // セルが選択された時に呼ばれる
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
            // 選択されたcellの番号を記憶
            chosenCell = indexPath.row
            // 画面遷移の準備
            performSegue(withIdentifier: "toSecondViewController", sender: nil)
            
        }
    
    
     // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any!){
        // 遷移先のViecControllerのインスタンスを生成
        let secVC: secondViewController = (segue.destination as? secondViewController)!
         // secondViewControllerのgetCellに選択された画像を設定する
        secVC.getCell = chosenCell
        
    }
}





