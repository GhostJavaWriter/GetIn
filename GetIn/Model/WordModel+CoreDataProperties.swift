//
//  WordModel+CoreDataProperties.swift
//  GetIn
//
//  Created by Баир Надцалов on 14.12.2020.
//
//

import Foundation
import CoreData


extension WordModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WordModel> {
        return NSFetchRequest<WordModel>(entityName: "WordModel")
    }

    @NSManaged public var word: String?
    @NSManaged public var translation: String?
    @NSManaged public var exp: Int16
    @NSManaged public var inList: ListModel?

}

extension WordModel : Identifiable {

}
