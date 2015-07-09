//
//  HomeViewController.swift
//  UdpEchoClient
//
//  Created by 赵 凯 on 15/7/9.
//
//

import Foundation


func doPostUrlJosnandGetResult(  sendJson:NSDictionary  ){
    let    url:NSURL = NSURL(string:"http://127.0.0.1:8000/walkapi/")!

    println("sendJson:\(sendJson)")
    
    var data = NSJSONSerialization.dataWithJSONObject(sendJson, options: NSJSONWritingOptions.PrettyPrinted, error: nil)
    var strJson=NSString(data: data!, encoding: NSUTF8StringEncoding)
    var   post = strJson != nil ? strJson! : " "
    
    
    var postData:NSData = post.dataUsingEncoding(NSUTF8StringEncoding)!
    
    var postLength:NSString = String( postData.length )
    
    var request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
    request.HTTPMethod = "POST"
    request.HTTPBody = postData
    request.setValue(postLength, forHTTPHeaderField: "Content-Length")
    request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    
    var reponseError: NSError?
    var response: NSURLResponse?
    
    var urlData: NSData? = NSURLConnection.sendSynchronousRequest(request, returningResponse:&response, error:&reponseError)
    
    if ( urlData != nil ) {
        let res = response as NSHTTPURLResponse!;
        
        NSLog("Response code: %ld", res.statusCode);
        
        if (res.statusCode >= 200 && res.statusCode < 300)
        {
            var responseData:NSString  = NSString(data:urlData!, encoding:NSUTF8StringEncoding)!
            
            NSLog("Response ==> %@", responseData);
            
            var error: NSError?
            
            let jsonData:NSDictionary = NSJSONSerialization.JSONObjectWithData(urlData!, options:NSJSONReadingOptions.MutableContainers , error: &error) as NSDictionary
            
            
            println("jsonData:\(jsonData)")
            
            let success:NSInteger = jsonData.valueForKey("code") as NSInteger
            var dataset:NSDictionary=jsonData.valueForKey("dataset") as NSDictionary
            
            //[jsonData[@"success"] integerValue];
            
            NSLog("code: %ld", success);
            var username:NSString
            var password:NSString
            
            if(success == 100)
            {
                NSLog("Login SUCCESS");
                
                
                
            } else {
                
                NSLog("Login failed");
            }
        }
    }
    sleep (30)
}

