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
    
    private lazy var refreshControl: UIRefreshControl = {
        let cntrl = UIRefreshControl()
        cntrl.tintColor = .systemBlue
        return cntrl
    }()
    
    var newsListViewModel: INewsListViewModel?
    weak var newsListCoordinator: NewsListCoordinator?
    
    override var views: [UIView] { [newsCollectionView] }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.137, green: 0.137, blue: 0.165, alpha: 1)
        newsListViewModel?.monitorNetwork()
    }
    
    override func configureViews() {
        super.configureViews()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navBarNewsLabel)
        view.addSubviews(topNewsLabel, newsCollectionView)
        constrainViews()
        newsCollectionView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        showLoading()
    }
    
    fileprivate func constrainViews() {
        topNewsLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: newsCollectionView.topAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, margin: .init(top: 10, left: 0, bottom: 10, right: 0))
        newsCollectionView.anchor(top: topNewsLabel.safeAreaLayoutGuide.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, margin: .init(top: 10, left: 0, bottom: 0, right: 0))
    }
    
    @objc fileprivate func pullToRefresh() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.newsListViewModel?.monitorNetwork()
            self.refreshControl.endRefreshing()
        }
    }
    
    override func setChildViewControllerObservers() {
        super.setChildViewControllerObservers()
        showError()
        updateCollectionView()
    }
    
    fileprivate func showError() {
        newsListViewModel?.showError = { [weak self] error in
            guard let self = self else { return }
            self.hideLoading()
            self.showAlert(title: "Error", message: error.localizedDescription, type: .error, action: nil)
            Logger.printIfDebug(data: error.localizedDescription, logType: .error)
        }
    }
    
    fileprivate func updateCollectionView() {
        newsListViewModel?.showNewsFeed = { [weak self] in
            guard let self = self else { return }
            self.hideLoading()
            DispatchQueue.main.async {
                self.newsCollectionView.reloadData()
            }
        }
    }
    
}
