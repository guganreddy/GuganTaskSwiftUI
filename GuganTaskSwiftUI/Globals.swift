//
//  Globals.swift
//  GuganTaskSwiftUI
//
//  Created by Hoffensoft on 03/09/24.
//

import Foundation

class SharedInstance {
   

    static var shared = SharedInstance()
    
    var bankingData: ModelData = ModelData(data: [])
    
    func getmodelData() -> ModelData {
        if let path = Bundle.main.path(forResource: "ModelData", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                  let jsonResult = try JSONDecoder().decode( ModelData.self, from: data)
                  if  jsonResult != nil {
                      bankingData = jsonResult;
                           print(jsonResult)
                      return bankingData
                  }
              } catch {
                   // handle error
              }
        }
        return bankingData
    }
}
