//
//  SearchViewController.swift
//  Tutor_Finder
//
//  Created by Jeremy Dulong on 12/1/16.
//  Copyright © 2016 Microsoft. All rights reserved.
//

import Foundation

class SearchViewController: UIViewController {
    
    // Storyboard Outlets
    @IBOutlet weak var searchCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewCell: SearchCell!
    
    // Declare Reuse ID
    private let reuseIdentifier = "Search Cell"
    
    // Load NSUserDefaults [Search]
    var searches = Search.loadSearches()
    
    // MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SearchViewController : UICollectionViewDataSource {
    
    // Optional
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Required
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searches.count
    }
    
    // Required
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! SearchCell

        cell.search = self.searches[(indexPath as NSIndexPath).item]
        
        return cell
    }
    
    // Optional Gesture Recognition
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let tutorCenter = self.searches[(indexPath as NSIndexPath).item].tutorCenterName
        let course = self.searches[(indexPath as NSIndexPath).item].className
        var alertController = UIAlertController(title: "Tutor Center", message: "Description", preferredStyle: .Alert)
        
        // CHANGE DISPLAY NAME OF THE LAB FOR ALERT TITLE
        var displayTutorCenter = ""
        if tutorCenter == "CIS_Sandbox" || tutorCenter == "CIS Sandbox"{
            displayTutorCenter = "Check out the CIS Sandbox!"
        } else if tutorCenter == "CLIC" || tutorCenter == "CLIC Lab"{
            displayTutorCenter = "Check out the CLIC Lab!"
        } else if tutorCenter == "Eco-Fi" || tutorCenter == "Eco-Fi Center"{
            displayTutorCenter = "Check out the Eco-Fi Center!"
        } else if tutorCenter == "ESOL" || tutorCenter == "ESOL Center"{
            displayTutorCenter = "Check out the ESOL Center!"
        } else if tutorCenter == "Math" || tutorCenter == "Math Lab"{
            displayTutorCenter = "Check out the Math Lab!"
        } else if tutorCenter == "Writing" || tutorCenter == "Writing Lab"{
            displayTutorCenter = "Check out the Writing Lab!"
        } else if tutorCenter == "ACELAB" {
            displayTutorCenter = "Check out the ACELAB!"
        } else if tutorCenter == "Marketing-Technology" || tutorCenter == "Marketing-Technology Center" || tutorCenter == "Marketing Technology"{
            displayTutorCenter = "Check out the Marketing-Technology Center!"
        } else if tutorCenter == "Media_Culture_Labs" || tutorCenter == "Media Culture Lab"{
            displayTutorCenter = "Check out the Media Culture Lab!"
        }
        
        // DEFAULT - IF THERE IS NO TUTOR LAB OR LAB RETURNS NULL
        if tutorCenter == "" {
            alertController = UIAlertController(title: "Sorry!",
                                                message: "No lab tutors \(course), try contacting your professor.",
                                                preferredStyle: .Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            self.presentViewController(alertController, animated: true, completion: nil)
        } else {
            
            // CREATE ALERT FOR EACH TUTOR CENTER PULLED FROM AZURE
            var alertMessage:String!
            if tutorCenter == "CIS_Sandbox" || tutorCenter == "CIS Sandbox" {
                alertMessage = "They'll help with \(course). \n \n The Computer Information Systems Department’s “Sandbox” (the “CIS Sandbox” for short) is a place for learning and technology. It serves as a social learning space that prepares students to succeed in their CIS courses and to thrive in a technology-driven business world. \n \n SMITH 234 \n \n Operating Hours \n Monday: 10am - 12am \n Tuesday: 10am - 12am \n Wednesday: 10am - 12am \n Thursday: 10am - 11pm \n  Friday: 10am - 6pm \n Saturday: 1pm - 6pm \n Sunday: 1pm - 12am"
            } else if tutorCenter == "CLIC" || tutorCenter == "CLIC Lab" {
                alertMessage = "They'll help with \(course). \n \n The Center for Languages and International Collaboration (CLIC) seeks to enhance course curricula in Modern Languages and International Studies through the use of state-of-the-art technology. Faculty members in both disciplines work in concert with the center to integrate course content and technology using synchronous and asynchronous technology. \n \n ADAMIAN 162 \n 781-891-2019\n \n Operating Hours \n Monday: 10am - 9pm \n Tuesday: 10am - 9pm \n Wednesday: 10am - 9pm \n Thursday: 10am - 9pm \n  Friday: 10am - 5pm \n Saturday: 10am - 12pm \n Sunday: Closed"
            } else if tutorCenter == "Eco-Fi" || tutorCenter == "Eco-Fi Center" {
                alertMessage = "They'll help with \(course). \n \n Economics students have access to the Economics, Finance and Statistics Learning Center for help with course material and to expand their study of economics. The center is staffed by top Economics students, who are eager to help you understand relevant topics or simply discuss economics topics of interest. \n \n ADAMIAN 112 \n 781-891-2139 \n \n Operating Hours \n Monday: 1pm - 9pm \n Tuesday: 1pm - 9pm \n Wednesday: 1pm - 9pm \n Thursday: 1pm - 7pm \n  Friday: Closed \n Saturday: Closed \n Sunday: 6pm - 9pm"
            } else if tutorCenter == "ESOL" || tutorCenter == "ESOL Center" {
                alertMessage = "They'll help with \(course). \n \n Students whose home language is not English are invited to take advantage of the free tutorial services offered by our ESOL Center. English and Media Studies Department faculty members who specialize in teaching English to speakers of other languages (ESOL) provide language support to help students achieve success in their courses across the curriculum. \n \n LIBRARY 026 \n 781-891-2021 \n \n Operating Hours \n Monday: 9:30am - 5pm \n Tuesday: 9:30am - 7pm \n Wednesday: 9:30am - 5:30pm \n Thursday: 9:30am - 8:30pm \n  Friday: 10am - 2pm \n Saturday: Closed \n Sunday: Closed"
            } else if tutorCenter == "Math" || tutorCenter == "Math Lab" {
                alertMessage = "They'll help with \(course). \n \n The Mathematics Learning Center provides drop-in tutoring to all students enrolled in undergraduate mathematics courses at Bentley. Their goal is to have students leave a tutoring session with increased understanding and confidence in their own ability to do mathematics. \n \n MORRISON 103 \n 781-891-3180 \n \n Operating Hours \n Monday: 8:30am - 9pm \n Tuesday: 8:30am - 9pm \n Wednesday: 8:30am - 9pm \n Thursday: 8:30am - 9pm \n  Friday: 11am - 2pm \n Saturday: Closed \n Sunday: 6pm - 9pm"
            } else if tutorCenter == "Writing" || tutorCenter == "Writing Lab" {
                alertMessage = "They'll help with \(course). \n \n The Writing Center is open days and evenings for one-on-one assistance with writing skills. It is staffed by a writing instructor and by peer tutors chosen both for the quality of their own writing and for their friendliness. \n \n LIBRARY 023 \n 781-891-3173 \n \n Operating Hours \n Monday: 10am - 10pm \n Tuesday: 10am - 10pm \n Wednesday: 10am - 10pm \n Thursday: 10am - 10pm \n  Friday: 10am - 1pm \n Saturday: Closed \n Sunday: 6pm - 10pm"
            } else if tutorCenter == "ACELAB" {
                alertMessage = "They'll help with \(course). \n \n The ACELAB is usually packed with undergraduate and graduate students working on fast-paced accounting tutorials or state-of-the-art software programs such as SAP or ACL. Many of Bentley’s top accounting majors work in the ACELAB, providing individual tutoring services to assist students through the sometimes challenging areas of accounting. \n \n LA CAVA 305 \n 781-891-3174 \n \n Operating Hours \n Monday: 11am - 9pm \n Tuesday: 11am - 9pm \n Wednesday: 11am - 9pm \n Thursday: 11am - 9pm \n  Friday: Closed \n Saturday: Closed \n Sunday: 5pm - 9pm"
            } else if tutorCenter == "Marketing-Technology" || tutorCenter == "Marketing-Technology Center" || tutorCenter == "Marketing Technology"{
                alertMessage = "They'll help with \(course). \n \n The Center for Marketing Technology is on the cutting edge of marketing, research, technology and strategy. Students, educators and business partners have daily access to the latest trends, newest technologies and in-depth research that is shaping the future of marketing practices. \n \n MIRRISON 220 \n 781-891-3115 \n \n Operating Hours Vary"
            } else if tutorCenter == "Media_Culture_Labs" || tutorCenter == "Media Culture Lab" {
                alertMessage = "They'll help with \(course). \n \n The Media and Culture Labs and Studio supports the English and Media Studies Department’s media and culture major, the joint Creative Industries major, as well as the university’s double major in Liberal Studies with a concentration in Media, Arts and Society. This state-of-the-art facility provides resources for all forms of media production: video, sound, digital photography and design. \n \n LINDSAY 10 \n 781-891-2902 \n \n Operating Hours \n Monday: 8am - 9pm \n Tuesday: 8am - 9pm \n Wednesday: 8am - 6:20pm \n Thursday: 8am - 6:20pm \n  Friday: 8am - 4pm \n Saturday: Closed \n Sunday: Closed"
            }
            
            // DISPLAY ALERT
            alertController = UIAlertController(title: displayTutorCenter,
                                                message: alertMessage,
                                                preferredStyle: .Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
}

