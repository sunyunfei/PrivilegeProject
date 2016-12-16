//
//  DetailFooterCell.swift
//  PrivilegeProject
//
//  Created by 孙云飞 on 2016/12/16.
//  Copyright © 2016年 孙云飞. All rights reserved.
//

import UIKit

class DetailFooterCell: UITableViewCell {

    //三个ui
    var topLabel:UILabel?
    var centerImage:UIImageView?
    var footLabel:UILabel?
    //数据
    var showModel:ShowModel!{
    
        didSet{
        
            //数据加载
            self.p_updateUI()
        }
    }
    //加载ui
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //加载ui
        
        topLabel = UILabel.init()
        topLabel?.font = UIFont.systemFont(ofSize: 15)
        topLabel?.numberOfLines = 0
        self.contentView.addSubview(topLabel!)
        
        centerImage = UIImageView.init()
        centerImage?.contentMode = .scaleAspectFit
        self.contentView.addSubview(centerImage!)
        
        footLabel = UILabel.init()
        footLabel?.font = UIFont.systemFont(ofSize: 15)
        footLabel?.numberOfLines = 0
        self.contentView.addSubview(footLabel!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    //数据加载
    func p_updateUI(){
    
        //获取顶部字段的高度
        topLabel?.text = showModel.des2
        let size = CGSize.init(width: self.frame.size.width - 10, height: CGFloat(MAXFLOAT))
        let dic = [NSFontAttributeName:UIFont.systemFont(ofSize: 15)]
        let sizeTop = showModel.des2?.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic, context: nil)
        topLabel?.frame = CGRect.init(x: 5, y: 5, width: (sizeTop?.width)!, height: (sizeTop?.height)!)
        
        //得出图片的frame
        centerImage?.image = UIImage.init(named: showModel.image!)
        centerImage?.frame = CGRect.init(x: 5, y: 5 + (sizeTop?.height)!, width: self.frame.size.width - 10, height:200)
        
        //底部字段高度
        footLabel?.text = showModel.des3
        let size2 = CGSize.init(width: self.frame.size.width - 10, height: CGFloat(MAXFLOAT))
        let dic2 = [NSFontAttributeName:UIFont.systemFont(ofSize: 15)]
        let sizeFoot = showModel.des3?.boundingRect(with: size2, options: .usesLineFragmentOrigin, attributes: dic2, context: nil)
        footLabel?.frame = CGRect.init(x: 5, y: (centerImage?.frame.size.height)! + (centerImage?.frame.origin.y)! + 5, width: (sizeFoot?.width)!, height: (sizeFoot?.height)!)
        
    }
    
    //得到单元格高度
    class func cellReturnHeightForModel(model:ShowModel) ->CGFloat{
    
        let size = CGSize.init(width: UIScreen.main.bounds.size.width - 10, height: CGFloat(MAXFLOAT))
        let dic = [NSFontAttributeName:UIFont.systemFont(ofSize: 15)]
        let sizeTop = model.des2?.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic, context: nil)
        
        let dic2 = [NSFontAttributeName:UIFont.systemFont(ofSize: 15)]
        let sizeFoot = model.des3?.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic2, context: nil)
        
        let allHeight:CGFloat = 5 + (sizeTop?.height)! + 5 + 200 + (sizeFoot?.height)! + 5
        return allHeight;
    }
}
