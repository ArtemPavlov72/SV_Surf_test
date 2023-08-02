//
//  Profile.swift
//  SV_Surf_test
//
//  Created by Артем Павлов on 01.08.2023.
//

import Foundation

struct Profile: Hashable {
  let profileMainInformation: ProfileMainInformation
  let about: AboutProfile
  let skills: [ProfileSkill]
}

struct ProfileMainInformation: Hashable {
  let image: String
  let name: String
  let surname: String
  let patronymic: String
  let position: String
  let location: String
}

struct AboutProfile: Hashable {
  let text: String
}

struct ProfileSkill: Hashable {
  let nameOfSkill: String
}
