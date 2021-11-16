//
//  AddItemTableViewController.swift
//  try
//
//  Created by Hamad Wasmi on 05/03/1443 AH.
//

import UIKit

class AddItemTableViewController: UITableViewController {

    weak var delegate:AddItemTableViewControllerDelegate?
    var item: String?
    var indexPath: NSIndexPath?
    
    @IBOutlet weak var itemTextField: UITextField!
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonPressed(by: self)
        
    }
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        let text = itemTextField.text!
        delegate?.saveItems(by:self, editedSomeThingwith:text ,atIndexPath: indexPath)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTextField.text=item
    }
}
