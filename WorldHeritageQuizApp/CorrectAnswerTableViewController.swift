//
//  CorrectAnswerTableViewController.swift
//  WorldHeritageQuizApp
//
//  Created by 小野勇輔 on 2019/08/13.
//  Copyright © 2019 yo-project. All rights reserved.
//

import UIKit

class CorrectAnswerTableViewController: UITableViewController {

    
    
    // 正誤配列
    var Result : [Bool] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
  
    
    // セル数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   
        return Result.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if Result[indexPath.row] {
            cell.textLabel?.text = "\(indexPath.row + 1)問目 ○"
            
        } else {
            cell.textLabel?.text = "\(indexPath.row + 1)問目 ×"
            
        }
        
        return cell
    }
        

    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
