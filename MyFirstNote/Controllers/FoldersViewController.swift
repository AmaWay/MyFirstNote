//
//  FoldersViewController.swift
//  MyFirstNote
//
//  Created by Izabela on 27/01/2018.
//  Copyright © 2018 AmaWay. All rights reserved.
//

import UIKit
import CoreData


class FoldersViewController: UITableViewController {

  var folders = [Folder]()
  
  let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    
  }
  
  // MARK: - Manage Data Source
  
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return folders.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "FolderCell", for: indexPath)
    
    let folder = folders[indexPath.row]
    
    cell.textLabel?.text = folder.name
    
    return cell
  }
  
  // MARK: - Manage Delegate
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    performSegue(withIdentifier: "GoToNotes", sender: self)
    
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let destnationVC = segue.destination as! NotesViewCotroller
    if let indexPath = tableView.indexPathForSelectedRow {
      destnationVC.selectedFolder = folders[indexPath.row]
    }
  }
  
  // MARK: - Add Folder
  
  
  @IBAction func addFolderButton(_ sender: UIBarButtonItem) {
    
    var newFolderName = UITextField()
    
    let alert = UIAlertController(title: "Add New Folder", message: "", preferredStyle: .alert)
    
    let action = UIAlertAction(title: "Add Folder", style: .default){(action) in
      
      let newFolder = Folder(context: self.context)
      newFolder.name = newFolderName.text!
      self.folders.append(newFolder)
      self.saveFolder()
      
    }
    
    alert.addTextField { (alertTextField) in
      alertTextField.placeholder = "Create new folder"
      newFolderName = alertTextField
    }
    alert.addAction(action)
    present(alert, animated: true , completion: nil)
    
  }
  
  
  // MARK: - Manage Data Manipulation
  
  func saveFolder() {
    
    
    do {
      try context.save()
    }
    catch {
      print("Error saving context, \(error)")
    }
    
    tableView.reloadData()
  }
  
  
  func loadFolders(with request: NSFetchRequest<Folder> = Folder.fetchRequest())  {
    
    
    do {
      folders = try context.fetch(request)
    }        catch {
      print("Error fetching data from context, \(error)")
    }
    
    tableView.reloadData()

  
  }

    // MARK: - Manage Global Search
  
  
}
