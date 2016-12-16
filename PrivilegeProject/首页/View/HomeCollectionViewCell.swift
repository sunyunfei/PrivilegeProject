//
//  HomeCollectionViewCell.swift
//  PrivilegeProject
//
//  Created by 孙云飞 on 2016/12/16.
//  Copyright © 2016年 孙云飞. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    //数据接收
    var homeModel:HomeModel!{
        
        didSet{
            
            //更新ui
            self.p_updateUI()
        }
    }
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        icon.contentMode = .scaleAspectFit
        //裁剪一点
        self.contentView.layer.cornerRadius = 2;
        self.contentView.layer.masksToBounds = true
        //阴影效果
        self.contentView.layer.borderWidth = 2
        self.contentView.layer.borderColor = UIColor.white.cgColor
        self.contentView.layer.shadowColor = UIColor.lightGray.cgColor
        self.contentView.layer.shadowOffset = CGSize.init(width: 2, height: 2)
        self.contentView.layer.shadowOpacity = 0.9
    }
    
    func p_updateUI(){
    
        icon.image = UIImage.init(named: homeModel.icon!)
        name.text = homeModel.name
    }

}
