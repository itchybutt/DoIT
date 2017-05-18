//
//  TasksViewController.swift
//  DoIT
//
//  Created by Kevin Wang on 5/14/17.
//  Copyright © 2017 Kevin Wang. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [Task] = []
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup a fter loading the view, typically from a nib.
        
       
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "❗️\(task.name!)"
        } else {
           cell.textLabel?.text = task.name!
        }
        
    return cell
    }
    
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "Walk the dog"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Buy Cheese"
        task2.important = true
        
        let task3 = Task()
        task3.name = "Mow lawn"
        task3.important = false
    
        
    return [task1, task2, task3]
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    
                                            {
       
        let task = tasks[indexPath.row]
        
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    
  
    
    @IBAction func addTapped(_ sender: Any) {
    performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    func getTasks() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            tasks = try context.fetch(Task.fetchRequest()) as!
                [Task]
            print(tasks)
        } catch {
           print("OOPS WE HAVE AN ERROR")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "selectTaskSegue" {
            let nextVC = segue.destination as!
                CompleteTaskViewController
            nextVC.task = sender as? Task
        }
    }
}


