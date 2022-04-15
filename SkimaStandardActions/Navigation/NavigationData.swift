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

import Skima

struct NavigationActionData: ActionDataType {
    let type: String?
    let value: String?
    
    func execute(from scopes: [Scope]?) {
        
        switch type {
        case "deeplink":
            guard let universalLink = value else { return }
            NavigationEngine.shared.navigate(to: universalLink)
        case "back":
            NavigationEngine.shared.goBack()
        case "endpoint":
            guard let endpoint = value else { return }
            let vc = SkimaViewController(fromEndpoint: endpoint)
            NavigationEngine.shared.pushViewController(vc)
        default:
            return
        }
    }
}
