//
//  NoteDetails.swift
//  MyFirstNote
//
//  Created by Izabela on 27/01/2018.
//  Copyright © 2018 AmaWay. All rights reserved.
//

import UIKit

class NoteDetails: UIViewController {

  var selectedNote : Note? {
    didSet {
      //loadNotes()
    }
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
