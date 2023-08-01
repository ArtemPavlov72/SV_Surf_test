//
//  MainViewController.swift
//  SV_Surf_test
//
//  Created by Артем Павлов on 01.08.2023.
//

import UIKit

class MainViewController: UIViewController {

  //MARK: - Public Properties
  private var profile: Profile?

  //MARK: - Life Cycles Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    loadProfileData()
  }

  //MARK: - Private Methods
  private func loadProfileData() {
    profile = DataManager.shared.createMockData()
  }

}

