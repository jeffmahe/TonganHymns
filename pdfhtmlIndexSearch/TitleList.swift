//
//  TitleList.swift
//  pdfhtmlIndexSearch
//
//  Created by Jeff Mahe on 3/17/16.
//  Copyright © 2016 jmahe. All rights reserved.
//

import Foundation

class TitleList {
    var searchname : String
    var name : String
    var englishname : String
    var url: String
    
    init(searchname: String, name: String, englishname: String, url: String) {
        self.searchname = searchname
        self.name = name
        self.englishname = englishname
        self.url = url
    }
}