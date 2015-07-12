//
//  AppModel.h
//  ling
//
//  Created by lb on 15/6/27.
//  Copyright (c) 2015年 凌兵. All rights reserved.
//

#import "MyModel.h"

@interface AppModel : MyModel
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * aid;

@property (nonatomic, strong) NSString * image;
@property (nonatomic, strong) NSString * pubDate;

/**
 *  [
 {
 "title": "中日为钓鱼岛掀起装备竞赛 万吨执法船为撞船而建 ",
 "aid": "11998",
 "description": "近年围绕争议岛屿和海域，中国与相关邻国的矛盾分歧，呈现扩大化趋势，频率、强度均是有增无减。",
 "image": "http://upload.milnews.com/2015/0626/1435305713428.jpg",
 "pubDate": "2015-06-26",
 "category": "今日头条",
 "author": "milnews_zm",
 "comments": "未知"
 },
 {
 "title": "全球与中国关系最铁的国家曝光：情同手足",
 "aid": "11997",
 "description": "在近百年的风云变幻中，中国与一些国家结下了深厚的友谊，这也是中国能够在国际上得到拥护的基石。",
 "image": "http://upload.milnews.com/2015/0626/1435300148936.jpg",
 "pubDate": "2015-06-26",
 "category": "空穴来风",
 "author": "milnews_zm",
 "comments": "未知"
 },
 {
 "title": "菲渔民哭诉再不去黄岩岛了：中国水炮太狠",
 "aid": "11996",
 "description": "港媒称38名菲律宾渔民6月24日在联合国上诉，抗议中国不允许他们在南海黄岩岛附近有争议海域捕鱼。",
 "image": "http://upload.milnews.com/2015/0626/1435299619589.jpg",
 "pubDate": "2015-06-26",
 "category": "空穴来风",
 "author": "milnews_zm",
 "comments": "未知"
 },
 */
@end
