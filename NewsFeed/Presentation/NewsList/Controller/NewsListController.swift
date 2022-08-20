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
        cv.backgroundColor = .black
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        cv.isPagingEnabled = true
        cv.dataSource = self
        cv.delegate = self
        cv.register(NewsListCollectionViewCell.self, forCellWithReuseIdentifier: NewsListCollectionViewCell.reuseIdentifier)
        return cv
    }()
    
    
    var newsListViewModel: INewsListViewModel?
    weak var newsListCoordinator: NewsListCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        newsListViewModel?.fetchNews()
    }
    
    override func configureViews() {
        super.configureViews()
        view.addSubviews(newsCollectionView)
        constrainViews()
    }
    
    fileprivate func constrainViews() {
        newsCollectionView.fillUpSuperview(margin: .init(top: 0, left: 5, bottom: 0, right: 5))
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
