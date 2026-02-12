//
//  Model.swift
//  DataFlowSession
//
//  Created by Anushka Sharma on 12/01/26.
//

import Foundation
@Observable
class Book{
    var title:String
    var author:String
    init(title: String, author: String) {
        self.title = title
        self.author = author
    }
}
