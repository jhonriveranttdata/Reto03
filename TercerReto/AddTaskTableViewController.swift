//
//  AddTaskTableViewController.swift
//  TercerReto
//
//  Created by Jhon Bryan Rivera Mino on 2/12/22.
//

import UIKit
protocol NewTaskTableControllerDelegate{
    func NewViewController(_ viewController:AddTaskTableViewController, didCreateTask newTask: Task)
}

class AddTaskTableViewController: UITableViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var priorityTextField: UITextField!
    var delegate : NewTaskTableControllerDelegate?
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        
        let title = titleTextField.text
        let description = descriptionTextField.text
        let priority = priorityTextField.text
        
        guard let t = title, !t.isEmpty else { return }
        guard let d = description, !d.isEmpty else { return }
        guard let p = priority, !p.isEmpty else { return }
        
        let newTask = Task(title: t, description: d, priority: p)
        delegate?.NewViewController(self, didCreateTask: newTask)
        
        dismiss(animated: true)
    }
    
    @IBAction func closeButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.placeholder = "title"
        descriptionTextField.placeholder = "description"
        priorityTextField.placeholder = "priority"
    }
}
