//
//  drinks.swift
//  SLOOP
//
//  Created by Miriam Peinado on 20/4/22.
//

import Foundation
import SwiftUI

// Adding Codable conformance makes it easier to move data between the structure and a data file. You’ll rely on the Decodable component of the Codable protocol later in this section to read data from file.

struct Drink: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var Caffeine_mg: String
    var Amount_ml: Double
    var mg_100_ml: Double
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
