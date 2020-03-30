//
//  ViewController.swift
//  AlmofireMVCSample4
//
//  Created by iHub on 30/03/20.
//  Copyright © 2020 iHubTechnologiesPvtLtd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let constants = Constants()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        callPost()
    }

    func callPost(){
        
    let postsUrl = "feeds/photos_public.gne?format=json&tags=dogs&nojsoncallback=1#"
        
    NetworkingClient.networkingClient.excuteGetServiceCall(url:constants.baseUrl+postsUrl, controller:self){ response in
                    
        if response.response?.statusCode == 200 {
        print("StatusCode:\(response.response!.statusCode)")
            
    
            do {
                            
                let decoder = JSONDecoder()
                let results = try decoder.decode(Photos.self, from: response.data!)
                            
//                print("Result:\(results)")
                
                print("Title:\(results.title)")
                print("ItemTitle:\(results.items![0].title)")
                print("ItemMediaM:\(results.items![0].media!.m)")
                
                } catch let error {
                    print("ErrorDescription:",error.localizedDescription)
                }
                        
            } else {
                print("StatusCode:\(response.response!.statusCode)")
            }
        }
    }

}

