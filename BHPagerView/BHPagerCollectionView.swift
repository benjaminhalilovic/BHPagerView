//
//  BHPagerCollectionView.swift
//  BHPagerView
//
//  Created by mac on 18/05/17.
//  Copyright © 2017 Benjamin Halilovic. All rights reserved.
//

import UIKit

class BHPagerCollectionView: UICollectionView {

    override var contentInset: UIEdgeInsets {
        set {
            super.contentInset = .zero
            if (newValue.top > 0) {
                let contentOffset = CGPoint(x:self.contentOffset.x, y:self.contentOffset.y+newValue.top);
                self.contentOffset = contentOffset
            }
        }
        get {
            return super.contentInset
        }
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    fileprivate func commonInit() {
        self.contentInset = .zero
        self.decelerationRate = UIScrollViewDecelerationRateFast
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        #if !os(tvOS)
            self.scrollsToTop = false
            self.isPagingEnabled = false
        #endif
    }


}
