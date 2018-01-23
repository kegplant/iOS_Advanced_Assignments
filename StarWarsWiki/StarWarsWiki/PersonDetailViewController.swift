//
//  PersonDetailViewController.swift
//  StarWarsWiki
//
//  Created by Song on 1/22/18.
//  Copyright © 2018 Song. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {
    @IBOutlet var personDetailLabels: [UILabel]!
    var personFromSegue:[String:Any]?
    override func viewDidLoad() {
        super.viewDidLoad()
        personDetailLabels[0].text="Name: \(personFromSegue!["name"]!)"
        personDetailLabels[1].text="Gender: \(personFromSegue!["gender"]!)"
        personDetailLabels[2].text="Birth Year: \(personFromSegue!["birth_year"]!)"
        personDetailLabels[3].text="Mass: \(personFromSegue!["mass"]!)"
        let species = personFromSegue!["species"]! as! [String]
        StarWarsModel.Get(from: species[0], completionHandler: {
            data, response, error in
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    let specie = jsonResult["name"] as! String
                    DispatchQueue.main.async {
                        self.personDetailLabels[3].text="Specie is: \(specie)"
                    }
                }
                
            } catch {
                print("Something went wrong")
            }
        })
        // Do any additional setup after loading the view.
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
