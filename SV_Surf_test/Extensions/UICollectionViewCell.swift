//
//  UICollectionViewCell.swift
//  SV_Surf_test
//
//  Created by Артем Павлов on 01.08.2023.
//

import UIKit

extension UICollectionViewCell {
    func setupElements(_ subViews: UIView...) {
        subViews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    func setupSubViews(_ subViews: UIView...) {
        subViews.forEach { self.addSubview($0)
        }
    }
}
