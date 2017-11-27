//
//  Date+TimeAgo.swift
//  SnackFeed
//
//  Created by Heather Mason on 11/26/17.
//  Copyright © 2017 HeatherMasonDev. All rights reserved.
//

import Foundation

extension Date {
    
    func timeAgo() -> String {
        let calendar = Calendar.current
        let unitFlags: Set<Calendar.Component> = [.second, .minute, .hour, .day, .weekOfYear, .month, .year]
        let now = Date()
        let oldest = now < self ? now : self
        let newest = (oldest == now) ? self : now
        let components = calendar.dateComponents(unitFlags, from: oldest, to: newest)
        
        if
            let years = components.year,
            let months = components.month,
            let weeks = components.weekOfYear,
            let days = components.day,
            let hours = components.hour,
            let minutes = components.minute,
            let seconds = components.second
        {
            if years >= 2 {
                return "\(years) years ago"
            }
            if years >= 1 {
                if months >= 1 {
                    return "Over a year ago"
                } else {
                    return "Last year"
                }
            }
            if months >= 2 {
                return "\(months) months ago"
            }
            if months >= 1 {
                return "Last month"
            }
            if weeks >= 2 {
                return "\(weeks) weeks ago"
            }
            if weeks >= 1 {
                return "Last week"
            }
            if days >= 2 {
                return "\(days) days ago"
            }
            if days >= 1 {
                return "Yesterday"
            }
            if hours >= 2 {
                return "\(hours) hours ago"
            }
            if hours >= 1 {
                return "An hour ago"
            }
            if minutes >= 2 {
                return "\(minutes) minutes ago"
            }
            if minutes >= 1 {
                return "A minute ago"
            }
            if seconds >= 10 {
                return "\(seconds) seconds ago"
            }
            if seconds < 10 {
                return "Just now"
            }
        }
        return "Date unknown"
    }
}
