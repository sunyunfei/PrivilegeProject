//
//  HeaderScrollView.swift
//  PrivilegeProject
//
//  Created by 孙云飞 on 2016/12/16.
//  Copyright © 2016年 孙云飞. All rights reserved.
//

import UIKit
protocol HeaderScrollViewDelegate {
    
    func tranTapEvent(item:ShowModel)//传递点击的数据
}
class HeaderScrollView: UIView,UIScrollViewDelegate {

    var dataArray=[ShowModel]()//数据
    var timer:Timer?//轮播时间
    var pageControl:UIPageControl?//分页
    var scrollView:UIScrollView?//滑动页
    var delegate:HeaderScrollViewDelegate?//代理
    
    //构造方法
   override init(frame: CGRect) {
    
         super.init(frame: frame)
      //加载滑动
    scrollView = UIScrollView.init(frame: self.bounds)
    scrollView?.delegate = self
    scrollView?.isPagingEnabled = true
    scrollView?.decelerationRate = 0.1
    scrollView?.showsVerticalScrollIndicator = false
    scrollView?.showsHorizontalScrollIndicator = false
    self.addSubview(scrollView!)
    self.p_loadData()
    self.p_loadTime()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //ui加载
    func p_loadData(){
    
        var array2=[ShowModel]()
        //获取plist文件里面的数据
        let path:String = Bundle.main.path(forResource: "super", ofType: "plist")!
        let array = NSArray.init(contentsOfFile: path)
        for dic in array!{
            
            let model = ShowModel.init(dic: dic as! [String : AnyObject])
            array2.append(model)
        }
        dataArray.append(array2[0])
        dataArray.append(array2[1])
        dataArray.append(array2[2])
        self.p_loadUI()
    }
    
    func p_loadUI(){
    
        for i in 0..<(dataArray.count + 2){
        
            let showImage = UIImageView.init(frame: CGRect.init(x: CGFloat(i) * self.frame.size.width, y: 0, width:self.frame.size.width , height: self.frame.size.height))
            showImage.isUserInteractionEnabled = true//打开手势交互
//            showImage.contentMode = .scaleAspectFit
            showImage.tag = i
            //加载一个手势
            let tap = UITapGestureRecognizer.init(target: self, action: #selector(p_tapEvent))
            showImage.addGestureRecognizer(tap)
            scrollView?.addSubview(showImage)
            
            if i <= 0{
            
                let model = dataArray[dataArray.count - 1]
                showImage.image = UIImage.init(named: model.icon!)
            }else if(i >= dataArray.count + 1){
            
                let model = dataArray[0]
                showImage.image = UIImage.init(named: model.icon!)
            }else{
            
                let model = dataArray[i - 1]
                showImage.image = UIImage.init(named: model.icon!)
            }
        }
        //需要展示的页数
        scrollView?.contentSize = CGSize.init(width: CGFloat(dataArray.count + 2) * self.frame.size.width, height: 10)
        //默认显示中间页
        scrollView?.setContentOffset(CGPoint.init(x:self.frame.size.width, y: 0), animated: false)
        //设置page
        pageControl = UIPageControl.init(frame: CGRect.init(x: 0, y: self.frame.size.height - 50, width: self.frame.size.width, height: 50))
        pageControl?.numberOfPages = dataArray.count
        self.addSubview(pageControl!)
    }
    
    //手势点击事件
    func p_tapEvent(){
    
        let index:Int = Int((scrollView?.contentOffset.x)! / (self.scrollView?.frame.size.width)!)
        let model = dataArray[index - 1]
        delegate?.tranTapEvent(item: model)
    }
    
    //轮播时间
    func p_loadTime(){
    
        timer = Timer.init(timeInterval: 3.0, target: self, selector: #selector(p_timeMethod), userInfo: nil, repeats: true)
        //加入线程中
        RunLoop.current.add(timer!, forMode: .commonModes)
        
    }

    //时间方法
    func p_timeMethod(){
    
        scrollView?.setContentOffset(CGPoint.init(x: (scrollView?.contentOffset.x)! + self.frame.size.width, y: 0), animated: true)
        self.p_dealPageCurrent()
        self.p_alawaysScrollView()
    }
    
    
    //scrollView代理
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        timer?.invalidate()
        timer = nil
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        self.p_loadTime()
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        self .p_dealPageCurrent()
        self.p_alawaysScrollView()
    }
    
    
    /********************************/
    //核心方法
    func p_dealPageCurrent(){//改变pagecontrol的显示点
    
        let intX:Int = Int((scrollView?.contentOffset.x)! / self.frame.size.width)
        if intX <= 1 {
            pageControl?.currentPage = 0
        }else if(intX >= dataArray.count){
        
            pageControl?.currentPage = dataArray.count
        }else{
        
            pageControl?.currentPage = intX - 1
        }
    }
    
    //无限轮播
    func p_alawaysScrollView(){
    
        //判断是否处于将要改变顺序的两个位置
        if(scrollView?.contentOffset.x == 0){
        
            //切换到最后一个
            scrollView?.setContentOffset(CGPoint.init(x: CGFloat(dataArray.count) * self.frame.size.width, y: 0), animated: false)
        }else if(scrollView?.contentOffset.x == (CGFloat(dataArray.count + 1) * self.frame.size.width)){
        
            //转换到第一个
            scrollView?.setContentOffset(CGPoint.init(x: self.frame.size.width, y: 0), animated: false)
        }
    }
    
}
