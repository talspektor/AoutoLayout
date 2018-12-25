//
//  SwipingController.swift
//  AoutoLayout
//
//  Created by user140592 on 12/24/18.
//  Copyright © 2018 talspektor. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let pages = [
        Page(imageName: "btn_not_pressed", headerText: "Join us today in our fun and games!", bodyText: "Are you ready for loads and loads of fun? Dont wait any longer"),
        Page(imageName: "btn_pressed", headerText: "Subcsribe and get coupons on our daily events!", bodyText: "Are you ready for loads and loads of fun? Dont wait any longer"),
        Page(imageName: "btn_not_pressed", headerText: "Join usvarday in our fun and games!", bodyText: "Are you ready for loads and loads of fun? Dont wait any longer"),
        Page(imageName: "btn_pressed", headerText: "Subcsribe and get coupons on our daily events!" ,bodyText: "Are you ready for loads and loads of fun? Dont wait any longer"),
        Page(imageName: "btn_not_pressed", headerText: "Join usvarday in our fun and games!", bodyText: "Are you ready for loads and loads of fun? Dont wait any longer"),
        Page(imageName: "btn_pressed", headerText: "Subcsribe and get coupons on our daily events!" ,bodyText: "Are you ready for loads and loads of fun? Dont wait any longer")
    ]
    
    private let previosButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)

        return button
    }()
    
    @objc private func handlePrev () {
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.pinkColor, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleNext () {
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
     lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .pinkColor
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()
    
    fileprivate func setupBottomControls(){
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previosButton,pageControl,nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        view.addSubview(bottomControlsStackView)
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .white
        setupBottomControls()
    }
}
