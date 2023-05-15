//
//  ViewController.swift
//  13_03_2023_JSONNestedAPIWithDecoder
//
//  Created by Vishal Jagtap on 15/05/23.
//

import UIKit

class ViewController: UIViewController {

    var posts : [Post] = []
    var url : URL?
    var urlRequest : URLRequest?
    var urlSession : URLSession?
    var jsonDecoder : JSONDecoder?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonParse()
    }
    
    func jsonParse(){
        url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        urlRequest = URLRequest(url: url!)
        urlRequest?.httpMethod = "GET"
        
        let dataTask = urlSession?.dataTask(with: urlRequest!,completionHandler: { data, response, error in
            
            do{
                self.jsonDecoder = JSONDecoder()
                let postResponse = try self.jsonDecoder?.decode([Post].self, from: data!)
                self.posts = postResponse!
                
                for eachPost in self.posts{
                    print(eachPost.id)
                }
                
                //self.posts = try JSONDecoder().decode([Post].self, from: data!)
            }
            catch{
                print("Error occurred")
            }
        }).resume()
        
    }
        


}

