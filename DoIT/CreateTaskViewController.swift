//
//  CreateTaskViewController.swift
//  DoIT
//
//  Created by Kevin Wang on 5/14/17.
//  Copyright © 2017 Kevin Wang. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {
    
    @IBOutlet weak var TaskNameTestField: UITextField!
    
    @IBOutlet weak var ImportantSwitch: UISwitch!
    
    var previousVc = TasksViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTapped(_ sender: Any) {
    
        // Create task from the outlet information
       
        let task = Task()
        
        if TaskNameTestField.text != nil {
            
        
        task.name = TaskNameTestField.text!
        
            task.important = ImportantSwitch.isOn
        
        
        // Add new task to array in previous viewController
        
            previousVc.tasks.append(task)
            previousVc.tableView.reloadData()
            navigationController!.popViewController(animated: true)
        
    }
    
    

    }

}
