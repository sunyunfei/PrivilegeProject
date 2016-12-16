//
//  ShowCell.swift
//  PrivilegeProject
//
//  Created by 孙云飞 on 2016/12/16.
//  Copyright © 2016年 孙云飞. All rights reserved.
//

import UIKit

class ShowCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!//图片
    @IBOutlet weak var name: UILabel!//标题
    @IBOutlet weak var active: UILabel!//折扣
    @IBOutlet weak var price: UILabel!//价钱
    @IBOutlet weak var time: UILabel!//截止时间
    var showModel:ShowModel!{
    
        didSet{
        
            //刷新ui数据
            self.p_updateUI()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //数据加载
    func p_updateUI(){
    
        icon.image = UIImage.init(named: showModel.icon!)
        name.text = showModel.name
        active.text = showModel.active
        price.text = showModel.price
        //date转string
        let dateFor = DateFormatter()
        dateFor.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateStr = dateFor.string(from: Date())
        time.text = dateStr
    }
    
}
