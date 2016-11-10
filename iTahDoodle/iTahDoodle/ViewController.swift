//
//  ViewController.swift
//  iTahDoodle
//
//  Created by kenny on 10/11/2016.
//  Copyright © 2016 yuneec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    let todoList = TodoList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = todoList
        tableView.delegate = todoList
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addButtonPressed(sender: UIButton) {
        guard let text = itemTextField.text where !(itemTextField.text?.isEmpty)! else {
            print("text is empty")
            return
        }
        todoList.addItem(text)
        itemTextField.text = ""
        tableView .reloadData()
    }
}

