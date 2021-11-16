//
//  AddItemTableViewControllerDelegate.swift
//  try
//
//  Created by Hamad Wasmi on 06/03/1443 AH.
//

import Foundation

protocol AddItemTableViewControllerDelegate: AnyObject{
    
    func saveItems( by controller:AddItemTableViewController, editedSomeThingwith text:String , atIndexPath: NSIndexPath?)
    func cancelButtonPressed(by controller: AddItemTableViewController)
}
