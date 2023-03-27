//
//  Extensions.swift
//  H4X0R News
//
//  Created by Sebastian Morado on 3/27/23.
//

import Foundation


extension Date {
    func timeAgoDisplay() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}
