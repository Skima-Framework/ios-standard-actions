//
//  NavigationData.swift
//  SkimaStandardActions
//
//  Created by Joaquin Bozzalla on 24/03/2022.
//

import Skima

struct NavigationActionData: ActionDataType {
    let type: String?
    let value: String?
    
    func execute(from scope: Scope?) {
        
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
