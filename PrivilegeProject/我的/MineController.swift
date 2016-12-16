//
//  MineController.swift
//  PrivilegeProject
//
//  Created by 孙云飞 on 2016/12/16.
//  Copyright © 2016年 孙云飞. All rights reserved.
//

import UIKit

class MineController: UITableViewController {

    @IBOutlet weak var icon: UIImageView!//头像
    override func viewDidLoad() {
        super.viewDidLoad()

        //头像裁剪圆角
        icon.layer.cornerRadius = icon.frame.size.width / 2;
        icon.layer.masksToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //点击每个cell的操作
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //抹去选中效果
        tableView.deselectRow(at: indexPath, animated: true)
        //点击第一个单元格做的跳转操作
        if indexPath.section == 0 {
            
            //隐藏导航栏
            self.hidesBottomBarWhenPushed = true;
            //根据故事板获得控制器
            let story = UIStoryboard.init(name: "Main", bundle: nil)
            let aboutVC = story.instantiateViewController(withIdentifier: "mine") as! AboutViewController
            aboutVC.titleInt = indexPath.row
            //跳转界面
            self.navigationController?.pushViewController(aboutVC, animated: true)
            //显示导航栏
            self.hidesBottomBarWhenPushed = false
        }else{
        
            //点击第二个单元格做弹窗操作
            let alert = UIAlertController.init(title: "", message: "", preferredStyle: .alert)
            //选择的哪一个单元格
            switch indexPath.row {
            case 0:
                //更新版本
                alert.title = "温馨提示"
                alert.message = "现在已经是最新版本"
                let action = UIAlertAction.init(title: "确 定", style: .cancel, handler: nil)
                alert.addAction(action)
            case 1:
                //清除缓存
                //为了逼真，阻塞主线城1秒
                sleep(1)
                alert.title = "温馨提示"
                alert.message = "清除缓存完毕"
                let action = UIAlertAction.init(title: "确 定", style: .cancel, handler: nil)
                alert.addAction(action)
            case 2:
                //关于
                alert.title = "关于"
                alert.message = "张三李四王二麻子"
                let action = UIAlertAction.init(title: "确 定", style: .cancel, handler: nil)
                alert.addAction(action)
            default:
                break
            }
            //显示弹窗
            self.present(alert, animated: true, completion: nil)
        }
        
    }
}
