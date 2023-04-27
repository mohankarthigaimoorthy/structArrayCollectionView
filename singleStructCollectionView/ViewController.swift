//
//  ViewController.swift
//  singleStructCollectionView
//
//  Created by Mohan K on 18/02/23.
//

import UIKit

protocol TextDelegate {
    func show(_ input: Task?)
}

class ViewController: UIViewController {
    
    var allTasks = [Task]()
    
    var delegate : TextDelegate!
    
    @IBOutlet weak var entryText: UITextField!
    
    override func viewDidLoad() {
        print(allTasks)
    }
    
    @IBAction func updateBtn(_ sender: Any) {
        
        if let index = allTasks.firstIndex(where: {$0.id == 1}) {
            allTasks[index].colour = .cyan
            allTasks[index].taskName = "redo"
            
            self.delegate?.show(allTasks[index])
            
        }
    }
}
