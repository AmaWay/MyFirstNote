//
//  ItemViewCotroller.swift
//  MyFirstNote
//
//  Created by Izabela on 27/01/2018.
//  Copyright © 2018 AmaWay. All rights reserved.
//

import UIKit
import CoreData

class NotesViewCotroller: UITableViewController {

  var selectedFolder : Folder? {
    didSet {
      loadNotes()
    }
               }
  
  var notes = [Note]()
  
  let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    
  }
  
  // MARK: - Manage Data Source
  
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return notes.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
    
    let note = notes[indexPath.row]
    
    cell.textLabel?.text = note.title
    
    return cell
  }
  
  // MARK: - Manage Delegate
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    performSegue(withIdentifier: "GoToNoteDetails", sender: self)
    
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let destnationVC = segue.destination as! NoteDetails
    if let indexPath = tableView.indexPathForSelectedRow {
      destnationVC.selectedNote = notes[indexPath.row]
    }
  }
  
  // MARK: - Add Folder
  
  
  @IBAction func addNewButton(_ sender: UIBarButtonItem) {
  
    var newNoteTitle = UITextField()
    
    let alert = UIAlertController(title: "Add New Note", message: "", preferredStyle: .alert)
    
    let action = UIAlertAction(title: "Add Note", style: .default){(action) in
      
      let newNote = Note(context: self.context)
      newNote.title = newNoteTitle.text!
      self.notes.append(newNote)
      self.saveNote()
      
    }
    
    alert.addTextField { (alertTextField) in
      alertTextField.placeholder = "Create new note"
      newNoteTitle = alertTextField
    }
    alert.addAction(action)
    present(alert, animated: true , completion: nil)
    
  }

  
  
  // MARK: - Manage Data Manipulation
  
  func saveNote() {
    
    
    do {
      try context.save()
    }
    catch {
      print("Error saving context, \(error)")
    }
    
    tableView.reloadData()
  }
  
  
  func loadNotes(with request: NSFetchRequest<Note> = Note.fetchRequest())  {
    
    do {
      notes = try context.fetch(request)
    }       catch {
      print("Error fetching data from context, \(error)")
    }
    
    tableView.reloadData()
    
    
  }
  
  // MARK: - Manage Local Search
}
