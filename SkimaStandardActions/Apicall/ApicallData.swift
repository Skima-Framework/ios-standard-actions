//
//  ApicallData.swift
//  SkimaStandardActions
//
//  Created by Joaquin Bozzalla on 24/03/2022.
//

import Alamofire
import Skima

struct ApiCallActionData: ActionDataType {
    let method: String?
    let endpoint: String?
    let body: [String]?
    
    func execute(from scopes: [Scope]?) {
        guard let _method = method,
              let _endpoint = endpoint
        else { return }
        
        var params: Parameters = [:]
        
        body?.forEach { param in
            if let data = DataEngine.shared.getValue(of: param, from: scopes) {
                params[param] = data
            }
        }
        
        AF.request(_endpoint, method: mapMethod(from: _method), parameters: params, encoding: JSONEncoding.default).responseDecodable(of: ApicallResponse.self) { response in
            response.value?.actions?.execute(from: scopes)
        }
    }
    
    private func mapMethod(from str: String?) -> HTTPMethod {
        switch str {
        case "post": return .post
        case "put": return .put
        case "delete": return .delete
        default: return .get
        }
    }
}
