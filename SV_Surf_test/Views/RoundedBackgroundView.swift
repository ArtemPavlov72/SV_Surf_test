//
//  RoundedBackgroundView.swift
//  SV_Surf_test
//
//  Created by Артем Павлов on 02.08.2023.
//

import UIKit

class RoundedBackgroundView: UICollectionReusableView {

  static let reuseId: String = "backgroundView"

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
