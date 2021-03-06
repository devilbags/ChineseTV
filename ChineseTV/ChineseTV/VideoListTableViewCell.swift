//
//  VideoListTableViewCell.swift
//  ChineseTV
//
//  Created by Qiaowei Liu on 11/12/15.
//  Copyright © 2015 Qiaowei Liu. All rights reserved.
//

import UIKit
import PureLayout
import GoogleMobileAds

class VideoListTableViewCell: UITableViewCell {
    
    var didSetupConstraints = false
    var thumbnailImageView:UIImageView = UIImageView.newAutoLayoutView()
    var videoTitle:UILabel = UILabel.newAutoLayoutView()
    
    let imageWidth:CGFloat = UIScreen.mainScreen().bounds.width / 3.5
    let imageHeight:CGFloat = (UIScreen.mainScreen().bounds.width / 3.5) * 0.55

    override init(style: UITableViewCellStyle, reuseIdentifier: String!)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    func setupViews() {
        
        thumbnailImageView.backgroundColor = UIColor.clearColor()
        thumbnailImageView.layer.cornerRadius = 5
        thumbnailImageView.contentMode = .ScaleAspectFill
        thumbnailImageView.clipsToBounds = true
        
        videoTitle.lineBreakMode = .ByTruncatingTail
        videoTitle.numberOfLines = 2
        videoTitle.textAlignment = .Left
        videoTitle.textColor = UIColor.whiteColor()
        videoTitle.font = UIFont.systemFontOfSize(12)
        videoTitle.sizeToFit()
        
        contentView.backgroundColor = videoSubColor
        
        contentView.addSubview(thumbnailImageView)
        contentView.addSubview(videoTitle)
        
    }
    
    override func updateConstraints() {
        if !didSetupConstraints {
            
            thumbnailImageView.autoSetDimensionsToSize(CGSize(width: imageWidth, height: imageHeight))
            thumbnailImageView.autoAlignAxisToSuperviewAxis(.Horizontal)
            thumbnailImageView.autoPinEdgeToSuperviewEdge(.Left, withInset: 10)
            
            videoTitle.autoPinEdgeToSuperviewEdge(.Top, withInset: 5)
            videoTitle.autoPinEdge(.Left, toEdge: .Right, ofView: thumbnailImageView, withOffset: 10)
            videoTitle.autoPinEdgeToSuperviewEdge(.Right, withInset: 10)
//            videoTitle.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 10)
            
            didSetupConstraints = true
        }
        super.updateConstraints()
    }

}

class Video {
    var id: String
    var name: String
    var thumbnailUrl: String
    var shareImageUrl: String
    
    init(id: String, name: String, thumbnailUrl: String, shareImageUrl: String) {
        self.id = id
        self.name = name
        self.thumbnailUrl = thumbnailUrl
        self.shareImageUrl = shareImageUrl
    }
}

class VideoAdListTableViewCell: UITableViewCell {
    
    var didSetupConstraints = false
    var thumbnailImageView:UIImageView = UIImageView.newAutoLayoutView()
    var videoTitle:UILabel = UILabel.newAutoLayoutView()
    
    let bannerView = GADBannerView.init(adSize: kGADAdSizeSmartBannerPortrait)
    
    let imageWidth:CGFloat = UIScreen.mainScreen().bounds.width / 3.5
    let imageHeight:CGFloat = (UIScreen.mainScreen().bounds.width / 3.5) * 0.55
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    func setupViews() {
        
        thumbnailImageView.backgroundColor = UIColor.clearColor()
        thumbnailImageView.layer.cornerRadius = 5
        thumbnailImageView.contentMode = .ScaleAspectFill
        thumbnailImageView.clipsToBounds = true
        
        videoTitle.lineBreakMode = .ByTruncatingTail
        videoTitle.numberOfLines = 2
        videoTitle.textAlignment = .Left
        videoTitle.textColor = UIColor.whiteColor()
        videoTitle.font = UIFont.systemFontOfSize(12)
        videoTitle.sizeToFit()
        
        contentView.backgroundColor = videoSubColor
        
        contentView.addSubview(thumbnailImageView)
        contentView.addSubview(videoTitle)
        contentView.addSubview(bannerView)
        
    }
    
    override func updateConstraints() {
        if !didSetupConstraints {
            
            thumbnailImageView.autoSetDimensionsToSize(CGSize(width: imageWidth, height: imageHeight))
            thumbnailImageView.autoPinEdgeToSuperviewEdge(.Top, withInset: 5)
            thumbnailImageView.autoPinEdgeToSuperviewEdge(.Left, withInset: 10)
            
            videoTitle.autoPinEdgeToSuperviewEdge(.Top, withInset: 5)
            videoTitle.autoPinEdge(.Left, toEdge: .Right, ofView: thumbnailImageView, withOffset: 10)
            videoTitle.autoPinEdgeToSuperviewEdge(.Right, withInset: 10)
            
            bannerView.autoPinEdgeToSuperviewEdge(.Leading)
            bannerView.autoPinEdgeToSuperviewEdge(.Trailing)
            bannerView.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 5)
            
            didSetupConstraints = true
        }
        super.updateConstraints()
    }
    
}
