//
//  HomeTableViewCell.swift
//  PrivilegeProject
//
//  Created by 孙云飞 on 2016/12/16.
//  Copyright © 2016年 孙云飞. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var name: UILabel!
    //数据接收
    var homeModel:HomeModel!{
        
        didSet{
            
            //更新ui
            self.p_updateUI()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        //图片自适应大小
        icon.contentMode = .scaleAspectFit
        //裁剪一点
        icon.layer.cornerRadius = 2
        icon.layer.masksToBounds = true
    }
    
    func p_updateUI(){
    
        icon.image = UIImage.init(named: homeModel.icon!)
        name.text = homeModel.name
    }
    
}
