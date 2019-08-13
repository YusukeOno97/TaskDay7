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
        
        showQuestions()
    
    
    }

    // 問題テキストビュー紐付け
    @IBOutlet weak var QuestionText: UITextView!
    
    // ボタン1紐付け
    @IBAction func Button1(_ sender: Any) {
        // 正解した時の関数呼び出し
        checkAnswer(yourAnswer: 1)
   
    }
    // ボタン2紐付け
    @IBAction func Button2(_ sender: Any) {
        // 正解した時の関数呼び出し
        checkAnswer(yourAnswer: 2)
    }
    // ボタン3紐付け
    @IBAction func Button3(_ sender: Any) {
        // 正解した時の関数呼び出し
        checkAnswer(yourAnswer: 3)
    }
    
    
   // ボタン4紐付け
    @IBAction func Button4(_ sender: Any) {
        // 正解した時の関数呼び出し
        checkAnswer(yourAnswer: 4)
        
    }
    
    // 現在の問題番号定義づけ
    var currentQuestionNum: Int = 0
    
    // 問題の管理
    let quesitions: [[String: Any]] = [
    [ "question": "日本の世界遺産『富士山－信仰の対象と芸術の源泉』は、2013年に（ ）として世界遺産登録されました。\n\n1.文化遺産  \n2.自然遺産 \n3.山岳遺産 \n4.伝統遺産", // 見やすくするために問題と番号を1行空けた
      "answer": 1
    ],
    [ "question": "イタリア共和国の世界遺産『フィレンツェの歴史地区』のあるフィレンツェを中心に、17世紀に栄えた芸術運動は何でしょうか。",
      "answer": 3
    ],
    [ "question": "2016年のオリンピック開催地であるリオ・デ・ジャネイロで、ブラジル独立100周年を記念して作られたキリスト像が立つ場所として、正しいものはどれか。",
      "answer": 2
    ]
    
]

    // 問題の表示
    func showQuestions(){
        // 問題番号の取得
        let question = quesitions[currentQuestionNum]
        // currentQuestionNumの値が問題数以上だったら最初の問題に戻す
        if currentQuestionNum >= question.count {
            currentQuestionNum = 0
        }
        
        
        // 問題内容の取得
        if let q = question["question"]as? String {
            // 問題をテキストビューに代入
            QuestionText.text = q
        }
    }
    
    // 回答を確認
    func checkAnswer(yourAnswer: Int) {
       
        let question = quesitions[currentQuestionNum]
        if let a = question["answer"] as? Int {
            
            // 正解だったら
            if yourAnswer == a {
                // アラート表示
                showAlert(title:"正解！", message: "次に進みますか")
                // 不正解だったら
            } else {
              WrongShowAlert (title: "不正解",message: "次に進みますか")
            }
        }else{
            print("答えが入ってません")
            return
        }
        
        
        
    }
    
    
    // 正解時にアラートを表示する関数
    func showAlert (title: String ,message: String){
        // アラート作成
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // ボタン部分作成
        let close = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {(action: UIAlertAction!) in
            // 問題を一個進める
            self.currentQuestionNum += 1
            // 次の問題が表示される。
            self.showQuestions()
            
        })
        // UIAlertControllerにActionを追加
        alert.addAction(close)
        // アラート表示
        present(alert, animated: true, completion: nil)
    }
    
    
  
    
    // 不正解時にアラートの表示をする関数
    func WrongShowAlert (title: String,message: String) {
        // アラート作成
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle:  UIAlertController.Style.alert)
        
        // Action設定
        // OKボタン
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
            // ボタンが押された時の処理を書く
            (action: UIAlertAction!) -> Void in
            // 問題を一個進める
            self.currentQuestionNum += 1
            // 次の問題が表示される。
            self.showQuestions()
        })
        // キャンセルボタン
        let cancelAction: UIAlertAction = UIAlertAction(title: "もういちど", style: UIAlertAction.Style.cancel, handler:{
            // ボタンが押された時の処理を書く
            (action: UIAlertAction!) -> Void in
            print("もう1度")
        })
        
        // ③ UIAlertControllerにActionを追加
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        
        // ④ Alertを表示
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
} // classの閉じスコープ

