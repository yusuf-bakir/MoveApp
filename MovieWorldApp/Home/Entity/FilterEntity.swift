//
//  FilterEntity.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 15.05.2024.
//

import Foundation
struct  FilterEntity {
    var title : String?
    var ımageName: String?
    var type :MovieCategory?
    

    
  
  
}

var listCategory = [
    FilterEntity(title:"nowPlaying" ,ımageName:"filterIcon" ,type:.nowPlaying ),
    FilterEntity(title:"popular" ,ımageName: "filterIcon",type:.popular ),
    FilterEntity(title: "topRated",ımageName:"filterIcon" ,type: .topRated),
    FilterEntity(title: "trending",ımageName: "filterIcon",type: .trending),
    FilterEntity(title: "upcoming",ımageName:"filterIcon" ,type: .upcoming)
]
