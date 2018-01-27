//
//  UIColor.swift
//  MyFirstNote
//
//  Created by Izabela on 27/01/2018.
//  Copyright © 2018 AmaWay. All rights reserved.
//

import UIKit

extension UIColor {
  
  //Example: #ecf0f1Add  Replace # with 0x
  static let clouds = UIColor(hex: 0xecf0f1)
  static let silver = UIColor(hex: 0xbdc3c7)
  static let concrete = UIColor(hex: 0x95a5a6)
  static let alizarin = UIColor(hex: 0xE74C3C)
  static let pomegranate = UIColor(hex: 0xC0392B)
  static let peterRiver = UIColor(hex: 0x3498db)
  static let belizeHole = UIColor(hex: 0x2980b9)
  static let wetAsphalt = UIColor(hex: 0x34495e)
  static let midnightBlue = UIColor(hex: 0x2c3e50)
  static let sunFlower = UIColor(hex: 0xf1c40f)
  static let orange = UIColor(hex: 0xf39c12)
  static let carrot = UIColor(hex: 0xe67e22)
  static let pumpkin = UIColor(hex: 0xd35400)
  static let turquoise = UIColor(hex: 0x1abc9c)
  static let greenSea = UIColor(hex: 0x16a085)
  static let emerland = UIColor(hex: 0x2ecc71)
  static let nephritis = UIColor(hex: 0x27ae60)
  static let blueSet4 = UIColor(hex: 0x00204a)
  static let blueSet3 = UIColor(hex: 0x005792)
  static let blueSet2 = UIColor(hex: 0x00bbf0)
  static let blueSet1 = UIColor(hex: 0xd9faff)
  static let pinkSet1 = UIColor(hex: 0x355c7d)
  static let pinkSet2 = UIColor(hex: 0xc06c84)
  static let pinkSet3 = UIColor(hex: 0x6c5b7b)
  static let pinkSet4 = UIColor(hex: 0x355c7d)
  static let sunSet4 = UIColor(hex: 0x97124b)
  static let sunSet3 = UIColor(hex: 0xdc4444)
  static let sunSet2 = UIColor(hex: 0xf5a855)
  static let sunSet1 = UIColor(hex: 0xf4e557)
  static let greenSet4 = UIColor(hex: 0x466551)
  static let greenSet3 = UIColor(hex: 0x368c72)
  static let greenSet2 = UIColor(hex: 0x7ecba1)
  static let greenSet1 = UIColor(hex: 0xe7eed2)
  
  convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
    
    self.init(
      red:CGFloat(red) / 255.0,
      green:CGFloat(green) / 255.0,
      blue:CGFloat(blue) / 255.0,
      alpha: a
    )
  }
  
  convenience init(hex: Int,a: CGFloat = 1.0) {
    self.init(
      red: (hex >> 16) & 0xFF,
      green:(hex >> 8) & 0xFF,
      blue: hex & 0xFF,
      a: a
    )
  }
  
}

