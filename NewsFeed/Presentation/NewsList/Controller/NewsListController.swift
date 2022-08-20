//
// ViewController.swift
// NewsFeed

//  Created by Emmanuel Omokagbo on 20/08/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.


import UIKit

class NewsListController: BaseViewController {
    
    private lazy var newsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(red: 0.110, green: 0.106, blue: 0.125, alpha: 1)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.isPagingEnabled = true
        cv.dataSource = self
        cv.delegate = self
        cv.register(NewsListCollectionViewCell.self, forCellWithReuseIdentifier: NewsListCollectionViewCell.reuseIdentifier)
        return cv
    }()
    
    private lazy var navBarNewsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        let boldTextAttributes: [NSAttributedString.Key: Any] = [
            .font : UIFont.boldSystemFont(ofSize: 14)
        ]
        let boldAttributedString = NSMutableAttributedString(string: "NewsFeed", attributes: boldTextAttributes)
        label.attributedText = boldAttributedString
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var topNewsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Top News"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var newsListViewModel: INewsListViewModel?
    weak var newsListCoordinator: NewsListCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.137, green: 0.137, blue: 0.165, alpha: 1)
        newsListViewModel?.fetchNews()
    }
    
    override func configureViews() {
        super.configureViews()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navBarNewsLabel)
        view.addSubviews(topNewsLabel, newsCollectionView)
        constrainViews()
    }
    
    fileprivate func constrainViews() {
        topNewsLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: newsCollectionView.topAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, margin: .init(top: 10, left: 0, bottom: 10, right: 0))
        newsCollectionView.anchor(top: topNewsLabel.safeAreaLayoutGuide.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, margin: .init(top: 10, left: 0, bottom: 0, right: 0))
    }
    
}

extension NewsListController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsListCollectionViewCell.reuseIdentifier, for: indexPath) as? NewsListCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
}

extension NewsListController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension NewsListController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 300)
    }
}
