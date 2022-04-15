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

struct ManageValueActionData: ActionDataType {
    let type: String?
    let id: String?
    let dataType: String?
    let value: String?
    
    func execute(from scopes: [Scope]?) {
        
        switch type {
        case "createOrModify":
            guard let _id = id,
                  let _dataType = dataType,
                  let _value = value
            else { return }
            DataEngine.shared.createOrModify(VariableModel(id: _id, scopes: scopes, type: _dataType, value: _value), from: scopes)
        case "createIfNotExists":
            guard let _id = id,
                  let _dataType = dataType,
                  let _value = value
            else { return }
            DataEngine.shared.createIfNotExists(VariableModel(id: _id, scopes: scopes, type: _dataType, value: _value), from: scopes)
        case "modifyIfExists":
            guard let _id = id,
                  let _dataType = dataType,
                  let _value = value
            else { return }
            DataEngine.shared.modifyIfExists(VariableModel(id: _id, scopes: scopes, type: _dataType, value: _value), from: scopes)
        case "remove":
            guard let _id = id else { return }
            DataEngine.shared.remove(_id, from: scopes)
        default:
            return
        }
    }
}
