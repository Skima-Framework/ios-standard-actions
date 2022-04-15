/**
*  Skima Framework
*  Copyright (C) 2022 Joaquin Bozzalla
*
*  This program is free software: you can redistribute it and/or modify
*  it under the terms of the GNU Affero General Public License as published by
*  the Free Software Foundation, either version 3 of the License, or
*  (at your option) any later version.
*
*  This program is distributed in the hope that it will be useful,
*  but WITHOUT ANY WARRANTY; without even the implied warranty of
*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*  GNU Affero General Public License for more details.
*
*  You should have received a copy of the GNU Affero General Public License
*  along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

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
