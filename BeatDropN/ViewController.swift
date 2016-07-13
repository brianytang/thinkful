//
//  ViewController.swift
//  BeatDropN
//
//  Created by Brian Tang on 7/9/16.
//  Copyright © 2016 bytLabs. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    let DEVELOPER_TOKEN = "1M18Ck7aKREFB161MvJtjlbxXrM8HrIO"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(.GET, "https://api.box.com/2.0/folders/0/items?limit=2&offset=0", headers: ["Authorization": "Bearer " + DEVELOPER_TOKEN])
            .responseJSON { response in
                print(response.request)
                print(response.response)
                print(response.data)
                print(response.result)
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
                
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

