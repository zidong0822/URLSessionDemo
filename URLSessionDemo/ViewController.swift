//
//  ViewController.swift
//  URLSessionDemo
//
//  Created by Harvey He on 2019/7/24.
//  Copyright © 2019 Harvey He. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let image = UIImage(named:"group")
        var request = URLRequest(url:URL(string:"https://mproxy.microduino.cn/ms/emotion")!)
        request.httpMethod = "POST"
        let boundary = UUID().uuidString
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("*", forHTTPHeaderField:"Access-Control-Allow-Origin")
        var data = Data()
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"fileToUpload\"; filename=\"\("123")\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
        data.append(image!.pngData()!)
        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        let task = session.uploadTask(with: request,from:data) { (data, response, error) in
            print("urlsession1111111",data,response,error)
        }
        task.resume()
    }


}

