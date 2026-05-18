//
//  String+Extension.swift
//  CMExpertise Precticle
//
//  Created by Dhananjay chauhan on 31/03/24.
//

import Foundation

extension String {
    /// Returns a formatted date string (`yyyy-MM-dd`) parsed from a `yyyy-MM-dd HH:mm:ss` receiver.
    ///
    /// - Returns: The date portion of the receiver as `"yyyy-MM-dd"`, or today's date string on parse failure.
    func getDate() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let date = dateFormatter.date(from: self)
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.string(from: date ?? Date())
    }
    
    /// Returns a formatted date string with an optional relative label.
    ///
    /// Parses the receiver as `yyyy-MM-dd HH:mm:ss`, formats it to `yyyy-MM-dd`, then
    /// appends `" (today)"` if the date matches today, `" (yesterday)"` if it matches
    /// yesterday, or nothing otherwise.
    ///
    /// - Returns: A string such as `"2026-05-18 (today)"`, `"2026-05-18 (yesterday)"`,
    ///   or `"2026-05-18"`. Falls back to today's plain date string on parse failure.
    func getDateWithRelativeLabel() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let date = dateFormatter.date(from: self) else {
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.string(from: Date())
        }
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: date)

        let calendar = Calendar.current
        if calendar.isDateInToday(date) {
            return "\(dateString) (today)"
        } else if calendar.isDateInYesterday(date) {
            return "\(dateString) (yesterday)"
        }
        return dateString
    }

    /// Returns the time portion of the receiver formatted as `HH:mm`.
    ///
    /// - Returns: A string such as `"14:30"`, or the current time string on parse failure.
    func getTime() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let date = dateFormatter.date(from: self)
            dateFormatter.dateFormat = "HH:mm"
            return dateFormatter.string(from: date ?? Date())
    }
}

