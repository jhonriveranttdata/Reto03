//
//  DetailsTaskViewController.swift
//  TercerReto
//
//  Created by Jhon Bryan Rivera Mino on 4/12/22.
//

import UIKit

protocol DeleteDetailsControllerDelegate: AnyObject{
    func deleteTaskDetailsViewController(didDeletedTask indexTask : Int)
}

class DetailsTaskViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priorityLabel: UILabel!
    var delegate:DeleteDetailsControllerDelegate?
    var titleTask:String!
    var descriptionTask:String!
    var priorityTask:String!
    var indexTask:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleTask
        descriptionLabel.text = descriptionTask
        priorityLabel.text = priorityTask
        // Do any additional setup after loading the view.
    }
    
    @IBAction func deleteTask(_ sender: Any){
        
        delegate?.deleteTaskDetailsViewController(didDeletedTask: indexTask)
        guard let _ = storyboard?.instantiateViewController(withIdentifier: "ListTaskViewController") as? ListTasksTableViewController else { return }
        print(indexTask)
        dismiss(animated: true)
    }
    @IBAction func closeDetails(_ sender: Any){
        dismiss(animated: true)
    }
    

    
    


}
