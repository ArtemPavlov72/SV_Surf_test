//
//  Profile.swift
//  SV_Surf_test
//
//  Created by Артем Павлов on 01.08.2023.
//

import Foundation

struct Profile: Hashable {
  let image: String
  let name: String
  let position: String
  let location: String
  let about: About
  let skills: [Skill]
  
  struct About: Hashable {
    let text: String
  }
  
  struct Skill: Hashable {
    let nameOfSkill: String
  }
}


