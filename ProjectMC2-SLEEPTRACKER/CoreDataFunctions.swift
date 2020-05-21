//
//  coreDataFunctions.swift
//  ProjectMC2-SLEEPTRACKER
//
//  Created by Michael Sanjaya on 20/05/20.
//  Copyright © 2020 Stendy Antonio. All rights reserved.
//

import Foundation
import CoreData
import UIKit

// -------------------------------------------------------------------------------------------------------
// DATA FORMAT

// Time is stored and retrieved in the form of the 24-hour clock time format which is 00:00 to 23:59

// Date is stored and retrieved in the form of DD/MM/YYYY format, example 20/05/2020
// -------------------------------------------------------------------------------------------------------

// struct for CoreData entity Time
struct timeStruct {
    var sleepTime: String
    var wakeUpTime: String
}

// struct for CoreData entity Sleep
struct sleepStruct {
    var date: String
    var sleepTime: String
    var wakeUpTime: String
}

// struct for CoreData entity Sleep
struct profileStruct {
    var firstName: String
    var lastName: String
    var dateOfBirth: String
}

// Deletes previous time (current sleep time and wake up time) data and stores a new one
func storeTime(sleepTime: String, wakeUpTime: String) {
    let entity = "Time"
    
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    
    let context = appDelegate.persistentContainer.viewContext
    let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
    
    
    do{
        let dataToDelete = try context.fetch(fetch) as! [NSManagedObject]
        if (dataToDelete.count > 0){
            context.delete(dataToDelete[0])
            try context.save()
            print("Success delete previous data")
        }
    }catch let err{
        print(err)
    }
    
    let dataOfEntity = NSEntityDescription.entity(forEntityName: entity, in: context)!
    
    let listOfEntity = NSManagedObject(entity: dataOfEntity, insertInto: context)
    

    
    if entity == "Time" {
        
        listOfEntity.setValue(sleepTime, forKey: "sleepTime")
        listOfEntity.setValue(wakeUpTime, forKey: "wakeUpTime")
    }
    
    do {
        let result = try context.fetch(fetch)
        if result.count == 0{
            try context.save()
            print("Success context save new data")
        }
        
    } catch let error as NSError {
        
        print("Save context fail \(error), \(error.userInfo)")
    }
    
    return
}

// retrieves a single Time entity and returns it in the form of timeStruct
func retrieveTime() -> timeStruct {
    let entity = "Time"
    
    var timeData = timeStruct(sleepTime: "00:00", wakeUpTime: "00:00")
    guard let appDel = UIApplication.shared.delegate as? AppDelegate else { return timeData }
    let context = appDel.persistentContainer.viewContext
    
    let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
    var countingRow : Int = 0
    
    do {
        let result = try context.fetch(fetch)
        for data in result as! [NSManagedObject] {
            // take data
            timeData = timeStruct(
                sleepTime: "\(data.value(forKey: "sleepTime")!)",
                wakeUpTime: "\( data.value(forKey: "wakeUpTime")!)")
            
            print("Time data retrieved is \(data.value(forKey: "sleepTime")!), \(data.value(forKey: "wakeUpTime")!)")
            countingRow = countingRow + 1
        }
    } catch {
        print("Failed")
    }
    print("Total number of row in time: \(countingRow), if this number is greater than 1 there is an error")
    return timeData
}

// Stores a new Sleep data
func storeSleep(date: String, sleepTime: String, wakeUpTime: String) {
    let entity = "Sleep"
    
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    
    let context = appDelegate.persistentContainer.viewContext

    let dataOfEntity = NSEntityDescription.entity(forEntityName: entity, in: context)!
    
    let listOfEntity = NSManagedObject(entity: dataOfEntity, insertInto: context)
    
    
    
    if entity == "Sleep" {
        
        listOfEntity.setValue(date, forKey: "date")
        listOfEntity.setValue(sleepTime, forKey: "sleepTime")
        listOfEntity.setValue(wakeUpTime, forKey: "wakeUpTime")
    }
    
    do {
        
        try context.save()
        print("Success context save new data")
    } catch let error as NSError {
        
        print("Save context fail \(error), \(error.userInfo)")
    }
    
    return
}

// retrieves a single Time entity and returns it in the form of timeStruct
func retrieveSleep() -> [sleepStruct] {
    let entity = "Sleep"
    
    var sleepArray: [sleepStruct]
    sleepArray = []
    guard let appDel = UIApplication.shared.delegate as? AppDelegate else { return [] }
    let context = appDel.persistentContainer.viewContext
    
    let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
    var countingRow : Int = 0
    
    do {
        let result = try context.fetch(fetch)
        for data in result as! [NSManagedObject] {
            // take data
            let tempSleep = sleepStruct(
                date: "\(data.value(forKey: "date")!)",
                sleepTime: "\(data.value(forKey: "sleepTime")!)",
                wakeUpTime: "\( data.value(forKey: "wakeUpTime")!)")
            
            // append each element
            sleepArray.append(tempSleep)
            
            print("Sleep data retrieved is \(data.value(forKey: "date")!), \(data.value(forKey: "sleepTime")!), \(data.value(forKey: "wakeUpTime")!)")
            countingRow = countingRow + 1
        }
    } catch {
        print("Failed")
    }
    print("Total number of row in sleep: \(countingRow)")
    return sleepArray
}

// Stores a new profile data
func storeProfile(firstName: String, lastName: String, dateOfBirth: String) {
    let entity = "Profile"
    
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    
    let context = appDelegate.persistentContainer.viewContext
    let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
    
    
    do{
        
        let dataToDelete = try context.fetch(fetch) as! [NSManagedObject]
        if (dataToDelete.count > 0){
            context.delete(dataToDelete[0])
            try context.save()
            print("Success delete previous data")
        }
        
        
        
    }catch let err{
        print(err)
    }
    
    let dataOfEntity = NSEntityDescription.entity(forEntityName: entity, in: context)!
    
    let listOfEntity = NSManagedObject(entity: dataOfEntity, insertInto: context)
    
    
    
    if entity == "Profile" {
        
        listOfEntity.setValue(firstName, forKey: "firstName")
        listOfEntity.setValue(lastName, forKey: "lastName")
        listOfEntity.setValue(dateOfBirth, forKey: "dateOfBirth")
    }
    
    do {
        let result = try context.fetch(fetch)
        if result.count == 0{
            try context.save()
            print("Success context save new data")
        }
        
    } catch let error as NSError {
        
        print("Save context fail \(error), \(error.userInfo)")
    }
    
    return
}

// retrieves a single Profile entity and returns it in the form of profileStruct
func retrieveProfile() -> profileStruct {
    let entity = "Profile"
    
    var profileData = profileStruct(firstName: "John", lastName: "Doe", dateOfBirth: "01/01/2000")
    guard let appDel = UIApplication.shared.delegate as? AppDelegate else { return profileData }
    let context = appDel.persistentContainer.viewContext
    
    let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
    var countingRow : Int = 0
    
    do {
        let result = try context.fetch(fetch)
        for data in result as! [NSManagedObject] {
            // take data
            profileData = profileStruct(
                firstName: "\(data.value(forKey: "firstName")!)",
                lastName: "\( data.value(forKey: "lastName")!)",
                dateOfBirth: "\( data.value(forKey: "dateOfBirth")!)")
            
            print("Profile data retrieved is \(data.value(forKey: "firstName")!), \(data.value(forKey: "lastName")!), \(data.value(forKey: "dateOfBirth")!)")
            countingRow = countingRow + 1
        }
    } catch {
        print("Failed")
    }
    print("Total number of row in profile: \(countingRow), if this number is greater than 1 there is an error")
    return profileData
}

func clearData(entity: String) {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    
    let context = appDelegate.persistentContainer.viewContext
    
    let fetch:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: entity)
    
    do{
        let dataToDelete = try context.fetch(fetch) as! [NSManagedObject]
        var row = 0
        if (dataToDelete.count > 0){
            for element in dataToDelete{
                context.delete(element)
                try context.save()
                row = row + 1
                print("Success delete data \(row)")
                
            }
            
        }
        
        
    }catch let err{
        print(err)
    }
}
