//
//  Date.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 22/05/22.
//

import Foundation

extension Date {
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "id")
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        dateFormatter.doesRelativeDateFormatting = true

        return dateFormatter.string(from: self)
    }
    
    func getDate() -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "id")
        dateFormatter.dateFormat = "d MMMM y"

        return dateFormatter.string(from: self)
    }
    
    func getTime() -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "id")
        dateFormatter.dateFormat = "HH:mm"

        return dateFormatter.string(from: self)
    }
    
    func getHour() -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "id")
        dateFormatter.dateFormat = "HH"

        return dateFormatter.string(from: self)
    }
    
    func getMinute() -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "id")
        dateFormatter.dateFormat = "mm"

        return dateFormatter.string(from: self)
    }
    
    func getSecond() -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "id")
        dateFormatter.dateFormat = "ss"

        return dateFormatter.string(from: self)
    }
    
    public  func addDay(n: Int) -> Date {
       let calendar = Calendar.current
       return calendar.date(byAdding: .day, value: n, to: self)!
   }
    
    static func - (lhs: Date, rhs: Date) -> Date {
        return Date(timeInterval: lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate, since:  Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date())!)
      }

}
