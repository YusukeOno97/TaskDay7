//
//  ViewController.swift
//  WorldHeritageQuizApp
//
//  Created by 小野勇輔 on 2019/08/12.
//  Copyright © 2019 yo-project. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // 問題テキストビュー紐付け
    @IBOutlet weak var QuestionText: UITextView!
    
    // ボタン1紐付け
    @IBAction func Button1(_ sender: Any) {
    }
    // ボタン2紐付け
    @IBAction func Button2(_ sender: Any) {
    }
    // ボタン3紐付け
    @IBAction func Button3(_ sender: Any) {
    }
    
   // ボタン4紐付け
    @IBAction func Button4(_ sender: Any) {
    }
    
    // 現在の問題番号定義づけ
    var currentQuestionNum: Int = 0
    
    // 問題の管理
    let quesitions: [[String: Any]] = [
    [ "question": "日本の世界遺産『富士山－信仰の対象と芸術の源泉』は、2013年に（ ）として世界遺産登録されました。 1. 文化遺産 2. 自然遺産 3. 山岳遺産 4. 伝統遺産",
      "answer": 1
    ],
    [ "question": "イタリア共和国の世界遺産『フィレンツェの歴史地区』のあるフィレンツェを中心に、17世紀に栄えた芸術運動は何でしょうか。",
      "answer": 3
    ],
    [ "qusestion": "2016年のオリンピック開催地であるリオ・デ・ジャネイロで、ブラジル独立100周年を記念して作られたキリスト像が立つ場所として、正しいものはどれか。",
      "answer": 2
    ]
    
]

 
    
    
    
    
    
    
    
  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
} // classスコープ

