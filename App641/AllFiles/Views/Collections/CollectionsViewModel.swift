//
//  CollectionsViewModel.swift
//  App641
//
//  Created by IGOR on 10/07/2024.
//

import SwiftUI
import CoreData

final class CollectionsViewModel: ObservableObject {

    @AppStorage("games") var games: [String] = ["League of Legends", "CS:GO", "Dota"]
    @Published var currGame = ""
    @Published var addGame = ""
    
    @AppStorage("colls") var colls: [String] = []
    @Published var curColl = ""
    @Published var collForAdd = ""
    
    @AppStorage("numEntries") var numEntries: Int = 0
    
    @Published var currentCollDetail = ""
    
    @Published var isAddGame: Bool = false
    @Published var isAddCollection: Bool = false

    @Published var curPhoto1 = ""
    @Published var curPhoto2 = ""
    @Published var photos: [String] = ["1", "2", "3", "4"]

    @Published var todayAdd = ""
    @Published var monthAdd = ""
    @Published var allAdd = ""

    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false

    @Published var colTitle = ""
    @Published var colPhoto1 = ""
    @Published var colPhoto2 = ""
    @Published var colPName1 = ""
    @Published var colPName2 = ""
    
    @Published var collections: [ColModel] = []
    @Published var selectedCollection: ColModel?

    func addCollection() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ColModel", into: context) as! ColModel

        loan.colTitle = colTitle
        loan.colPhoto1 = colPhoto1
        loan.colPhoto2 = colPhoto2
        loan.colPName1 = colPName1
        loan.colPName2 = colPName2

        CoreDataStack.shared.saveContext()
    }

    func fetchCollections() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ColModel>(entityName: "ColModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.collections = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.collections = []
        }
    }    

    @Published var curPhoto = ""

    @Published var enTitle = ""
    @Published var enPhoto = ""
    @Published var enCat = ""
    @Published var enColl = ""
    
    @Published var entries: [EnModel] = []
    @Published var selectedEntry: EnModel?

    func addEntry() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "EnModel", into: context) as! EnModel

        loan.enTitle = enTitle
        loan.enPhoto = enPhoto
        loan.enCat = enCat
        loan.enColl = enColl

        CoreDataStack.shared.saveContext()
    }

    func fetchEntries() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<EnModel>(entityName: "EnModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.entries = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.entries = []
        }
    }
    
}

