//
//  ViewController.swift
//  StarWarsWiki
//
//  Created by Song on 1/22/18.
//  Copyright © 2018 Song. All rights reserved.
//

import UIKit

class PeopleViewController: UITableViewController {
    
    // Hardcoded data for now
    var people = [String]()
    var url = URL(string: "https://swapi.co/api/people")
    var isReady=true
    var task:AnyObject?
    let session = URLSession.shared

    override func viewDidLoad() {//better recursion: wrap session creation and dataTask call into a Get wrapper
        super.viewDidLoad()
        task = session.dataTask(with: url!, completionHandler: apiHandler )
        print("about to resume task, which calls itself")
        task?.resume()
    }
    func apiHandler(data:Data?, response:URLResponse?, error:Error?)->Void{
        // see: Swift closure expression syntax
        do {
            if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                if let results = jsonResult["results"] {
                    let resultsArray = results as! NSArray
                    for person in resultsArray {
                        let realPerson = person as! NSDictionary
                        self.people.append(realPerson.value(forKey: "name") as! String)
                    }
                }
                if let next = jsonResult["next"] as? String {
                    self.url=URL(string: next)
                    print(next)
                    print(self.people.count)
                    //CALLS ITSELF?!!!
//                    DispatchQueue.main.async {
                        self.task = self.session.dataTask(with: self.url!, completionHandler: self.apiHandler )
                        print("about to resume task")
                        self.task?.resume()
//                    }
                }else{
                    print("cannot unwrap next")
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        print(self.people.count)
                    }
                }
            }
        } catch {
            print(error)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // if we return - sections we won't have any sections to put our rows in
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the count of people in our data array
        return people.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create a generic cell
//        let cell =
        let cell = UITableViewCell()
        // set the default cell label to the corresponding element in the people array
        cell.textLabel?.text = people[indexPath.row]
        // return the cell so that it can be rendered
        return cell
    }
    
}

