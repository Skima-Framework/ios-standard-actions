//
//  ApicallResponse.swift
//  SkimaStandardActions
//
//  Created by Joaquin Bozzalla on 22/03/2022.
//

import Skima

struct ApicallResponse: Decodable {
    let actions: [Action]?
}
