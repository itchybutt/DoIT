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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTapped(_ sender: Any) {
    
        // Create a Task from the outlet information
        
     
       
        
        let context = (UIApplication.shared.delegate as! AppDelegate)
            .persistentContainer.viewContext
        
        let task = Task(context: context)
        
        task.name = TaskNameTestField.text!
        task.important = ImportantSwitch.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        // Pop back
        
        
            navigationController!.popViewController(animated: true)
        
    }
    
    

    }

