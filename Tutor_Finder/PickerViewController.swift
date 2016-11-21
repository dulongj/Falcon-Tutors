//
//  PickerViewController.swift
//  Tutor_Finder
//
//  Created by Jeremy Dulong on 10/3/16.
//  Copyright © 2016 Microsoft. All rights reserved.
//

import Foundation
import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // OUTLETS
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var coursePickerView: UIPickerView!
    @IBOutlet weak var goButton: UIButton!
    
    // VARIABLES
    var courseRow = 0
    // ** Manually set to AC 310 by default to account for immediate "Go" clicks **
    var deptName:String! = "AC"
    var courseName:String! = "310"
    var course:String! = "AC 310"
    
    var alertController = UIAlertController(title: "Tutor Center", message: "Description", preferredStyle: .Alert)
    var tutorCenter:String? = "Tutor Center" {
        didSet{
            
            // CHANGE DISPLAY NAME OF THE LAB FOR ALERT TITLE
            var displayTutorCenter = ""
            if tutorCenter == "CIS_Sandbox" {
                displayTutorCenter = "Check out the CIS Sandbox!"
            } else if tutorCenter == "CLIC" {
                displayTutorCenter = "Check out the CLIC Lab!"
            } else if tutorCenter == "Eco-Fi" {
                displayTutorCenter = "Check out the Eco-Fi Center!"
            } else if tutorCenter == "ESOL" {
                displayTutorCenter = "Check out the ESOL Center!"
            } else if tutorCenter == "Math" {
                displayTutorCenter = "Check out the Math Lab!"
            } else if tutorCenter == "Writing" {
                displayTutorCenter = "Check out the Writing Lab!"
            } else if tutorCenter == "ACELAB" {
                displayTutorCenter = "Check out the ACELAB!"
            } else if tutorCenter == "Marketing-Technology" {
                displayTutorCenter = "Check out the Marketing-Technology Center!"
            } else if tutorCenter == "Media_Culture_Labs" {
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
                if tutorCenter == "CIS_Sandbox" {
                    alertMessage = "They'll help with \(course). \n \n The Computer Information Systems Department’s “Sandbox” (the “CIS Sandbox” for short) is a place for learning and technology. It serves as a social learning space that prepares students to succeed in their CIS courses and to thrive in a technology-driven business world. \n \n SMITH 234 \n \n Operating Hours \n Monday: 10am - 12am \n Tuesday: 10am - 12am \n Wednesday: 10am - 12am \n Thursday: 10am - 11pm \n  Friday: 10am - 6pm \n Saturday: 1pm - 6pm \n Sunday: 1pm - 12am"
                } else if tutorCenter == "CLIC" {
                    alertMessage = "They'll help with \(course). \n \n The Center for Languages and International Collaboration (CLIC) seeks to enhance course curricula in Modern Languages and International Studies through the use of state-of-the-art technology. Faculty members in both disciplines work in concert with the center to integrate course content and technology using synchronous and asynchronous technology. \n \n ADAMIAN 162 \n 781-891-2019\n \n Operating Hours \n Monday: 10am - 9pm \n Tuesday: 10am - 9pm \n Wednesday: 10am - 9pm \n Thursday: 10am - 9pm \n  Friday: 10am - 5pm \n Saturday: 10am - 12pm \n Sunday: Closed"
                } else if tutorCenter == "Eco-Fi" {
                    alertMessage = "They'll help with \(course). \n \n Economics students have access to the Economics, Finance and Statistics Learning Center for help with course material and to expand their study of economics. The center is staffed by top Economics students, who are eager to help you understand relevant topics or simply discuss economics topics of interest. \n \n ADAMIAN 112 \n 781-891-2139 \n \n Operating Hours \n Monday: 1pm - 9pm \n Tuesday: 1pm - 9pm \n Wednesday: 1pm - 9pm \n Thursday: 1pm - 7pm \n  Friday: Closed \n Saturday: Closed \n Sunday: 6pm - 9pm"
                } else if tutorCenter == "ESOL" {
                    alertMessage = "They'll help with \(course). \n \n Students whose home language is not English are invited to take advantage of the free tutorial services offered by our ESOL Center. English and Media Studies Department faculty members who specialize in teaching English to speakers of other languages (ESOL) provide language support to help students achieve success in their courses across the curriculum. \n \n LIBRARY 026 \n 781-891-2021 \n \n Operating Hours \n Monday: 9:30am - 5pm \n Tuesday: 9:30am - 7pm \n Wednesday: 9:30am - 5:30pm \n Thursday: 9:30am - 8:30pm \n  Friday: 10am - 2pm \n Saturday: Closed \n Sunday: Closed"
                } else if tutorCenter == "Math" {
                    alertMessage = "They'll help with \(course). \n \n The Mathematics Learning Center provides drop-in tutoring to all students enrolled in undergraduate mathematics courses at Bentley. Their goal is to have students leave a tutoring session with increased understanding and confidence in their own ability to do mathematics. \n \n MORRISON 103 \n 781-891-3180 \n \n Operating Hours \n Monday: 8:30am - 9pm \n Tuesday: 8:30am - 9pm \n Wednesday: 8:30am - 9pm \n Thursday: 8:30am - 9pm \n  Friday: 11am - 2pm \n Saturday: Closed \n Sunday: 6pm - 9pm"
                } else if tutorCenter == "Writing" {
                    alertMessage = "They'll help with \(course). \n \n The Writing Center is open days and evenings for one-on-one assistance with writing skills. It is staffed by a writing instructor and by peer tutors chosen both for the quality of their own writing and for their friendliness. \n \n LIBRARY 023 \n 781-891-3173 \n \n Operating Hours \n Monday: 10am - 10pm \n Tuesday: 10am - 10pm \n Wednesday: 10am - 10pm \n Thursday: 10am - 10pm \n  Friday: 10am - 1pm \n Saturday: Closed \n Sunday: 6pm - 10pm"
                } else if tutorCenter == "ACELAB" {
                    alertMessage = "They'll help with \(course). \n \n The ACELAB is usually packed with undergraduate and graduate students working on fast-paced accounting tutorials or state-of-the-art software programs such as SAP or ACL. Many of Bentley’s top accounting majors work in the ACELAB, providing individual tutoring services to assist students through the sometimes challenging areas of accounting. \n \n LA CAVA 305 \n 781-891-3174 \n \n Operating Hours \n Monday: 11am - 9pm \n Tuesday: 11am - 9pm \n Wednesday: 11am - 9pm \n Thursday: 11am - 9pm \n  Friday: Closed \n Saturday: Closed \n Sunday: 5pm - 9pm"
                } else if tutorCenter == "Marketing-Technology" {
                    alertMessage = "They'll help with \(course). \n \n The Center for Marketing Technology is on the cutting edge of marketing, research, technology and strategy. Students, educators and business partners have daily access to the latest trends, newest technologies and in-depth research that is shaping the future of marketing practices. \n \n MIRRISON 220 \n 781-891-3115 \n \n Operating Hours Vary"
                } else if tutorCenter == "Media_Culture_Labs" {
                    alertMessage = "They'll help with \(course). \n \n The Media and Culture Labs and Studio supports the English and Media Studies Department’s media and culture major, the joint Creative Industries major, as well as the university’s double major in Liberal Studies with a concentration in Media, Arts and Society. This state-of-the-art facility provides resources for all forms of media production: video, sound, digital photography and design. \n \n LINDSAY 10 \n 781-891-2902 \n \n Operating Hours \n Monday: 8am - 9pm \n Tuesday: 8am - 9pm \n Wednesday: 8am - 6:20pm \n Thursday: 8am - 6:20pm \n  Friday: 8am - 4pm \n Saturday: Closed \n Sunday: Closed"
                }
                
                alertController = UIAlertController(title: displayTutorCenter,
                                                    message: alertMessage,
                                                    preferredStyle: .Alert)
                let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alertController.addAction(defaultAction)
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
    }
    
    // PICKER SOURCES
    var pickerDataSource = ["AC","AF","CDI","CIN","COM","CS","EC","EMS","EXP","FI","GB","GLS","HI","IDCC","IPM","IT","LA","LIT","MA","MC","MG","MK","MLCH","MLFR","MLIT","MLJA","MLSP","NASC","NASE","PH","PS","PRS","SO"];
    var coursePickerDataSource = ["310","311","312","331","332","340","350","381","412","421","470"];
    // Manually set to pickerDataSource row 1 values
    
    // VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;
        self.coursePickerView.dataSource = self;
        self.coursePickerView.delegate = self;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Picker Controls
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return pickerDataSource.count;
        } else {
            return coursePickerDataSource.count;
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return pickerDataSource[row]
        } else {
            return coursePickerDataSource[row] 
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if pickerView.tag == 1 {
            if(row == 0)    //AC
            {
                coursePickerDataSource = ["310","311","312","331","332","340","350","381","412","421","470"];
                coursePickerView.reloadAllComponents()
            }
            else if(row == 1)   //AF
            {
                coursePickerDataSource = ["450"];
                coursePickerView.reloadAllComponents()
            }
            else if(row == 2)   //CDI
            {
                coursePickerDataSource = ["101"];
                coursePickerView.reloadAllComponents()
            }
            else if(row == 3)   //CIN
            {
                coursePickerDataSource = ["270","370","381"];
                coursePickerView.reloadAllComponents()
            }
            else if(row == 4)   //COM
            {
                coursePickerDataSource = ["210","311","320"];
                coursePickerView.reloadAllComponents()
            }
            else if(row == 5)   //CS
            {
                coursePickerDataSource = ["150","180","213","240","280","350","360","460","480"];
                coursePickerView.reloadAllComponents()
            }
            else if(row == 6)   //EC
            {
                coursePickerDataSource = ["111","224","225","251","270","275","311","315","321","346","361","370","381","391","454"];
                coursePickerView.reloadAllComponents()
            }
            else if(row == 7)   //EMS
            {
                coursePickerDataSource = ["200","201"];
                coursePickerView.reloadAllComponents()
            }
            else if(row == 8)   //EXP
            {
                coursePickerDataSource = ["101","102","201","202"];
                coursePickerView.reloadAllComponents()
            }
            else if(row == 9)   //FI
            {
                coursePickerDataSource = ["305","306","307","312","318","325","331","335","345","347","351","360","362","372","399"];
                coursePickerView.reloadAllComponents()
            }
            else if(row == 10)  //GB
            {
                coursePickerDataSource = ["110","112","212","213","214","215","310","320","410"];
                coursePickerView.reloadAllComponents()
            }
            else if(row == 11)  //GLS
            {
                coursePickerDataSource = ["100","101","102","105","110","114","116","236","242","262","312","421"];
                coursePickerView.reloadAllComponents()
            }
            else if(row == 12)  //HI
            {
                coursePickerDataSource = ["200","266","304","307","315","331","346","349","356","358","370","381","383","392"];
                coursePickerView.reloadAllComponents()
            }
            else if(row == 13)  //IDCC
            {
                coursePickerDataSource = ["230","250","255","320","345","355","360","365","370","375","380"];
                coursePickerView.reloadAllComponents()
            }
            else if(row == 14)  //IPM
            {
                coursePickerDataSource = ["210","450"];
                coursePickerView.reloadAllComponents()
            }
            else if(row == 15)  //IT
            {
                coursePickerDataSource = ["101"];
                coursePickerView.reloadAllComponents()
            }
            else if(row == 16)  //LA
            {
                coursePickerDataSource = ["101","102","105","106","210","302","308","316","317","402"];
                coursePickerView.reloadAllComponents()
            }
            else if(row == 17)  //LIT
            {
                coursePickerDataSource = ["230","233","260","262","311","312","313","314","340","355","365","371","396"];
                coursePickerView.reloadAllComponents()
            }
            else if(row == 18)  //MA
            {
                coursePickerDataSource = ["123","126","131","139","225","227","233","239","243","252","263","267","299","343","347","370","402"];
                coursePickerView.reloadAllComponents()
            }
            else if(row == 19)  //MC
            {
                coursePickerDataSource = ["220","222","224","320","341","345"];
                coursePickerView.reloadAllComponents()
            }
            else if(row == 20)  //MG
            {
                coursePickerDataSource = ["225","228","240","241","242","250","315","317","331","332","335","336","345","351","360"];
                coursePickerView.reloadAllComponents()
            }
            else if(row == 21)  //MK
            {
                coursePickerDataSource = ["321","322","330","332","340","344","361","372","399","400","411"];
                coursePickerView.reloadAllComponents()
            }
            else if(row == 22)  //MLCH
            {
                coursePickerDataSource = ["101","201"];
                coursePickerView.reloadAllComponents()
            }
            else if(row == 23)  //MLFR
            {
                coursePickerDataSource = ["101","201"];
                coursePickerView.reloadAllComponents()
            }
            else if(row == 24)  //MLIT
            {
                coursePickerDataSource = ["101","201"];
                coursePickerView.reloadAllComponents()
            }
            else if(row == 25)  //MLJA
            {
                coursePickerDataSource = ["101","201"];
                coursePickerView.reloadAllComponents()
            }
            else if(row == 26)  //MLSP
            {
                coursePickerDataSource = ["101","102","201","202","203","404"];
                coursePickerView.reloadAllComponents()
            }
            else if(row == 27)  //NASC
            {
                coursePickerDataSource = ["100","110","110","130","140"];
                coursePickerView.reloadAllComponents()
            }
            else if(row == 28)  //NASE
            {
                coursePickerDataSource = ["303","308","313","315","317","319","328","339","342","344","364","397","398"];
                coursePickerView.reloadAllComponents()
            }
            else if(row == 29)  //PH
            {
                coursePickerDataSource = ["101","130","270","301","351"];
                coursePickerView.reloadAllComponents()
            }
            else if(row == 30)  //PS
            {
                coursePickerDataSource = ["210","230","240","252","275","305","333","340","380","388"];
                coursePickerView.reloadAllComponents()
            }
            else if(row == 31)  //PRS
            {
                coursePickerDataSource = ["339","373"];
                coursePickerView.reloadAllComponents()
            }
            else if(row == 32)  //SO
            {
                coursePickerDataSource = ["132","225","285","289","292","299","300","320"];
                coursePickerView.reloadAllComponents()
            }
            
            deptName = pickerDataSource[row]
            if courseRow > coursePickerDataSource.count {
                courseName = coursePickerDataSource[coursePickerDataSource.count-1]
            } else {
            courseName = coursePickerDataSource[courseRow]
            }
        }
        
        if pickerView.tag == 2 {
            courseName = coursePickerDataSource[row]
            courseRow = row
        }
        
        course = deptName + " " + courseName
        print(course)
        
    }
    
    @IBAction func goButtonPressed(sender: AnyObject) {
        let client = MSClient(applicationURLString: "https://tutorfinderappbentley.azurewebsites.net")
        let table = client.tableWithName("TC_Relation")
        let query = table.queryWithPredicate(NSPredicate(format: "CourseID == '\(course)'"))
        query.readWithCompletion { (result, error) in
            if let err = error {
                print("ERROR ", err)
            } else if let items = result?.items {
                for item in items {
                    print(item["TutorCenterID"] as! String)
                    self.tutorCenter = (item["TutorCenterID"] as! String)
                    print(self.tutorCenter)
                }
            }
        }

    }
}
