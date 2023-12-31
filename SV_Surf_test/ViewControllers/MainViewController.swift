//
//  MainViewController.swift
//  SV_Surf_test
//
//  Created by Артем Павлов on 01.08.2023.
//

import UIKit

class MainViewController: UIViewController {

  //MARK: - Private Properties

  private var profile: Profile?
  private var dataSource: UICollectionViewDiffableDataSource<Section, AnyHashable>?
  private var collectionView: UICollectionView!

  //MARK: - Life Cycles Methods

  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavBar()
    loadProfileData()
    setupCollectionView()
    createDataSource()
  }

  //MARK: - Private Methods

  private func loadProfileData() {
    profile = DataManager.shared.createMockProfileData()
  }

  private func setupNavBar() {
    title = "Профиль"
    navigationItem.largeTitleDisplayMode = .never
  }

  private func setupCollectionView() {
    collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
    collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    view.addSubview(collectionView)
    collectionView.backgroundColor = .systemGray5
    collectionView.register(ProfileInfoCell.self, forCellWithReuseIdentifier: ProfileInfoCell.reuseId)
    collectionView.register(SkillsInfoCell.self, forCellWithReuseIdentifier: SkillsInfoCell.reuseId)
  }

  // MARK: - Manage the Data

  private func configure<T: SelfConfiguringCell>(_ cellType: T.Type, with data: AnyHashable, for indexPath: IndexPath) -> T {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseId, for: indexPath) as? T else {
      fatalError("Unable to dequeue \(cellType)")
    }
    cell.configure(with: data)
    return cell
  }

  private func createDataSource() {
    dataSource = UICollectionViewDiffableDataSource<Section, AnyHashable>(collectionView: collectionView) { [self]
      collectionView, indexPath, _ in

      let sections = Section.allCases[indexPath.section]

      switch sections {
      case .profile:
        return configure(ProfileInfoCell.self, with: profile?.profileMainInformation, for: indexPath)
      case .skills:
        let skills = profile?.skills[indexPath.row]
        return configure(SkillsInfoCell.self, with: skills, for: indexPath)
      }
    }
    dataSource?.apply(generateSnapshot(), animatingDifferences: true)
  }

  private func generateSnapshot() -> NSDiffableDataSourceSnapshot<Section, AnyHashable>  {
    var snapshot = NSDiffableDataSourceSnapshot<Section, AnyHashable>()

    snapshot.appendSections([Section.profile])
    snapshot.appendItems([profile?.profileMainInformation], toSection: .profile)

    snapshot.appendSections([Section.skills])
    snapshot.appendItems(profile?.skills ?? [], toSection: .skills)

    return snapshot
  }


  // MARK: - Setup Layout
  
  private func createCompositionalLayout() -> UICollectionViewLayout {
    let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
      let section = Section.allCases[sectionIndex]

      switch section {
      case .profile:
        return self.createProfileInfoSection()
      case .skills:
        return self.createSkillsInfoSection()
      }
    }

    let config = UICollectionViewCompositionalLayoutConfiguration()
    config.interSectionSpacing = 8
    layout.configuration = config
    layout.register(RoundedBackgroundView.self, forDecorationViewOfKind: RoundedBackgroundView.reuseId)

    return layout
  }

  private func createProfileInfoSection() -> NSCollectionLayoutSection {
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                          heightDimension: .fractionalHeight(1))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)

    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.45))
    let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

    let layoutSection = NSCollectionLayoutSection(group: group)
    layoutSection.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0)

    return layoutSection
  }
  
  private func createSkillsInfoSection() -> NSCollectionLayoutSection {
    let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(100),
                                          heightDimension: .fractionalHeight(1.0))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)

    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                           heightDimension: .estimated(56))
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                   subitems: [item])

    group.interItemSpacing = .fixed(12)
    
    let layoutSection = NSCollectionLayoutSection(group: group)
    layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 24, trailing: 16)

    layoutSection.decorationItems = [
      NSCollectionLayoutDecorationItem.background(elementKind: RoundedBackgroundView.reuseId)
    ]

    return layoutSection
  }
}

private extension MainViewController {
  enum Section: String, Hashable, CaseIterable {
    case profile
    case skills
    //    case aboutProfile
  }
}

