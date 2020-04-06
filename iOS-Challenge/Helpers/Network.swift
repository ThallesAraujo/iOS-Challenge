//
//  Network.swift
//  swift-thalles-base-project
//
//  Created by Thalles Araújo on 26/01/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
import Alamofire
import SystemConfiguration

//AlamoFire helper with network-check

class Network{
    
    
    static func request(url: URL, method: HTTPMethod, parameters: Parameters? = nil, encoding: ParameterEncoding = JSONEncoding.default, headers: [String: String]? = nil, completion: @escaping (DataResponse<Any>) -> Void,  noNetworkCompletion: @escaping(String) -> Void){
        
        if !self.isConnected(){
            noNetworkCompletion("No network connection")
        }else{
            Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).responseJSON { (response) in
                printLog(response: response)
                completion(response)
            }
        }
    }
    
    
    private class func printLog(response: DataResponse<Any>) {
        
        guard let request = response.request else { return }
        guard let url = request.url else { return }
        guard let httpMethod = request.httpMethod else { return }
        var statusCodeString = ""
        if let statusCode = response.response?.statusCode, statusCode != 0 {
            statusCodeString = "(\(statusCode))"
        }
        print("--RESPONSE-\(statusCodeString)(\(httpMethod))\(url)--<<  Duração:\(String( format: "%.4f", response.timeline.requestDuration))")
        
        if let requestHeaders = request.allHTTPHeaderFields {
            print("->HEADERS\(requestHeaders)\n")
        }
        
        if let httpBody = request.httpBody {
            do {
                let jsonBody = try JSONSerialization.jsonObject(with: httpBody)
                print("->BODY \(jsonBody)")
            } catch {
                
            }
        }
        
        if let values = response.result.value {
            print(values)
        }
    }
    
    class func isConnected() -> Bool {
        
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        
        
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let ret = (isReachable && !needsConnection)
        
        return ret
        
    }
    
    
}
