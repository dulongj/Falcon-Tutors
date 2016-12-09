//
//  SearchCell.swift
//  Tutor_Finder
//
//  Created by Jeremy Dulong on 12/1/16.
//  Copyright © 2016 Microsoft. All rights reserved.
//

import Foundation

class SearchCell: UICollectionViewCell {
    
    // Update cell when a new Search is made
    var search: Search! {
        didSet {
            updateUI()
        }
    }
    
    // Storyboard Outlets
    @IBOutlet weak var classNameLabel: UILabel!
    @IBOutlet weak var tutorCenterNameLabel: UILabel!
    
    // Update cell instance data
    func updateUI()
    {
        classNameLabel?.text! = search.className
        tutorCenterNameLabel?.text! = search.tutorCenterName
    }
    
    // MARK: Cell layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
    }
}
