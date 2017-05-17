//
//  CompleteTaskViewController.swift
//  DoIT
//
//  Created by Kevin Wang on 5/16/17.
//  Copyright © 2017 Kevin Wang. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    
    @IBOutlet weak var taskLabel: UILabel!
    
    var task = Task()
    var previousVc = TasksViewController()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        if task.important {
            
     taskLabel.text = "!\(task.name)"
        } else {
            taskLabel.text = task.name
        }
        
    }

    @IBAction func completeTapped(_ sender: Any) {
        previousVc.tasks.remove(at: previousVc.selectedIndex)
        previousVc.tableView.reloadData()
        navigationController!.popViewController(animated: true)

    }

    }
    

    


