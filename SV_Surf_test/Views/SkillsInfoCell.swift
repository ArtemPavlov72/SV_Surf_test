//
//  SkillsInfoCell.swift
//  SV_Surf_test
//
//  Created by Артем Павлов on 01.08.2023.
//

import UIKit

class SkillsInfoCell: UICollectionViewCell, SelfConfiguringCell {

  //MARK: - Static Properties
  
  static let reuseId: String = "skillsInfoCell"

  //MARK: - Private Properties

  private var skillLabel = UILabel()

  private var backgroundColorView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemGray5
    view.layer.cornerRadius = 15
    return view
  }()

  //MARK: - Init

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupElements(skillLabel, backgroundColorView)
    setupSubViews(backgroundColorView,skillLabel)
    setupConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  //MARK: - Confirure cell

  func configure(with data: Any) {
    guard let skillData = data as? ProfileSkill else { return }
    skillLabel.text = skillData.nameOfSkill
  }

  // MARK: - Setup Constraints

  private func setupConstraints() {
    NSLayoutConstraint.activate([
      backgroundColorView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
      backgroundColorView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      backgroundColorView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      backgroundColorView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

      skillLabel.topAnchor.constraint(equalTo: backgroundColorView.topAnchor, constant: 12),
      skillLabel.leadingAnchor.constraint(equalTo: backgroundColorView.leadingAnchor, constant: 24),
      skillLabel.trailingAnchor.constraint(equalTo: backgroundColorView.trailingAnchor, constant: -24),
      skillLabel.bottomAnchor.constraint(equalTo: backgroundColorView.bottomAnchor, constant: -12),
    ])
  }
}
