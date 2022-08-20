//
// NewsListCollectionViewCell.swift
// NewsFeed

//  Created by Emmanuel Omokagbo on 20/08/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.
	

import UIKit

final class NewsListCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemGreen
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func configureViews() {
        
    }
    
    func setup(with model: Article) {
        
    }
    
}
