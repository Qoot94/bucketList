//
//  ViewController.swift
//  try
//
//  Created by Hamad Wasmi on 05/03/1443 AH.
//

import UIKit

class BucketListViewController: UITableViewController, AddItemTableViewControllerDelegate {
    
    var items:[String]=["Go parashueting","Visit tsushima island","Be my own BOSS", "Solo adventure to a tropical island", "Move on"]
    
    /**view has been loaded**/
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource=self
        // Do any additional setup after loading the view.
    }
    /****/
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
        
    }
    
    //swipe to delet
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }
    //listen for user interaction in cell acc
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "editItemSegue", sender: indexPath)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "addToListSegue"{
            let navigationController = segue.destination as! UINavigationController
            let addItemTableViewController = navigationController.topViewController as! AddItemTableViewController
            addItemTableViewController.delegate = self
        }
        else if segue.identifier == "editItemSegue"{
            let navigationController = segue.destination as! UINavigationController
            let addItemTableViewController = navigationController.topViewController as! AddItemTableViewController
            addItemTableViewController.delegate = self
            
            let indexPath = sender as! NSIndexPath
            let item = items[indexPath.row]
            addItemTableViewController.item = item
            addItemTableViewController.indexPath = indexPath
        }

    }

    func cancelButtonPressed(by controller: AddItemTableViewController) {
        dismiss(animated: true, completion: nil)
    }
    func saveItems(by controller: AddItemTableViewController,editedSomeThingwith text:String, atIndexPath: NSIndexPath?) {
        
        if let location = controller.indexPath{
            items[location.row]=text
            print(text,items)
        } else{
            items.append(text)
        }
        
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
}

