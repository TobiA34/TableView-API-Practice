//
//  Date + Formatter.swift
//  RickAndMorty-Episode-Pratice
//
//  Created by Tobi Adegoroye on 30/06/2019.
//  Copyright © 2019 Tobi Adegoroye. All rights reserved.
//

import Foundation
extension DateFormatter {
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}

