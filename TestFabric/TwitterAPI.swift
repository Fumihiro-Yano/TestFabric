//
//  TwitterAPI.swift
//  TestFabric
//
//  Created by 矢野史洋 on 2016/05/06.
//  Copyright © 2016年 矢野史洋. All rights reserved.
//

import Foundation
import TwitterKit

class TwitterAPI {
    let baseURL = "https://api.twitter.com"
    let version = "/1.1"
    
    init() {
        
    }
    
    class func getHomeTimeline(user: String?, tweets: [TWTRTweet]->(), error: (NSError) -> ()) {
        let api = TwitterAPI()
        let client = TWTRAPIClient(userID: user)
        var clientError: NSError?
        let path = "/statuses/home_timeline.json"
        let endpoint = api.baseURL + api.version + path
        let request:NSURLRequest? = client.URLRequestWithMethod("GET",
            URL: endpoint,
            parameters: nil,
            error: &clientError)
        
        if request != nil {
            client.sendTwitterRequest(request!, completion: {
                response, data, err in
                if err == nil {
                    let json: AnyObject? = try! NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                    if let jsonArray = json as? NSArray {
                         tweets(TWTRTweet.tweetsWithJSONArray(jsonArray as [AnyObject]) as! [TWTRTweet])
                    }
                } else {
                    error(err!)                }
            })
        }
    }
}
