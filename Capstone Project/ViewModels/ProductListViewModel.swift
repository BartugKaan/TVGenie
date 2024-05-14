//
//  ProductListViewModel.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 15.03.2024.
//

import Foundation
import GRDB

class ProductListViewModel: ObservableObject{
    @Published var products: [TVItem] = []
    private var dbQueue: DatabaseQueue?
    @Published var searchText = ""
    
    
    func searchWithText() {
        if searchText.isEmpty {
            loadAllData()
        } else {
            let lowercaseSearchText = searchText.lowercased()
            let filteredProducts = products.filter { product in
                let lowercasedName = product.name.lowercased()
                let lowercasedBrand = product.brand.lowercased()
                return lowercasedName.contains(lowercaseSearchText) || lowercasedBrand.contains(lowercaseSearchText)
            }
            self.products = filteredProducts
        }
    }
    
    //MARK: - Sorting Feature
    enum SortingOptions{
        case byBrand
        case byCost
        case byWarranty
        case byHdmiCount
        case byUsbCount
        case byScreenSize
        case byAudioPower
        case byRefreshRate
        case byResolution
        case byPowerConsumption
        case byCiScore
        case byRank
    }
    
    func sortProducts(by sortingOption: SortingOptions) {
        var sortedProducts: [TVItem]
            switch sortingOption {
            case .byBrand:
                sortedProducts = products.sorted { $0.brand < $1.brand }
            case .byWarranty:
                sortedProducts =  products.sorted { $0.warranty < $1.warranty }
            case .byCost:
                sortedProducts = products.sorted { $0.cost < $1.cost }
            case .byHdmiCount:
                sortedProducts = products.sorted { $0.hdmiCount < $1.hdmiCount }
            case .byUsbCount:
                sortedProducts = products.sorted { $0.usbCount < $1.usbCount }
            case .byScreenSize:
                sortedProducts = products.sorted { $0.screenSize < $1.screenSize }
            case .byAudioPower:
                sortedProducts = products.sorted { $0.audioPower < $1.audioPower }
            case .byRefreshRate:
                sortedProducts = products.sorted { $0.refrshRate < $1.refrshRate }
            case .byResolution:
                sortedProducts = products.sorted { $0.screenResolution < $1.screenResolution }
            case .byPowerConsumption:
                sortedProducts = products.sorted { $0.powerConsumption < $1.powerConsumption }
            case .byCiScore:
                sortedProducts = products.sorted { $0.ciScore < $1.ciScore }
            case .byRank:
                sortedProducts = products.sorted { $0.rank < $1.rank }
            }
        self.products = sortedProducts
        }
    
    func reloadAndSortProducts(by sortingOption: SortingOptions){
        sortProducts(by: sortingOption)
    }
    
    
    
    //MARK: - Database Integration
    func setDatabaseQueue() {
        dbQueue = try? getDatabaseQueue()
        
    }
    
    private func getDatabaseQueue() throws -> DatabaseQueue{
        let fileManager = FileManager.default
        
        let dbPath = try fileManager.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("dataset.sqlite").path
        
        if !fileManager.fileExists(atPath: dbPath){
            let dbResourcePath = Bundle.main.path(forResource: "dataset", ofType: "sqlite")!
            
            try fileManager.copyItem(atPath: dbResourcePath, toPath: dbPath)
        }
        return try DatabaseQueue(path: dbPath)
    }
    
    func loadAllData() {
        var loadedProducts: [TVItem] = []
        
        try? dbQueue?.read { db in
            let rows = try Row.fetchAll(db, sql: "SELECT * FROM TvDataset ORDER BY Ranking")
            
            for row in rows {
                loadedProducts.append(TVItem(
                    name: row[0],
                    brand: row[1],
                    warranty: row[2],
                    hdmiCount: row[3],
                    usbCount: row[4],
                    screenSize: row[5],
                    audioPower: row[6],
                    refrshRate: row[7],
                    screenResolution: row[8],
                    powerConsumption: row[9],
                    cost: row[10],
                    cpuCoreCount: row[11],
                    wifiSpecs: row[12],
                    screenType: row[13],
                    isSmart: row[14],
                    hdmiType: row[15],
                    ciScore: row[16],
                    rank: row[17],
                    imageUrl: row[18]
                ))
            }
        }
        
        DispatchQueue.main.async {
            self.products = loadedProducts
        }
    }
}
