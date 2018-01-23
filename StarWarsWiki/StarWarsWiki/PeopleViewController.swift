//
//  ViewController.swift
//  StarWarsWiki
//
//  Created by Song on 1/22/18.
//  Copyright © 2018 Song. All rights reserved.
// change line 39 to make it load everything

import UIKit

class PeopleViewController: UITableViewController {
    class Storage {
        var array:[[String:Any]]=[]
    }
//    var dict:Dictionary?
    var storage=Storage()
//    var people = [String]()
//    var apiResult=[String]()
    var url = "https://swapi.co/api/people"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StarWarsModel.Get(from:url, completionHandler:generateHandler(for: "name",storage: storage))
    }
    
    func generateHandler(for attribute: String, storage: Storage)->(Data?, _ response:URLResponse?, _ error:Error?)->Void {
        func apiHandler(data:Data?, response:URLResponse?, error:Error?)->Void{
            // see: Swift closure expression syntax
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"] {
                        let resultsArray = results as! NSArray
                        for person in resultsArray {
                            let realPerson = person as! [String:Any]//NSDictionary
                            storage.array.append(realPerson)
//                            storage.array.append([realPerson.value(forKey: attribute) as! String)
                        }
                    }
                    if false {//let next = jsonResult["next"] as? String {
//                        print(next)
//                        print(storage.array.count)
//                        //CALLS ITSELF?!!!
//                        StarWarsModel.Get(from: next, completionHandler: apiHandler)
//                        DispatchQueue.main.async{
//                            self.tableView.reloadData()
//                        }
                    }else{
                        print("cannot unwrap next")
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                            print(storage.array.count)
                        }
                    }
                }
            } catch {
                print(error)
            }
        }
        return apiHandler
    }
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "personDetailSegue", sender: indexPath)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = sender as? IndexPath {
            let destination = segue.destination as! PersonDetailViewController
            destination.personFromSegue = storage.array[indexPath.row]
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // if we return - sections we won't have any sections to put our rows in
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the count of people in our data array
        return storage.array.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create a generic cell
//        let cell =
        let cell = UITableViewCell()
        // set the default cell label to the corresponding element in the people array
        cell.textLabel?.text = storage.array[indexPath.row]["name"] as! String
        cell.accessoryType = .detailButton
        // return the cell so that it can be rendered
        return cell
    }
    
}

