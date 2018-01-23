//
//  StarWarsModel.swift
//  StarWarsWiki
//
//  Created by Song on 1/22/18.
//  Copyright © 2018 Song. All rights reserved.
//
import Foundation
class StarWarsModel {
    // Note that we are passing in a function to the getAllPeople method (similar to our use of callbacks in JS). This function will allow the ViewController that calls this method to dictate what runs upon completion.
    static func Get(from url:String,completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        let url = URL(string: url)
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
        task.resume()
    }
}
