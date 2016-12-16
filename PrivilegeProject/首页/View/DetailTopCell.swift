//
//  DetailTopCell.swift
//  PrivilegeProject
//
//  Created by 孙云飞 on 2016/12/16.
//  Copyright © 2016年 孙云飞. All rights reserved.
//

import UIKit

class DetailTopCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var active: UILabel!
    @IBOutlet weak var des: UILabel!
    //数据
    var showModel:ShowModel!{
    
        didSet{
        
            //ui更新
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
    
    func p_updateUI(){
    
        icon.image = UIImage.init(named: showModel.icon!)
        name.text = showModel.name
        price.text = showModel.price
        active.text = showModel.active
        des.text = showModel.des
        //时间
        let dateFor = DateFormatter.init()
        dateFor.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let str = dateFor.string(from: Date())
        time.text = "截止时间" + str
    }
}
