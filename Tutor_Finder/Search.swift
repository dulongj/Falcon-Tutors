//
//  Search.swift
//  Tutor_Finder
//
//  Created by Jeremy Dulong on 12/1/16.
//  Copyright © 2016 Microsoft. All rights reserved.
//

import Foundation

class Search: NSObject, NSCoding {
    
    // Global Variables
    var className = ""
    var tutorCenterName = ""
    
    // MARK: Public Init
    init(className: String, tutorCenterName: String) {
        self.className = className
        self.tutorCenterName = tutorCenterName
    }
    
    // Required NSCoding Protocol
    required convenience init?(coder decoder: NSCoder) {
        guard let className = decoder.decodeObjectForKey("className") as? String,
            let tutorCenterName = decoder.decodeObjectForKey("tutorCenterName") as? String
            else { return nil }
        
        self.init(
            className: className,
            tutorCenterName: tutorCenterName
        )
    }
    
    // Required NSCoding Protocal
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.className, forKey: "className")
        coder.encodeObject(self.tutorCenterName, forKey: "tutorCenterName")
    }
    
    // Initialize [Search]
    static var searches = [Search]()
    
    static func getSearches() -> [Search]{
        return searches
    }
    
    static func setSearch(search: Search){
        searches.append(search)
    }
    
    // NSUserDefaults Searches Array funcs
    static func saveSearches(){
        let searchData = NSKeyedArchiver.archivedDataWithRootObject(searches)
        NSUserDefaults.standardUserDefaults().setObject(searchData, forKey: "searches")
    }
    
    static func loadSearches() -> [Search]{
        let searchData = NSUserDefaults.standardUserDefaults().objectForKey("searches") as? NSData
        
        if let searchData = searchData {
            searches = (NSKeyedUnarchiver.unarchiveObjectWithData(searchData) as? [Search])!
            return searches
        }
        return searches
    }
}
