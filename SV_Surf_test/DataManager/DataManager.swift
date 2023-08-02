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

  func createMockProfileData() -> Profile {
    let profile = Profile(
      profileMainInformation: ProfileMainInformation(
        image: "Artem",
        name: "Артем",
        surname: "Павлов",
        patronymic: "Александрович",
        position: "Junior IOS- разработчик, опыт 2 года",
        location: "Тюмень"
      ),
      about: AboutProfile(
        text: "Лучший разработчик"
      ),
      skills: [
        ProfileSkill(nameOfSkill: "MVVM"),
        ProfileSkill(nameOfSkill: "UIKiT"),
        ProfileSkill(nameOfSkill: "VIPER"),
        ProfileSkill(nameOfSkill: "MVC"),
        ProfileSkill(nameOfSkill: "URLSession"),
        ProfileSkill(nameOfSkill: "CoreData")
      ]
    )
    return profile
  }
}
