//
//  PickerViewController.swift
//  Tutor_Finder
//
//  Created by Jeremy Dulong on 10/3/16.
//  Copyright © 2016 Microsoft. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, NSFetchedResultsControllerDelegate {
    
    // OUTLETS
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var coursePickerView: UIPickerView!
    @IBOutlet weak var goButton: UIButton!
    
    // SERVER CONTROLS
    
    lazy var fetchedResultController: NSFetchedResultsController = {
        let fetchRequest = NSFetchRequest(entityName: "Courses")
        let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext!
        
        let resultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        resultsController.delegate = self;
        
        return resultsController
    }()
    
    
    // PICKER SOURCES
    var pickerDataSource = ["AC","AF","CDI","CIN","COM","CS","EC","EMS","EXP","FI","GB","GLS","HI","IDCC","IPM","IT","LA","LIT","MA","MC","MG","MK","MLCH","MLFR","MLIT","MLJA","MLSP","NASC","NASE","PH","PS","PRS","SO"];
    var coursePickerDataSource = ["310","311","312","331","332","340","350","381","412","421","470"];     // Manually set to pickerDataSource row 1 values
    
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
        }
    }
    
    @IBAction func goButtonPressed(sender: AnyObject) {
        let client = MSClient(applicationURLString: "https://tutor-finder.azurewebsites.net")
        let table = client.tableWithName("Courses")
        let query = table.query()
        query.orderByDescending("courseID")
        query.readWithCompletion { (result, error) in
            if let err = error {
                print("ERROR ", err)
            } else if let items = result?.items {
                for item in items {
                    print("Course: ", item["courseID"])
                }
            }
        }
    }
}
