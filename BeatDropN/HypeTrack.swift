//
//  HypeTrack.swift
//  BeatDropN
//
//  Created by Brian Tang on 7/17/16.
//  Copyright © 2016 bytLabs. All rights reserved.
//

import ObjectMapper
import UIKit

class HypeTrack : Mappable {
    
    var itemid: String?
    var artist: String?
    var title: String?
    var dateposted: CUnsignedLong?
    var siteid: CUnsignedLong?
    var sitename: String?
    var posturl: String?
    var postid: CUnsignedLong?
    var loved_count: CUnsignedLong?
    var posted_count: CUnsignedLong?
    var stream_pub: String?
    var media_type: String?
    var rank: CUnsignedLong?
    var thumb_url: String?
    var thumb_url_medium: String?
    var thumb_url_large: String?
    var time: CUnsignedLong?
    var description: String?
    var itunes_link: String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        itemid <- map["itemid"]
        artist <- map["artist"]
        title <- map["title"]
        dateposted <- map["dateposted"]
        siteid <- map["siteid"]
        sitename <- map["sitename"]
        posturl <- map["posturl"]
        postid <- map["postid"]
        loved_count <- map["loved_count"]
        posted_count <- map["posted_count"]
        stream_pub <- map["stream_pub"]
        media_type <- map["media_type"]
        rank <- map["rank"]
        thumb_url <- map["thumb_url"]
        thumb_url_medium <- map["thumb_url_medium"]
        thumb_url_large <- map["thumb_url_large"]
        time <- map["time"]
        description <- map["description"]
        itunes_link <- map["itunes_link"]
    }

}
