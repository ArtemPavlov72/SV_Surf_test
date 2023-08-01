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
      profileMainInformation: Profile.ProfileMainInformation(
        image: "Test",
        name: "Артем",
        surname: "Павлов",
        patronymic: "Александрович",
        position: "Junior IOS- разработчик, опыт 2 года",
        location: "Тюмень"
      ),
      about: Profile.AboutProfile(
        text: "Лучший разработчик"
      ),
      skills: [
        Profile.ProfileSkill(nameOfSkill: "MVVM"),
        Profile.ProfileSkill(nameOfSkill: "UIKiT"),
        Profile.ProfileSkill(nameOfSkill: "VIPER")
      ]
    )
    return profile
  }
}
