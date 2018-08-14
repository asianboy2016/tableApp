//
//  secondViewController.swift
//  ReviewTableToTable
//
//  Created by keisuke naruse on 2018/08/04.
//  Copyright © 2018年 keisuke naruse. All rights reserved.
//

import UIKit

class thirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet var thirdTableView: UITableView!
    
    //secondViewControllerから選択されたCell番号を受け取る変数
    var getCell2: Int!
    
    // セルの要素をあらかじめ決めうち
    // 果物
    let fruit2Array:[String] = ["1", "2", "バナナ", "オレンジ", "レモン", "ピーチ"]
    //スポーツ
    let sport2Array: [String] = ["1", "野球", "ラグビー", "卓球"]
    // アニメ
    let anime2Array: [String] = ["1", "プ", "テ", "ピ", "ピ", "ッ", "ク"]
    // 野菜
    let vegetable2Array: [String] = ["1", "トマト", "キャベツ", "キュウリ", "大豆", "レタス", "サニーレタス"]
    // 映画
    let movie2Array: [String] = ["1", "スターウォーズ", "アイアンマン", "スパイダーマン", "ゴーストバスターズ", "ブラックホークダウン", "タイタニック", "バックトゥーザフューチャー", "ジュラシックパーク"]
    // 飲み物
    let drink2Array: [String] = ["1", "烏龍茶"]
    // 選択されたジャンルの配列の長さ変数
    
    
    var arrayLength1: Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //テーブルビューにTableViewCellを登録
        thirdTableView.register(UINib(nibName: "thirdTableViewCell", bundle: nil),forCellReuseIdentifier: "cell_03")
        
        thirdTableView.delegate = self
        thirdTableView.dataSource = self
        
        //選択されたジャンルによってセルの数を変える
        //getCellの中身が・・・
        switch getCell2 {
            
        case 0:
            arrayLength1 = fruit2Array.count
            
        case 1:
            arrayLength1 = sport2Array.count
            
        case 2:
            arrayLength1 = anime2Array.count
            
        case 3:
            arrayLength1 = vegetable2Array.count
            
        case 4:
            arrayLength1 = movie2Array.count
            
        case 5:
            arrayLength1 = drink2Array.count
        default:
            break
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayLength1
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell2 = thirdTableView.dequeueReusableCell(withIdentifier: "cell_03", for: indexPath) as! thirdTableViewCell
        
        //選択されたジャンルによってセルの中身を変える
        //getCellの中身が・・・
        switch getCell2 {
        case 0:
            //セルのUILabelに配列の中身を順に表示
            cell2.thirdLabel.text = fruit2Array[indexPath.row]
            
        case 1:
            cell2.thirdLabel.text = sport2Array[indexPath.row]
            
        case 2:
            cell2.thirdLabel.text = anime2Array[indexPath.row]
            
        case 3:
            cell2.thirdLabel.text = vegetable2Array[indexPath.row]
            
        case 4:
            cell2.thirdLabel.text = movie2Array[indexPath.row]
            
        case 5:
            cell2.thirdLabel.text = drink2Array[indexPath.row]
            
        default:
            break
        }
        
        return cell2
    }
    
    
}




