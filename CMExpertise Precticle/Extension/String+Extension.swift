//
//  String+Extension.swift
//  CMExpertise Precticle
//
//  Created by Dhananjay chauhan on 31/03/24.
//

import Foundation

extension String {
    /// Parses a date-time string (format `"yyyy-MM-dd HH:mm:ss"`) and returns
    /// a formatted date string with an optional relative label.
    ///
    /// - Returns: A string in the format `"yyyy-MM-dd"`, optionally followed by
    ///   `" (today)"` if the date matches today, or `" (yesterday)"` if the date
    ///   matches yesterday. Falls back to the current date when parsing fails.
    func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let parsedDate = dateFormatter.date(from: self) ?? Date()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: parsedDate)

        let calendar = Calendar.current
        if calendar.isDateInToday(parsedDate) {
            return "\(dateString) (today)"
        } else if calendar.isDateInYesterday(parsedDate) {
            return "\(dateString) (yesterday)"
        }
        return dateString
    }
    
    func getTime() -> String{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let date = dateFormatter.date(from: self)
            dateFormatter.dateFormat = "HH:mm"
            return dateFormatter.string(from: date ?? Date())
    }
}

