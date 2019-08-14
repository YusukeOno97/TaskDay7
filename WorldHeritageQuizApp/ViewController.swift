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
    
    override func viewWillAppear(_ animated: Bool) {
        // 問題を0から
        currentQuestionNum = 0
        // 正誤情報のリセット
        result = []
        // 問題表示
        showQuestions()
        // ボタン3の表示
        button3.isHidden = false
        // ボタン4の表示
        button4.isHidden = false
        
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
    
    // アウトレットボタン3
    @IBOutlet weak var button3: UIButton!
    
    // ボタン4紐付け
    @IBAction func Button4(_ sender: Any) {
        // 正解した時の関数呼び出し
        checkAnswer(yourAnswer: 4)
        
    }
    
    // アウトレットボタン4
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var QuestionTitle: UINavigationItem!
    
    
    // 現在の問題番号定義づけ
    var currentQuestionNum: Int = 0
    // 問題の正誤を入れる
    var result: [Bool] = []
    
    
    
    
    // 問題の管理
    let quesitions: [[String: Any]] = [
        [ "question": "日本の世界遺産『富士山－信仰の対象と芸術の源泉』は、2013年に（ ）として世界遺産登録されました。\n\n1.文化遺産  \n2.自然遺産 \n3.山岳遺産 \n4.伝統遺産", // 見やすくするために問題と番号を1行空けた
            "answer": 1
        ],
        [ "question": "イタリア共和国の世界遺産『フィレンツェの歴史地区』のあるフィレンツェを中心に、17世紀に栄えた芸術運動は何でしょうか。\n\n1. シュルレアリスム\n2. アバンギャルド\n3. ルネサンス",
          "answer": 3
        ],
        [ "question": "2016年のオリンピック開催地であるリオ・デ・ジャネイロで、ブラジル独立100周年を記念して作られたキリスト像が立つ場所として、正しいものはどれか。\n\n1. コパカバーナの山 \n2. コルコバードの丘",
          "answer": 2
        ]
        
    ]
    
    // 問題の表示
    func showQuestions(){
        // 現在の値が問題数以上だったら画面遷移する
        if currentQuestionNum  >= quesitions.count {
            performSegue(withIdentifier: "AnswerList", sender: self)
            
            QuestionTitle.title = "問題へ"
            
        } else {
            // 問題数以上じゃない時の処理
            // 問題番号の取得
            var question = quesitions[currentQuestionNum]
            
            QuestionTitle.title = "第\(currentQuestionNum + 1)問目"
            
            // 問題番号2の時にボタン4を隠す
            if currentQuestionNum == 1 {
                button4.isHidden = true
                // 問題番号3の時にボタン3と4を隠す
            } else if currentQuestionNum == 2 {
                button3.isHidden = true
                button4.isHidden = true
            }
            
            // 問題内容の取得
            if let q = question["question"]as? String {
                // 問題をテキストビューに代入
                QuestionText.text = q
            }
            currentQuestionNum += 1
        }
        
        //  ========以下は試行錯誤した時の残骸==========
        //        print(currentQuestionNum)
        //        var question = quesitions[currentQuestionNum]
        //
        //        QuestionTitle.title = "第\(currentQuestionNum + 1)問目"
        //
        //        // 問題番号2の時にボタン4を隠す
        //        if currentQuestionNum == 1 {
        //            button4.isHidden = true
        //        // 問題番号3の時にボタン3と4を隠す
        //        } else if currentQuestionNum == 2 {
        //            button3.isHidden = true
        //            button4.isHidden = true
        //        }
        //
        //        // 現在の値が問題数以上だったら画面遷移する
        //        print(currentQuestionNum)
        //
        //
        //        // 問題内容の取得
        //        if let q = question["question"]as? String {
        //            // 問題をテキストビューに代入
        //            QuestionText.text = q
        //        }
        
    }
    
    // 回答を確認
    func checkAnswer(yourAnswer: Int) {
        print("checkAnswer")
        print(currentQuestionNum)
        let question = quesitions[currentQuestionNum - 1]
        if let a = question["answer"] as? Int {
            
            // 正解だったら
            if yourAnswer == a {
                // 正解アラート表示
                showAlert(title:"正解！", message: "次に進みますか")
                // 不正解だったら
            } else {
                // 不正解アラート表示
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
            // 不正解情報の追加
            self.result.append(true)
            // 次の問題が表示される。
            self.showQuestions()
        })
        // UIAlertControllerにActionを追加
        alert.addAction(close)
        // アラート表示
        present(alert, animated: true, completion: nil)
    }
    // 画面遷移の準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // セグエの指定
        if segue.identifier == "AnswerList" {
            // 遷移先のviewControllerを取得
            let vc = segue.destination as! CorrectAnswerTableViewController
            // 値の受け渡し
            vc.Result = result
        }
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
            // 不正解情報の追加
            self.result.append(false)
            // 次の問題が表示される。
            self.showQuestions()
        })
        // キャンセルボタン
        let cancelAction: UIAlertAction = UIAlertAction(title: "もういちど", style: UIAlertAction.Style.cancel, handler:{
            // ボタンが押された時の処理を書く
            (action: UIAlertAction!) -> Void in
            print("もう1度")
        })
        
        // UIAlertControllerにActionを追加
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        
        // Alertを表示
        present(alert, animated: true, completion: nil)
    }
}

