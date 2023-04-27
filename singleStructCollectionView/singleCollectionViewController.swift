//
//  singleCollectionViewController.swift
//  singleStructCollectionView
//
//  Created by Mohan K on 18/02/23.
//

import UIKit

struct Task 
{
           var id : Int
           var taskName : String
           var colour : UIColor
           var status : Int
           var priority : Int
}

class mycell: UICollectionViewCell {
    @IBOutlet weak var textone: UILabel!
    @IBOutlet weak var texttwo: UILabel!
    @IBOutlet weak var textthree: UILabel!
    var allTasks  = [Task]()
}

class singleCollectionViewController: UICollectionViewController {
    
    

    @IBOutlet var listCollection: UICollectionView!
    
    var allTasks = [Task(id: 1, taskName: "do", colour: .blue, status: 1, priority: 1),
                    Task(id: 2, taskName: "done", colour: .gray, status: 2, priority: 2),
                    Task(id: 3, taskName: "does", colour: .brown, status: 3, priority: 3)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        DispatchQueue.main.async {
            self.listCollection.reloadData()
        }
        
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
             return allTasks.count
         }
         
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
             let cell = listCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! mycell
             cell.textone.text = allTasks[indexPath.item].taskName
             cell.texttwo.text = "\(allTasks[indexPath.item].priority)"
             cell.backgroundColor = allTasks[indexPath.item].colour
             cell.textthree.text = "\(allTasks[indexPath.item].status)"
             return cell
         }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        self.performSegue(withIdentifier: "single", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "single"
            {
                let viewController = segue.destination as! ViewController
                viewController.delegate = self
                viewController.allTasks = allTasks
            }
        
        }

    
}

extension singleCollectionViewController: TextDelegate {
    func show(_ input: Task?) {
        guard let task = input else {return}

        if let index = allTasks.firstIndex(where: {$0.id == task.id}) {
            allTasks[index] = task

            DispatchQueue.main.async {
                self.listCollection.reloadData()
            }
        }
    }

}
