//
//  ArticleTableViewCell.swift
//  NewsMVVM
//
//  Created by Ali Tanırlar on 12.04.2019.
//  Copyright © 2019 Ali Tanırlar. All rights reserved.
//

import Foundation
import UIKit

class ArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(_ articleViewModel: ArticleViewModel) {
        self.titleLabel.text = articleViewModel.title
        self.descriptionLabel.text = articleViewModel.description
    }
    
}
