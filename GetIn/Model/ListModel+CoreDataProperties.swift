//
//  ListModel+CoreDataProperties.swift
//  GetIn
//
//  Created by Баир Надцалов on 14.12.2020.
//
//

import Foundation
import CoreData


extension ListModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ListModel> {
        return NSFetchRequest<ListModel>(entityName: "ListModel")
    }

    @NSManaged public var title: String?
    @NSManaged public var words: NSSet?
    

}

// MARK: Generated accessors for words
extension ListModel {

    @objc(addWordsObject:)
    @NSManaged public func addToWords(_ value: WordModel)

    @objc(removeWordsObject:)
    @NSManaged public func removeFromWords(_ value: WordModel)

    @objc(addWords:)
    @NSManaged public func addToWords(_ values: NSSet)

    @objc(removeWords:)
    @NSManaged public func removeFromWords(_ values: NSSet)

}

extension ListModel : Identifiable {

}
