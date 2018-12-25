//
//  PageCell.swift
//  AoutoLayout
//
//  Created by user140592 on 12/24/18.
//  Copyright © 2018 talspektor. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page : Page? {
        didSet {
            
            guard let unwrappedPage = page else {return}
            
            imageView.image = UIImage(named:  unwrappedPage.imageName)
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
            
            attributedText.append(NSAttributedString(string: "\n\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor : UIColor.gray]))
            
            discriptionTextView.attributedText = attributedText
            discriptionTextView.textAlignment = .center
        }
    }
    
    private let imageView :UIImageView = {
        let image = UIImageView(image: UIImage(named: "btn_not_pressed"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let discriptionTextView :UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string: "\n\n\nAre ouy ready for luds and loads of fun", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor : UIColor.gray]))
        
        textView.attributedText = attributedText
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    private func setupLayout(){
        let topImageContainerView = UIView()
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(topImageContainerView)
        topImageContainerView.addSubview(imageView)
        addSubview(discriptionTextView)
        NSLayoutConstraint.activate([
            topImageContainerView.topAnchor.constraint(equalTo: topAnchor),
            topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            imageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            imageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.6),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            
            discriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 20),
            discriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            discriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            discriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
            ])
    }
}
