//
//  SkimaStandardActions.swift
//  SkimaStandardActions
//
//  Created by Joaquin Bozzalla on 17/03/2022.
//

import Skima

public final class SkimaStandardActions: ActionsModule {
    public static let actions: [ActionSchema] = [
        ActionSchema(type: "navigation", actionData: NavigationActionData.self),
        ActionSchema(type: "manageValue", actionData: ManageValueActionData.self),
        ActionSchema(type: "apicall", actionData: ApiCallActionData.self),
    ]
}
