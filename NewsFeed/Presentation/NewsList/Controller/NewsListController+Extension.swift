//
// NewsListController+Extension.swift
// NewsFeed

//  Created by Emmanuel Omokagbo on 8/21/22
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.


import UIKit

extension NewsListController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        newsListViewModel?.newsFeed.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsListCollectionViewCell.reuseIdentifier, for: indexPath) as? NewsListCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if let newsFeed = newsListViewModel?.newsFeed {
            cell.setup(with: newsFeed[indexPath.row])
        }
        
        return cell
    }
}

extension NewsListController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        guard let news = newsListViewModel?.newsFeed else { return }
        newsListCoordinator?.showNewsDetailsFor(news[indexPath.row])
    }
}

extension NewsListController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 300)
    }
}
