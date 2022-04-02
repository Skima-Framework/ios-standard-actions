//
//  ManageValueData.swift
//  SkimaStandardActions
//
//  Created by Joaquin Bozzalla on 24/03/2022.
//

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
