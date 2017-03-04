//
//  File.swift
//  ExSwift
//
//  Created by Piergiuseppe Longo on 23/11/14.
//  Copyright (c) 2014 pNre. All rights reserved.
//

import Foundation

public extension Date {
    
    // MARK:  Date Manipulation
    
    /**
        Returns a new Date object representing the date calculated by adding the amount specified to self date
    
        :param: seconds number of seconds to add
        :param: minutes number of minutes to add
        :param: hours number of hours to add
        :param: days number of days to add
        :param: weeks number of weeks to add
        :param: months number of months to add
        :param: years number of years to add
        :returns: the Date computed
    */
   public func add(seconds: Int = 0, minutes: Int = 0, hours: Int = 0, days: Int = 0, weeks: Int = 0, months: Int = 0, years: Int = 0) -> Date {
        let calendar = Calendar.current
    
        let version = floor(NSFoundationVersionNumber)
    
        if version <= NSFoundationVersionNumber10_9_2 {
            var component = DateComponents()
            component.setValue(seconds, for: .second)
            
            var date : Date! = calendar.date(byAdding: component, to: self)
            component = DateComponents()
            component.setValue(minutes, for: .minute)
            date = calendar.date(byAdding: component, to: self)
            
            component = DateComponents()
            component.setValue(hours, for: .hour)
            date = calendar.date(byAdding: component, to: self)
            
            component = DateComponents()
            component.setValue(days, for: .day)
            date = calendar.date(byAdding: component, to: self)
            
            component = DateComponents()
            component.setValue(weeks, for: .weekOfMonth)
            date = calendar.date(byAdding: component, to: self)
            
            component = DateComponents()
            component.setValue(months, for: .month)
            date = calendar.date(byAdding: component, to: self)
            
            component = DateComponents()
            component.setValue(years, for: .year)
            date = calendar.date(byAdding: component, to: self)
            return date
        }
    
        var date : Date! = calendar.date(byAdding: .second, value: seconds, to: self)
        date = calendar.date(byAdding: .minute, value: minutes, to: self)
        date = calendar.date(byAdding: .day, value: days, to: self)
        date = calendar.date(byAdding: .hour, value: hours, to: self)
        date = calendar.date(byAdding: .weekOfMonth, value: weeks, to: self)
        date = calendar.date(byAdding: .month, value: months, to: self)
        date = calendar.date(byAdding: .year, value: years, to: self)
        return date
    }
    
    /**
        Returns a new Date object representing the date calculated by adding an amount of seconds to self date
    
        :param: seconds number of seconds to add
        :returns: the Date computed
    */
    public func addSeconds (seconds: Int) -> Date {
        return add(seconds: seconds)
    }
    
    /**
        Returns a new Date object representing the date calculated by adding an amount of minutes to self date
    
        :param: minutes number of minutes to add
        :returns: the Date computed
    */
    public func addMinutes (minutes: Int) -> Date {
        return add(minutes: minutes)
    }
    
    /**
        Returns a new Date object representing the date calculated by adding an amount of hours to self date
    
        :param: hours number of hours to add
        :returns: the Date computed
    */
    public func addHours(hours: Int) -> Date {
        return add(hours: hours)
    }
    
    /**
        Returns a new Date object representing the date calculated by adding an amount of days to self date
    
        :param: days number of days to add
        :returns: the Date computed
    */
    public func addDays(days: Int) -> Date {
        return add(days: days)
    }
    
    /**
        Returns a new Date object representing the date calculated by adding an amount of weeks to self date
    
        :param: weeks number of weeks to add
        :returns: the Date computed
    */
    public func addWeeks(weeks: Int) -> Date {
        return add(weeks: weeks)
    }
    
    
    /**
        Returns a new Date object representing the date calculated by adding an amount of months to self date
    
        :param: months number of months to add
        :returns: the Date computed
    */
    
    public func addMonths(months: Int) -> Date {
        return add(months: months)
    }
    
    /**
        Returns a new Date object representing the date calculated by adding an amount of years to self date
    
        :param: years number of year to add
        :returns: the Date computed
    */
    public func addYears(years: Int) -> Date {
        return add(years: years)
    }
    
    // MARK:  Date comparison
    
    /**
        Checks if self is after input Date
    
        :param: date Date to compare
        :returns: True if self is after the input Date, false otherwise
    */
    public func isAfter(date: Date) -> Bool{
        return (self.compare(date) == ComparisonResult.orderedDescending)
    }
    
    /**
        Checks if self is before input Date
    
        :param: date Date to compare
        :returns: True if self is before the input Date, false otherwise
    */
    public func isBefore(date: Date) -> Bool{
        return (self.compare(date) == ComparisonResult.orderedAscending)
    }
    
    
    // MARK: Getter
    
    /**
        Date year
    */
    public var year : Int {
        get {
            return getComponent(.year)
        }
    }

    /**
        Date month
    */
    public var month : Int {
        get {
            return getComponent(.month)
        }
    }
    
    /**
        Date weekday
    */
    public var weekday : Int {
        get {
            return getComponent(.weekday)
        }
    }

    /**
        Date weekMonth
    */
    public var weekMonth : Int {
        get {
            return getComponent(.weekOfMonth)
        }
    }

    
    /**
        Date days
    */
    public var days : Int {
        get {
            return getComponent(.day)
        }
    }
    
    /**
        Date hours
    */
    public var hours : Int {
        
        get {
            return getComponent(.hour)
        }
    }
    
    /**
        Date minuts
    */
    public var minutes : Int {
        get {
            return getComponent(.minute)
        }
    }
    
    /**
        Date seconds
    */
    public var seconds : Int {
        get {
            return getComponent(.second)
        }
    }
    
    /**
        Returns the value of the Date component
    
        :param: component NSCalendarUnit
        :returns: the value of the component
    */

    public func getComponent (_ component : Calendar.Component) -> Int {
        let calendar = Calendar.current
        return calendar.component(component, from: self)
    }
}

// MARK: Arithmetic

//func +(date: Date, timeInterval: Int) -> Date {
//    return date + TimeInterval(timeInterval)
//}
//
//func -(date: Date, timeInterval: Int) -> Date {
//    return date - TimeInterval(timeInterval)
//}

func +(date: Date, timeInterval: Double) -> Date {
    return date.addingTimeInterval(TimeInterval(timeInterval))
}

func -(date: Date, timeInterval: Double) -> Date {
    return date.addingTimeInterval(TimeInterval(-timeInterval))
    
}



func -(date: Date, otherDate: Date) -> TimeInterval {
    return date.timeIntervalSince(otherDate)
    
}

//func +=( date: inout Date, timeInterval: Int) {
//    date = date + timeInterval
//}
//
//func -=( date: inout Date, timeInterval: Int) {
//    date = date - timeInterval
//}
//func +=( date: inout Date, timeInterval: Double) {
//    date = date + timeInterval
//}
//
//func -=( date: inout Date, timeInterval: Double) {
//    date = date - timeInterval
//}


public func ==(lhs: Date, rhs: Date) -> Bool {
    return lhs.compare(rhs) == ComparisonResult.orderedSame
}



public func <(lhs: Date, rhs: Date) -> Bool {
    return lhs.compare(rhs) == ComparisonResult.orderedAscending
}
