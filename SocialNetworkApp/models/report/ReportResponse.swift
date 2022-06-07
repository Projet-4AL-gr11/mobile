//
//  ReportResponse.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 06/06/2022.
//

import Foundation
struct ReportResponse: Identifiable{
    let reports: Array<ReportResponse>
    let count: Int
}
