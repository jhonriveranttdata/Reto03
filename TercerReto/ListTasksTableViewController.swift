//
//  ListTasksTableViewController.swift
//  TercerReto
//
//  Created by Jhon Bryan Rivera Mino on 2/12/22.
//

import UIKit

class ListTasksTableViewController: UITableViewController {
    var arrayTask : [Task] = []
    var indexTask : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayTask.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTask", for: indexPath)
        let task = arrayTask[indexPath.row]
        cell.textLabel?.text = task.title

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexTask = indexPath.row
        
        let listTask = arrayTask[indexPath.row]
        
        guard let detailsTaskViewController = storyboard?.instantiateViewController(withIdentifier: "DetailsTaskViewController") as? DetailsTaskViewController else {
            return
        }
        detailsTaskViewController.indexTask = indexTask
        detailsTaskViewController.titleTask = listTask.title
        detailsTaskViewController.descriptionTask = listTask.description
        detailsTaskViewController.priorityTask = listTask.priority
        present(detailsTaskViewController, animated: true)
    }

}
extension ListTasksTableViewController{
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nav = segue.destination as? UINavigationController
        let destination = nav?.viewControllers.first as? AddTaskTableViewController
        destination?.delegate = self
    }
}
extension ListTasksTableViewController : NewTaskTableControllerDelegate{
    func NewViewController(_ viewController: AddTaskTableViewController, didCreateTask newTask: Task) {
        arrayTask.append(newTask)
        tableView.reloadData()
    }
}
extension ListTasksTableViewController: DeleteDetailsControllerDelegate{
    func deleteTaskDetailsViewController(didDeletedTask indexTask: Int) {
        print(indexTask)
        arrayTask.remove(at: indexTask)
        tableView.reloadData()
    }
    
}
