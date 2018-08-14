//
//  secondViewController.swift
//  ReviewTableToTable
//
//  Created by keisuke naruse on 2018/08/04.
//  Copyright © 2018年 keisuke naruse. All rights reserved.
//

import UIKit

class secondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    
    @IBOutlet var secondTableView: UITableView!
    
    // 選択されたセルを覚える変数
    var chosenCell2: Int!
    //ViewControllerから選択されたCell番号を受け取る変数
    var getCell: Int!
    
    // セルの要素をあらかじめ決めうち
    // 果物
    let fruitArray:[String] = ["リンゴ", "ブドウ", "バナナ", "オレンジ", "レモン", "ピーチ"]
    //スポーツ
    let sportArray: [String] = ["サッカー", "野球", "ラグビー", "卓球"]
    // アニメ
    let animeArray: [String] = ["ポ", "プ", "テ", "ピ", "ピ", "ッ", "ク"]
    // 野菜
    let vegetableArray: [String] = ["スイカ", "トマト", "キャベツ", "キュウリ", "大豆", "レタス", "サニーレタス"]
    // 映画
    let movieArray: [String] = ["ハリーポッター", "スターウォーズ", "アイアンマン", "スパイダーマン", "ゴーストバスターズ", "ブラックホークダウン", "タイタニック", "バックトゥーザフューチャー", "ジュラシックパーク"]
    // 飲み物
    let drinkArray: [String] = ["コーラ", "烏龍茶"]
    // 選択されたジャンルの配列の長さ変数


    var arrayLength: Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //テーブルビューにTableViewCellを登録
        secondTableView.register(UINib(nibName: "secondTableViewCell", bundle: nil),forCellReuseIdentifier: "cell_02")
        
        secondTableView.delegate = self
        secondTableView.dataSource = self
        
        //選択されたジャンルによってセルの数を変える
        //getCellの中身が・・・
        switch getCell {
            
        case 0:
            arrayLength = fruitArray.count
            
        case 1:
            arrayLength = sportArray.count
            
        case 2:
            arrayLength = animeArray.count
            
        case 3:
            arrayLength = vegetableArray.count
            
        case 4:
            arrayLength = movieArray.count
        
        case 5:
            arrayLength = drinkArray.count
        default:
            break
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return arrayLength
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
            
            let cell = secondTableView.dequeueReusableCell(withIdentifier: "cell_02", for: indexPath) as! secondTableViewCell
            
            //選択されたジャンルによってセルの中身を変える
            //getCellの中身が・・・
            switch getCell {
            case 0:
                //セルのUILabelに配列の中身を順に表示
                cell.secondLabel.text = fruitArray[indexPath.row]
                
            case 1:
                cell.secondLabel.text = sportArray[indexPath.row]
                
            case 2:
                cell.secondLabel.text = animeArray[indexPath.row]
                
            case 3:
                cell.secondLabel.text = vegetableArray[indexPath.row]
                
            case 4:
                cell.secondLabel.text = movieArray[indexPath.row]
                
            case 5:
                cell.secondLabel.text = drinkArray[indexPath.row]
            
            default:
                break
            }
            
            return cell
        }
    
    // セルが選択された時に呼ばれる
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 選択されたcellの番号を記憶
        chosenCell2 = indexPath.row
        // 画面遷移の準備
        performSegue(withIdentifier: "tothirdViewController",sender: nil)
    }
    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        // 遷移先のViecControllerのインスタンスを生成
        let thirdVC: thirdViewController = (segue.destination as? thirdViewController)!
        // secondViewControllerのgetCellに選択された画像を設定する
        thirdVC.getCell2 = chosenCell2
        
    }
}



