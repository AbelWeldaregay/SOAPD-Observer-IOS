//
//  LoggedIn.swift
//  soapdObserver
//
//  Created by Abel Weldaregay on 5/20/18.
//  Copyright © 2018 Abel Weldaregay. All rights reserved.
//

import UIKit

class LoggedIn: UIViewController {
    
    
    @IBOutlet weak var upAndDownMov: UIButton!
    //*******************
    @IBOutlet weak var totalBodyMovement: UIButton!
    //*******************
    @IBOutlet weak var outwardMotions: UIButton!
    @IBOutlet weak var highPitched: UIButton!
    @IBOutlet weak var negativeWords: UIButton!
    
    @IBOutlet weak var patientNameLabel: UILabel!
    
    @IBOutlet weak var loggedInUser: UILabel!
    
    @IBOutlet weak var loggInType: UILabel!
    @IBOutlet weak var repetitiveVocalization: UIButton!
    @IBOutlet weak var repetitiveMov: UIButton!
    
    @IBOutlet weak var patientIDLabel: UILabel!
    var patientID : String = "empty"
    var comments  : String!
    var observationLevel : String = "empty"
    var observation : String = "empty"
    var event : String = "empty"
    var startTimeTotalBodyMov = Date()
    var endTimeTotalBodyMov = Date()
    var startTimeUpAndDown = Date()
    var endTimeUpandDown = Date()
    var startTimeRepetitiveMov = Date()
    var endTimeRepetitiveMov = Date()
    var startTimeOutwardMotions = Date()
    var endTimeOutwardMotions = Date()
    var startTimeHighPitched = Date()
    var endTimeHighPitched = Date()
    var startTimeRepVoc = Date()
    var endTimeRepVoc = Date()
    var startTimeNegWords = Date()
    var endTimeNegWords = Date()
    var continousEventBodyMov : Bool = false
    var continousEventUpandDown : Bool = false
    var conitnousEventRepetitive : Bool = false
    var continousEventOutwardMotions : Bool = false
    var continousEventHighPitched : Bool = false
    var continousEventRepetitveVoc : Bool = false
    var continousEventNegativeWords : Bool = false
    var timeOfObservationTBM = Date()
    var timeOfObservationUDM = Date()
    var timeOfObservationRMP = Date()
    var timeOfObservationOM = Date()
    var timeOfObservationHPL = Date()
    var timeOfObservationRV = Date()
    var timeOfObservationNW = Date()
    
    //var event : String = "empty"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true);
        self.title = "Welcome \(correctName)"
        self.showInputDialog()
        loggedInUser.text = correctName
        loggInType.text = userDescription
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        //******total body movement single and double tap configerations*************
        let singleTapTBM = UITapGestureRecognizer(target: self, action: #selector(normalTapTBM(_:)))
        singleTapTBM.numberOfTapsRequired = 1
        totalBodyMovement.addGestureRecognizer(singleTapTBM)
        
        let doubleTapTBM = UITapGestureRecognizer(target: self, action: #selector(doubleTapTBM(_:)))
        doubleTapTBM.numberOfTapsRequired = 2
        totalBodyMovement.addGestureRecognizer(doubleTapTBM)
        singleTapTBM.require(toFail: doubleTapTBM)
        //****************************************************************************
        
        //*************up and down movements single and double tap configerations*****
        
        let singleTapUDM = UITapGestureRecognizer(target: self, action: #selector(normalTapUDM(_:)))
        singleTapUDM.numberOfTapsRequired = 1
        upAndDownMov.addGestureRecognizer(singleTapUDM)
        
        let doulbeTapUDM = UITapGestureRecognizer(target: self, action: #selector(doubleTapUDM(_:)))
        doulbeTapUDM.numberOfTapsRequired = 2
        upAndDownMov.addGestureRecognizer(doulbeTapUDM)
        singleTapUDM.require(toFail: doulbeTapUDM)
        //****************************************************************************
        
        //*******************Repetitive Movements in place tap configerations*********
        let singleTapRM = UITapGestureRecognizer(target: self, action: #selector(normalTapRM(_:)))
        singleTapRM.numberOfTapsRequired = 1
        repetitiveMov.addGestureRecognizer(singleTapRM)
        
        let doulbeTapRM = UITapGestureRecognizer(target: self, action: #selector(doubleTapRM(_:)))
        doulbeTapRM.numberOfTapsRequired = 2
        repetitiveMov.addGestureRecognizer(doulbeTapRM)
        singleTapRM.require(toFail: doulbeTapRM)
        
        //****************************************************************************
        //**********************Outward Motions single and double tap configerations**
        
        let singleTapOM = UITapGestureRecognizer(target: self, action: #selector(normalTapOM(_:)))
        singleTapOM.numberOfTapsRequired = 1
        outwardMotions.addGestureRecognizer(singleTapOM)
        
        let doulbeTapOM = UITapGestureRecognizer(target: self, action: #selector(doubleTapOM(_:)))
        doulbeTapOM.numberOfTapsRequired = 2
        outwardMotions.addGestureRecognizer(doulbeTapOM)
        singleTapOM.require(toFail: doulbeTapOM)
        
        
        //*****************************************************************************
        //*************************High pitched or Loud words tap config***************
        
        let singleTapHP = UITapGestureRecognizer(target: self, action: #selector(normalTapHP(_:)))
        singleTapHP.numberOfTapsRequired = 1
        highPitched.addGestureRecognizer(singleTapHP)
        
        let doulbeTapHP = UITapGestureRecognizer(target: self, action: #selector(doubleTapHP(_:)))
        doulbeTapHP.numberOfTapsRequired = 2
        highPitched.addGestureRecognizer(doulbeTapHP)
        singleTapHP.require(toFail: doulbeTapHP)
        //******************************************************************************
        //*********************repetitive vocalization tap config***********************
        let singleTapRV = UITapGestureRecognizer(target: self, action: #selector(normalTapRV(_:)))
        singleTapRV.numberOfTapsRequired = 1
        repetitiveVocalization.addGestureRecognizer(singleTapRV)
        
        let doulbeTapRV = UITapGestureRecognizer(target: self, action: #selector(doubleTapRV(_:)))
        doulbeTapRV.numberOfTapsRequired = 2
        repetitiveVocalization.addGestureRecognizer(doulbeTapRV)
        singleTapRV.require(toFail: doulbeTapRV)
        
        //******************************************************************************
        //*********************Negative Words*******************************************
        let singleTapNW = UITapGestureRecognizer(target: self, action: #selector(normalTapNW(_:)))
        singleTapNW.numberOfTapsRequired = 1
        negativeWords.addGestureRecognizer(singleTapNW)
        
        let doulbeTapNW = UITapGestureRecognizer(target: self, action: #selector(doubleTapNW(_:)))
        doulbeTapNW.numberOfTapsRequired = 2
        negativeWords.addGestureRecognizer(doulbeTapNW)
        singleTapNW.require(toFail: doulbeTapNW)
        
        
    }
    
    func displayAlertMessage(message: String) {
        let alertMsg = UIAlertController(title:"Alert", message: message,
                                         preferredStyle:UIAlertControllerStyle.alert);
        
        let confirmAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil );
        alertMsg.addAction(confirmAction)
        present(alertMsg, animated:true, completion: nil)
    }
    
    
    @IBAction func logoutPressed(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyBoard.instantiateViewController(withIdentifier: "MainView") as! ViewController
        self.navigationController?.pushViewController(secondVC, animated: true)
       self.navigationItem.setHidesBackButton(true, animated: true)
        
    }
    
    
    func showInputDialog() {
        //Creating UIAlertController and
        //Setting title and message for the alert dialog
        let alertController = UIAlertController(title: "Alert", message: "Enter patient Details", preferredStyle: .alert)
        
        //the confirm action taking the inputs
        let confirmAction = UIAlertAction(title: "Enter", style: .default) { (_) in
            
            //getting the input values from user
            self.patientID = (alertController.textFields?[0].text)!
            self.patientNameLabel.text = "Patient Name: " + (alertController.textFields?[1].text)!
            self.patientIDLabel.text = "Patient ID: " + self.patientID
            print (self.patientID)
            
        }
        
        //the cancel action doing nothing
       // let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        //adding textfields to our dialog box
        alertController.addTextField { (textField) in
            textField.placeholder = "Patient ID"
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Patient Name"
            
        }
      
        
        //adding the action to dialogbox
        alertController.addAction(confirmAction)
        //alertController.addAction(cancelAction)
        
        //finally presenting the dialog box
        self.present(alertController, animated: true, completion: nil)
    }
    
    func getEventDetails( value: inout Bool) -> String{
        
        value = true
        
        let alertController = UIAlertController(title: "Enter details?", message: "Alert", preferredStyle: .alert)
        var inputField : String = ""
        
        //the confirm action taking the inputs
        let confirmAction = UIAlertAction(title: "Enter", style: .default) { (_) in
            
            //getting the input values from user
              inputField = (alertController.textFields?[0].text)!
       
        }
        
        //the cancel action doing nothing
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        //adding textfields to our dialog box
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter event duratation"
        }
        
        
        //adding the action to dialogbox
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        //finally presenting the dialog box
        self.present(alertController, animated: true, completion: nil)
        
        return inputField
        
    }
    
    func getObsLevelContinous(observation: String, startTime : Date, endTime : Date, timeOfObservaton : Date)
    {
        
        self.observation = observation
        
        let alert = UIAlertController(title: "Observation Level", message: "", preferredStyle: .alert)
        
        // Change font of the title and message
        
        
        let action1 = UIAlertAction(title: "Mild", style: .default, handler: { (action) -> Void in
            
            print ("inside action 1")
            self.observationLevel = "Mild"
            self.writeContinousEventToDB(startTime: startTime, endTime: endTime, timeOfObservation: timeOfObservaton)
            //self.writeToDataBase()
            //self.recordObservation(observation: observation)
            
        })
        
        let action2 = UIAlertAction(title: "Moderate", style: .default, handler: { (action) -> Void in
            print ("inside action 2")
            self.observationLevel = "Moderate"
            self.writeContinousEventToDB(startTime: startTime, endTime: endTime, timeOfObservation: timeOfObservaton)
           // self.writeToDataBase()
            //self.recordObservation(observation: observation)
            
        })
        
        let action3 = UIAlertAction(title: "Extreme", style: .default, handler: { (action) -> Void in
    
            print ("inside action 3")
            self.observationLevel = "Extreme"
            self.writeContinousEventToDB(startTime: startTime, endTime: endTime, timeOfObservation: timeOfObservaton)
            //self.writeToDataBase()
            //self.recordObservation(observation: observation)
            
        })
        
        // Cancel button
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) -> Void in })
        
        alert.view.tintColor = UIColor.brown  // change text color of the buttons
        alert.view.backgroundColor = UIColor.cyan  // change background color
        alert.view.layer.cornerRadius = 25
        
        alert.addAction(action1)
        alert.addAction(action2)
        alert.addAction(action3)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
    }
    
    func getObservationLevel(observation: String){
        
        self.observation = observation
        
        let alert = UIAlertController(title: "Observation Level", message: "", preferredStyle: .alert)
        
        // Change font of the title and message
        
        
        let action1 = UIAlertAction(title: "Mild", style: .default, handler: { (action) -> Void in
           
            print ("inside action 1")
            self.observationLevel = "Mild"
            self.writeToDataBase()
            //self.recordObservation(observation: observation)
            
        })
        
        let action2 = UIAlertAction(title: "Moderate", style: .default, handler: { (action) -> Void in
           print ("inside action 2")
            self.observationLevel = "Moderate"
            
            self.writeToDataBase()
            //self.recordObservation(observation: observation)
            
        })
        
        let action3 = UIAlertAction(title: "Extreme", style: .default, handler: { (action) -> Void in
            
           
            print ("inside action 3")
            self.observationLevel = "Extreme"
             self.writeToDataBase()
            //self.recordObservation(observation: observation)
            
        })
        
        // Cancel button
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) -> Void in })
        
        alert.view.tintColor = UIColor.brown  // change text color of the buttons
        alert.view.backgroundColor = UIColor.cyan  // change background color
        alert.view.layer.cornerRadius = 25
        
        alert.addAction(action1)
        alert.addAction(action2)
        alert.addAction(action3)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
        
        
    }
    
    @IBAction func changePatientPressed(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "Alert", message: "Enter patient Details", preferredStyle: .alert)
        
        //the confirm action taking the inputs
        let confirmAction = UIAlertAction(title: "Enter", style: .default) { (_) in
            
            //getting the input values from user
            self.patientID = (alertController.textFields?[0].text)!
            self.patientNameLabel.text = "Patient Name: " + (alertController.textFields?[1].text)!
            self.patientIDLabel.text = "Patient ID: " + self.patientID
            print (self.patientID)
            
        }
        
        //the cancel action doing nothing
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        //adding textfields to our dialog box
        alertController.addTextField { (textField) in
            textField.placeholder = "Patient ID"
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Patient Name"
            
        }
        
        
        //adding the action to dialogbox
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        //finally presenting the dialog box
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    
    func writeToDataBase(){
        
        
                    let url = URL(string: "http://qav2.cs.odu.edu/abel/SOPDobserverScripts/checkLogin/recordObservation.php")!
                    var request = URLRequest(url: url)
                    request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
                    request.httpMethod = "POST"
        
                    let postString = "observer=\(correctName)&observation=\(self.observation)&patientID=\(self.patientID)&eventType=\(self.event)&observationLevel=\(self.observationLevel)"
                    request.httpBody = postString.data(using: .utf8)
                    let task = URLSession.shared.dataTask(with: request) { data, response, error in
                        guard let data = data, error == nil else {                                                 // check for fundamental networking error
                            print("error=\(error)")
                            return
                        }
        
                        if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                            print("statusCode should be 200, but is \(httpStatus.statusCode)")
                            print("response = \(response)")
                        }
        
                        let responseString = String(data: data, encoding: .utf8)
                        print("responseString = \(responseString)")
                    }
                    task.resume()
        

        
    }
    
    func writeContinousEventToDB(startTime : Date, endTime : Date, timeOfObservation : Date) {
        
        let url = URL(string: "http://qav2.cs.odu.edu/abel/SOPDobserverScripts/checkLogin/continousEvents.php")!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let postString = "observer=\(correctName)&observation=\(self.observation)&patientID=\(self.patientID)&eventType=\(self.event)&observationLevel=\(self.observationLevel)&startTime=\(startTime)&endTime=\(endTime)&timeOfObservation=\(timeOfObservation)"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(responseString)")
        }
        task.resume()
        
    }
    
    func recordObservation(observation : String)
    {
        
        
        let alert = UIAlertController(title: "Event Type", message: "", preferredStyle: .alert)
        
        
        
        
        let action1 = UIAlertAction(title: "Single Event", style: .default, handler: { (action) -> Void in
            
           self.event = "Single Event"
            self.writeToDataBase()
            
        })
        
        let action2 = UIAlertAction(title: "Continous Event", style: .default, handler: { (action) -> Void in
            
           self.event = "Continous Event"
            self.writeToDataBase()
            
        })
        
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) -> Void in })
        
        alert.view.tintColor = UIColor.brown  // change text color of the buttons
        alert.view.backgroundColor = UIColor.cyan  // change background color
        alert.view.layer.cornerRadius = 25
        
        alert.addAction(action1)
        alert.addAction(action2)
    
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
        
      
    }
    
    @objc func normalTapTBM(_ sender: UIGestureRecognizer){
        
        let obs = totalBodyMovement.titleLabel!.text!
        self.event = "Single Event"
        
        if(self.continousEventBodyMov)
        {
            //var evenType = "Continous Event"
            self.event = "Continous Event"
            self.endTimeTotalBodyMov = Date()
            
            totalBodyMovement.backgroundColor = UIColor.darkGray
            self.continousEventBodyMov = false
            self.getObsLevelContinous(observation: obs, startTime: self.startTimeTotalBodyMov, endTime: self.endTimeTotalBodyMov, timeOfObservaton: timeOfObservationTBM)
            //self.writeContinousEventToDB(startTime: self.startTimeTotalBodyMov, endTime: self.endTimeTotalBodyMov)
        }
        else
        {
            var startTime = Date()
            var endTime = startTime
            var timeOfObservation = startTime
            self.getObsLevelContinous(observation: obs, startTime: startTime, endTime: endTime, timeOfObservaton: timeOfObservation)
        }
//        var startTime = Date()
//        var endTime = startTime
//        var timeOfObservation = startTime
//        self.getObsLevelContinous(observation: obs, startTime: startTime, endTime: endTime, timeOfObservaton: timeOfObservation)
        //getObservationLevel(observation: obs)
        
        //self.writeToDataBase()
        
        
        
    }
    
    @objc func normalTapUDM(_ sender: UIGestureRecognizer){
        
        let obs = upAndDownMov.titleLabel!.text!
        self.event = "Single Event"
        
        if(self.continousEventUpandDown)
        {
            //var evenType = "Continous Event"
            self.event = "Continous Event"
            self.endTimeUpandDown = Date()
            
            
            self.continousEventUpandDown = false
            self.getObsLevelContinous(observation: obs, startTime: self.startTimeUpAndDown, endTime: self.endTimeUpandDown, timeOfObservaton: timeOfObservationUDM)
            upAndDownMov.backgroundColor = UIColor.darkGray
            //self.writeContinousEventToDB(startTime: self.startTimeTotalBodyMov, endTime: self.endTimeTotalBodyMov)
        }
        else
        {
            var startTime = Date()
            var endTime = startTime
            var timeOfObservation = startTime
            self.getObsLevelContinous(observation: obs, startTime: startTime, endTime: endTime, timeOfObservaton: timeOfObservation)
        }
        
        
        //getObservationLevel(observation: obs)
        
        //self.writeToDataBase()
        
        
        
    }
    
    @objc func normalTapRM(_ sender: UIGestureRecognizer){
        
        let obs = repetitiveMov.titleLabel!.text!
        self.event = "Single Event"
        
        if(self.conitnousEventRepetitive)
        {
            //var evenType = "Continous Event"
            self.event = "Continous Event"
            self.endTimeRepetitiveMov = Date()
            
            
            self.conitnousEventRepetitive = false
            self.getObsLevelContinous(observation: obs, startTime: self.startTimeRepetitiveMov, endTime: self.endTimeRepetitiveMov, timeOfObservaton: timeOfObservationRMP)
            repetitiveMov.backgroundColor = UIColor.darkGray
            //self.writeContinousEventToDB(startTime: self.startTimeTotalBodyMov, endTime: self.endTimeTotalBodyMov)
        }
        else
        {
            var startTime = Date()
            var endTime = startTime
            var timeOfObservation = startTime
            self.getObsLevelContinous(observation: obs, startTime: startTime, endTime: endTime, timeOfObservaton: timeOfObservation)
        }
        
        
        
        
        
        
        //getObservationLevel(observation: obs)
        
        //self.writeToDataBase()
    }
    
    @objc func normalTapOM(_ sender: UIGestureRecognizer){
        
        let obs = outwardMotions.titleLabel!.text!
        self.event = "Single Event"
        
        if(self.continousEventOutwardMotions)
        {
            //var evenType = "Continous Event"
            self.event = "Continous Event"
            self.endTimeOutwardMotions = Date()
            
            
            self.continousEventOutwardMotions = false
            self.getObsLevelContinous(observation: obs, startTime: self.startTimeOutwardMotions, endTime: self.endTimeOutwardMotions, timeOfObservaton: timeOfObservationOM)
            outwardMotions.backgroundColor = UIColor.darkGray
            //self.writeContinousEventToDB(startTime: self.startTimeTotalBodyMov, endTime: self.endTimeTotalBodyMov)
        }
        else
        {
            var startTime = Date()
            var endTime = startTime
            var timeOfObservation = startTime
            self.getObsLevelContinous(observation: obs, startTime: startTime, endTime: endTime, timeOfObservaton: timeOfObservation)
        }
        
        //getObservationLevel(observation: obs)
        
        
    }
    
    @objc func normalTapHP(_ sender: UIGestureRecognizer){
        
        let obs = highPitched.titleLabel!.text!
        self.event = "Single Event"
        
        if(self.continousEventHighPitched)
        {
            //var evenType = "Continous Event"
            self.event = "Continous Event"
            self.endTimeHighPitched = Date()
            
            self.continousEventHighPitched = false
            self.getObsLevelContinous(observation: obs, startTime: self.startTimeHighPitched, endTime: self.endTimeHighPitched, timeOfObservaton: timeOfObservationHPL)
            highPitched.backgroundColor = UIColor.darkGray
            //self.writeContinousEventToDB(startTime: self.startTimeTotalBodyMov, endTime: self.endTimeTotalBodyMov)
        }
        else
        {
            var startTime = Date()
            var endTime = startTime
            var timeOfObservation = startTime
            self.getObsLevelContinous(observation: obs, startTime: startTime, endTime: endTime, timeOfObservaton: timeOfObservation)
        }
        
        
        
       // getObservationLevel(observation: obs)
        
        //self.writeToDataBase()
    }
    
    @objc func normalTapRV(_ sender: UIGestureRecognizer){
        
        let obs = repetitiveVocalization.titleLabel!.text!
        self.event = "Single Event"
        
        if(self.continousEventRepetitveVoc)
        {
            //var evenType = "Continous Event"
            self.event = "Continous Event"
            self.endTimeRepVoc = Date()
            
            self.continousEventRepetitveVoc = false
            self.getObsLevelContinous(observation: obs, startTime: self.startTimeRepVoc, endTime: self.endTimeRepVoc, timeOfObservaton: timeOfObservationRV)
            repetitiveVocalization.backgroundColor = UIColor.darkGray
            //self.writeContinousEventToDB(startTime: self.startTimeTotalBodyMov, endTime: self.endTimeTotalBodyMov)
        }
        else
        {
            var startTime = Date()
            var endTime = startTime
            var timeOfObservation = startTime
            self.getObsLevelContinous(observation: obs, startTime: startTime, endTime: endTime, timeOfObservaton: timeOfObservation)
        }
        
        //getObservationLevel(observation: obs)
        
        //self.writeToDataBase()
    }
    
    @objc func normalTapNW(_ sender: UIGestureRecognizer){
        
        let obs = negativeWords.titleLabel!.text!
        self.event = "Single Event"
        
        if(self.continousEventNegativeWords)
        {
            //var evenType = "Continous Event"
            self.event = "Continous Event"
            self.endTimeNegWords = Date()
            
            self.continousEventNegativeWords = false
            self.getObsLevelContinous(observation: obs, startTime: self.startTimeNegWords, endTime: self.endTimeNegWords, timeOfObservaton: timeOfObservationNW)
            negativeWords.backgroundColor = UIColor.darkGray
            //self.writeContinousEventToDB(startTime: self.startTimeTotalBodyMov, endTime: self.endTimeTotalBodyMov)
        }
        else
        {
            var startTime = Date()
            var endTime = startTime
            var timeOfObservation = startTime
            self.getObsLevelContinous(observation: obs, startTime: startTime, endTime: endTime, timeOfObservaton: timeOfObservation)
        }
        //getObservationLevel(observation: obs)
        
        //self.writeToDataBase()
    }
    
    
    @objc func doubleTapTBM (_ sender: UITapGestureRecognizer){
        print ("double tap")
        
        let obs = totalBodyMovement.titleLabel!.text!
        self.event = "Continous Event"
        
        
        if(!continousEventBodyMov)
        {
            self.startTimeTotalBodyMov = Date()
            self.timeOfObservationTBM = self.startTimeTotalBodyMov
            self.continousEventBodyMov = true
            totalBodyMovement.backgroundColor = UIColor.green
        }
        else{
            self.endTimeTotalBodyMov = Date()
           
            totalBodyMovement.backgroundColor = UIColor.darkGray
            self.continousEventBodyMov = false
            self.getObsLevelContinous(observation: obs, startTime: startTimeTotalBodyMov, endTime: endTimeTotalBodyMov, timeOfObservaton: timeOfObservationTBM)
            //self.writeContinousEventToDB(startTime: self.startTimeTotalBodyMov, endTime: self.endTimeTotalBodyMov)
        }
        
            
        //getObservationLevel(observation: obs)
        
   
    }
    
    @objc func doubleTapHP (_ sender: UITapGestureRecognizer){
        print ("double tap")
        
        let obs = highPitched.titleLabel!.text!
        self.event = "Continous Event"
        
        if(!continousEventHighPitched)
        {
            self.startTimeHighPitched = Date()
            self.timeOfObservationHPL = self.startTimeHighPitched
            self.continousEventHighPitched = true
            highPitched.backgroundColor = UIColor.green
        }
        else{
            self.endTimeHighPitched = Date()
            
            highPitched.backgroundColor = UIColor.darkGray
            self.continousEventHighPitched = false
            self.getObsLevelContinous(observation: obs, startTime: startTimeHighPitched, endTime: endTimeHighPitched, timeOfObservaton: timeOfObservationHPL)
            //self.writeContinousEventToDB(startTime: self.startTimeTotalBodyMov, endTime: self.endTimeTotalBodyMov)
        }
        
        
        //getObservationLevel(observation: obs)
        
        //self.writeToDataBase()
    }
    
    @objc func doubleTapOM (_ sender: UITapGestureRecognizer){
        print ("double tap")
        
        let obs = outwardMotions.titleLabel!.text!
        self.event = "Continous Event"
        
        if(!continousEventOutwardMotions)
        {
            self.startTimeOutwardMotions = Date()
            self.timeOfObservationOM = self.startTimeOutwardMotions
            self.continousEventOutwardMotions = true
            outwardMotions.backgroundColor = UIColor.green
        }
        else{
            self.endTimeOutwardMotions = Date()
            
            outwardMotions.backgroundColor = UIColor.darkGray
            self.continousEventOutwardMotions = false
           self.getObsLevelContinous(observation: obs, startTime: startTimeOutwardMotions, endTime: endTimeOutwardMotions, timeOfObservaton: timeOfObservationOM)
            //self.writeContinousEventToDB(startTime: self.startTimeTotalBodyMov, endTime: self.endTimeTotalBodyMov)
        }

        
        
        
        ///getObservationLevel(observation: obs)
        
        
    }
    @objc func doubleTapRV (_ sender: UITapGestureRecognizer){
        print ("double tap")
        
        let obs = repetitiveVocalization.titleLabel!.text!
        self.event = "Continous Event"
        
        if(!continousEventRepetitveVoc)
        {
            self.startTimeRepVoc = Date()
            self.timeOfObservationRV = self.startTimeRepVoc
            self.continousEventRepetitveVoc = true
            repetitiveVocalization.backgroundColor = UIColor.green
        }
        else{
            self.endTimeRepVoc = Date()
            
            repetitiveVocalization.backgroundColor = UIColor.darkGray
            self.continousEventRepetitveVoc = false
            self.getObsLevelContinous(observation: obs, startTime: startTimeRepVoc, endTime: endTimeRepVoc, timeOfObservaton: timeOfObservationRV)
            //self.writeContinousEventToDB(startTime: self.startTimeTotalBodyMov, endTime: self.endTimeTotalBodyMov)
        }
        
        
        
        
       // getObservationLevel(observation: obs)
        
    }
    
    @objc func doubleTapRM (_ sender: UITapGestureRecognizer){
        print ("double tap")
        
        let obs = repetitiveMov.titleLabel!.text!
        self.event = "Continous Event"
        
        if(!conitnousEventRepetitive)
        {
            self.startTimeRepetitiveMov = Date()
            self.timeOfObservationRMP = self.startTimeRepetitiveMov
            self.conitnousEventRepetitive = true
            repetitiveMov.backgroundColor = UIColor.green
        }
        else{
            self.endTimeRepetitiveMov = Date()
            
            repetitiveMov.backgroundColor = UIColor.darkGray
            self.conitnousEventRepetitive = false
            self.getObsLevelContinous(observation: obs, startTime: startTimeRepetitiveMov, endTime: endTimeRepetitiveMov, timeOfObservaton: timeOfObservationRMP)
            //self.writeContinousEventToDB(startTime: self.startTimeTotalBodyMov, endTime: self.endTimeTotalBodyMov)
        }
        
        
        
        //getObservationLevel(observation: obs)
        
        //self.writeToDataBase()
    }
    
    @objc func doubleTapNW (_ sender: UITapGestureRecognizer){
        print ("double tap")
        
        let obs = negativeWords.titleLabel!.text!
        self.event = "Continous Event"
        
        if(!continousEventNegativeWords)
        {
            self.startTimeNegWords = Date()
            self.timeOfObservationNW = self.startTimeNegWords
            self.continousEventNegativeWords = true
            negativeWords.backgroundColor = UIColor.green
        }
        else{
            self.endTimeNegWords = Date()
            
            negativeWords.backgroundColor = UIColor.darkGray
            self.continousEventNegativeWords = false
            self.getObsLevelContinous(observation: obs, startTime: startTimeNegWords, endTime: endTimeNegWords, timeOfObservaton: timeOfObservationNW)
            //self.writeContinousEventToDB(startTime: self.startTimeTotalBodyMov, endTime: self.endTimeTotalBodyMov)
        }
        
        
        
        //getObservationLevel(observation: obs)
        
    }
  
    @objc func doubleTapUDM (_ sender: UITapGestureRecognizer){
        print ("double tap")
        
        let obs = upAndDownMov.titleLabel!.text!
        self.event = "Continous Event"
        
        if(!continousEventUpandDown)
        {
            self.startTimeUpAndDown = Date()
            self.timeOfObservationUDM = self.startTimeUpAndDown
            self.continousEventUpandDown = true
            upAndDownMov.backgroundColor = UIColor.green
        }
        else{
            self.endTimeUpandDown = Date()
            
            upAndDownMov.backgroundColor = UIColor.darkGray
            self.continousEventUpandDown = false
            self.getObsLevelContinous(observation: obs, startTime: startTimeUpAndDown, endTime: endTimeUpandDown, timeOfObservaton: timeOfObservationUDM)
            //self.writeContinousEventToDB(startTime: self.startTimeTotalBodyMov, endTime: self.endTimeTotalBodyMov)
        }
        
        
        //getObservationLevel(observation: obs)
        
        //self.writeToDataBase()
    }
    
   
}
