//
//  ResponseModel.swift
//  iOS_Project
//
//  Created by Esraa AbdElfatah on 27/05/2023.
//


import Foundation

// MARK: - Response
struct Categories:Decodable {
    let count: Int?
    let results: [Result]?
}

// MARK: - Result
struct Result :Decodable{
    let videoID: Int?
    let name: String?
    let originalVideoURL: String?
    let numServings: Int?
    let keywords: String?
    let showID: Int?
    let canonicalID: String?
    let inspiredByURL: String?
    let seoTitle: String?
    let isShoppable: Bool?
    let thumbnailURL: String?
    let videoURL: String?
    let updatedAt: Int?
    let yields: String?
    let isOneTop: Bool?
    let id: Int?
    let approvedAt: Int?
    let totalTimeMinutes: Int?
    let slug: String?
    let createdAt: Int?
    let description: String?
    let recipes: [Recipe]?
}




// MARK: - Recipe
struct Recipe :Decodable{
    
    let prepTimeMinutes: Int?
    let numServings: Int?
    let thumbnailURL: String?
    let totalTimeMinutes: Int?
    let videoURL: String?
    let servingsNounPlural: String?
       let createdAt, approvedAt: Int?
    let beautyURL: String?
    let recipeID, id: Int?
    let isOneTop: Bool?
    let seoTitle: String?
    let yields: String?
    let tipsAndRatingsEnabled: Bool?
    let canonicalID: String?
    let videoID: Int?
    let slug: String?
    let showID: Int?
    let keywords: String?
    let isShoppable: Bool?
    let thumbnailAltText: String?
    let originalVideoURL: String?
    let name: String?
    let buzzID: Int?
    let inspiredByURL: String?
    let cookTimeMinutes: Int?
    let description: String?
    let servingsNounSingular: String?
}




// MARK: - Section
struct Section {
    let components: [Component]?
    let name: String?
    let position: Int?
}

// MARK: - Component
struct Component {
    let id, position: Int?
    let measurements: [Measurement]?
    let rawText, extraComment: String?
    let ingredient: Ingredient?
}

// MARK: - Ingredient
struct Ingredient {
    let updatedAt: Int?
    let name: String?
    let createdAt: Int?
    let displayPlural: String?
    let id: Int?
    let displaySingular: String?
}

// MARK: - Measurement
struct Measurement {
    let unit: Unit?
    let quantity: String?
    let id: Int?
}

// MARK: - Unit
struct Unit {
    let displayPlural: DisplayPlural?
    let displaySingular, abbreviation: Abbreviation?
    let system: System?
    let name: UnitName?
}

enum Abbreviation {
    case aDash
    case bunch
    case c
    case can
    case cup
    case egg
    case empty
    case g
    case kg
    case lb
    case loaf
    case mL
    case oz
    case pinch
    case slice
    case stick
    case strip
    case tablespoon
    case tbsp
    case teaspoon
    case tsp
}

enum DisplayPlural {
    case bunches
    case cans
    case cups
    case dashes
    case eggs
    case empty
    case g
    case kg
    case lb
    case loaves
    case mL
    case oz
    case pinches
    case slices
    case sticks
    case strips
    case tablespoons
    case teaspoons
}

enum UnitName {
    case aDash
    case bunch
    case can
    case cup
    case egg
    case empty
    case gram
    case kilogram
    case loaf
    case milliliter
    case ounce
    case pinch
    case pound
    case slice
    case stick
    case strip
    case tablespoon
    case teaspoon
}

enum System {
    case imperial
    case metric
    case none
}

// MARK: - Tag
struct Tag {
    let rootTagType: RootTagTypeEnum?
    let name: String?
    let id: Int?
    let displayName: String?
    let type: RootTagTypeEnum?
}

enum RootTagTypeEnum {
    case appliance
    case asian
    case businessTags
    case cookingStyle
    case cuisine
    case dietary
    case difficulty
    case equipment
    case european
    case featurePage
    case healthy
    case holiday
    case holidays
    case meal
    case occasion
    case seasonal
}

// MARK: - TotalTimeTier
struct TotalTimeTier {
    let tier, displayTier: String?
}

enum TypeEnum {
    case recipe
}

// MARK: - UserRatings
struct UserRatings {
    let countPositive: Int?
    let score: Double?
    let countNegative: Int?
}

enum RecipeVideoAdContent {
    case editorialSponsorship
    case none
    case undetermined
}

enum ServingsNounSingular {
    case biscuit
    case pancake
    case serving
    case waffle
}

// MARK: - Topic
struct Topic {
    let name, slug: String?
}

enum ResultVideoAdContent {
    case coBranded
    case none
}
