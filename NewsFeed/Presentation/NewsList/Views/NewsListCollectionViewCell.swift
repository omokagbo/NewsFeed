//
// NewsListCollectionViewCell.swift
// NewsFeed

//  Created by Emmanuel Omokagbo on 20/08/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.


import UIKit

final class NewsListCollectionViewCell: UICollectionViewCell {
    
    fileprivate lazy var newsImageContainerView: UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.layer.cornerRadius = 10
        vw.clipsToBounds = true
        vw.backgroundColor = .black
        return vw
    }()
    
    fileprivate lazy var newsImage: CachedImageView = {
        let imv = CachedImageView()
        imv.translatesAutoresizingMaskIntoConstraints = false
        imv.backgroundColor = .systemGray3
        imv.contentMode = .scaleAspectFill
        return imv
    }()
    
    fileprivate lazy var newsHeadline: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = ""
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate lazy var newsAuthor: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "Emmanuel Omokagbo"
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .black
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    fileprivate func configureViews() {
        contentView.addSubviews(newsImageContainerView, newsHeadline, newsAuthor)
        newsImageContainerView.addSubviews(newsImage)
        newsImageContainerView.fillUpSuperview(margin: .init(top: 0, left: 5, bottom: 0, right: 5))
        newsImage.fillUpSuperview()
        newsHeadline.anchor(leading: leadingAnchor, bottom: newsAuthor.topAnchor, trailing: trailingAnchor, margin: .init(top: 0, left: 10, bottom: 10, right: 10))
        newsAuthor.anchor(top: newsHeadline.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, margin: .init(top: 10, left: 10, bottom: 10, right: 10))
        contentView.sendSubviewToBack(newsImageContainerView)
    }
    
    func setup(with model: Article) {
        newsHeadline.text = model.title ?? ""
        newsAuthor.text = model.author ?? "Emmanuel Omokagbo"
        if let url = model.urlToImage {
            newsImage.fetchImage(with: url)
        }
    }
    
}
