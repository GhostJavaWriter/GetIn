//
//  Settings.swift
//  GetIn
//
//  Created by Sergei Krupenikov on 16.12.2020.
//

enum Section: Int, CaseIterable, CustomStringConvertible {
    case General
    case Notifications
    case Feedback
    
    var description: String {
        
        switch self {
        case .General: return "General"
        case .Notifications: return "Notifications"
        case .Feedback: return "Feedback"
        }
    }
}


enum General: Int, CaseIterable, CustomStringConvertible {
    case NumberOfWords
    
    var description: String {
        
        switch self {
        case .NumberOfWords: return "Number of words in test"
        }
    }
}


enum Notifications: Int, CaseIterable, CustomStringConvertible {
    case Notifications
    case Schedule
    case Sounds
    
    var description: String {
        
        switch self {
        case .Notifications: return "Enable notifications"
        case .Schedule: return "Schedule"
        case .Sounds: return "Sounds"
        }
    }
}


enum Feedback: Int, CaseIterable, CustomStringConvertible {
    case Email
    
    var description: String {
        
        switch self {
        case .Email: return "Contact Us"
        }
    }
}
