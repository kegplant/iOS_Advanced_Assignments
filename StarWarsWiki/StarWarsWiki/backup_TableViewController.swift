//
//  TableViewController.swift
//  StarWarsWiki
//
//  Created by Song on 1/22/18.
//  Copyright © 2018 Song. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
//    var films:[String]=[]
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let url=URL(string:"https://swapi.co/api/films")
//        let session = URLSession.shared
//        let task = session.dataTask(with: url!,completionHandler: {
//            data,response, error in
//            do{
//                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
//                    if let results = jsonResult["results"] {
//                        let resultsArray = results as! NSArray
//                        for result in resultsArray{
//                            let film = result as! NSDictionary
//                            self.films.append(film.value(forKey:"title") as! String)
//                        }
//                        if let test = jsonResult["next"]{
//                            print("next exitsts")
//                            print(test as? String)
//                        }
//                        DispatchQueue.main.async {
//                            self.tableView.reloadData()
//                        }
//                    }
//                }
//            } catch {
//                print("error: ",error)
//            }
//        })
//        task.resume()
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
//    /*
//     // MARK: - Navigation
//
//     // In a storyboard-based application, you will often want to do a little preparation before navigation
//     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//     // Get the new view controller using segue.destinationViewController.
//     // Pass the selected object to the new view controller.
//     }
//     */
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // return the count of people in our data array
//        return films.count
//    }
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        // Create a generic cell
//        let cell = UITableViewCell()
//        // set the default cell label to the corresponding element in the people array
//        cell.textLabel?.text = films[indexPath.row]
//        // return the cell so that it can be rendered
//        return cell
//    }
}
