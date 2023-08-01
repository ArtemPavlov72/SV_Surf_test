//
//  SelfConfiguringCell.swift
//  SV_Surf_test
//
//  Created by Артем Павлов on 01.08.2023.
//

import Foundation

protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure(with data: Any)
}
