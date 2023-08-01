//
//  DataManager.swift
//  SV_Surf_test
//
//  Created by Артем Павлов on 01.08.2023.
//

import UIKit

class DataManager {
  static let shared = DataManager()

  private init() {}

  func createMockData() -> Profile {
    let profile = Profile(
      image: "Artem",
      name: "Павлов Артем Александрович",
      position: "Junior IOS- разработчик, опыт 2 года",
      location: "Тюмень",
      about: Profile.About(
        text: "Лучший разработчик"
      ),
      skills: [
        Profile.Skill(nameOfSkill: "MVVM"),
        Profile.Skill(nameOfSkill: "UIKiT"),
        Profile.Skill(nameOfSkill: "VIPER")
      ]
    )
    return profile
  }
}
