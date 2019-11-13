//
//  Image.swift
//  flickerImages
//
//  Created by yasmeen on 11/13/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import Foundation
class photo:Codable{
    
    private var _id:String!
    private var _title:String!
    private var _url_z:String!
 
    init(id:String, title:String, url_z:String!) {
        self.id = id
        self.title = title
        self.url_z = url_z
        
    }
    public var title:String!{
        get{
            return _title
        }
        set{
            _title = newValue
        }
    }
    public var id:String!{
        get{
            return _id
        }
        set{
            _id = newValue
        }
    }
    public var url_z:String!{
        get{
            return _url_z
        }set{
            _url_z = newValue
        }
    }
}
class ImageResponse: Codable {
    public let page: Int
    public let pages: Int
    public let images:[Image]
}
