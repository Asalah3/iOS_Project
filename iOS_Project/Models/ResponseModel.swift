//
//  SimilaritiesRecipe.swift
//  testApi
//
//  Created by Asalah Sayed on 27/05/2023.
//

import Foundation

struct Meal: Codable {
    let thumbnailAltText: String?
    let videoURL: String?
    let language: String?
    let numServings: Int?
    let instructions: [Instruction]?
    let thumbnailURL: String?
    let country: String?
    let id: Int?
    let sections: [Section]?
    let originalVideoURL: String?
    let description, name: String?

    enum CodingKeys: String, CodingKey {
        case thumbnailAltText = "thumbnail_alt_text"
        case videoURL = "video_url"
        case language
        case numServings = "num_servings"
        case instructions
        case thumbnailURL = "thumbnail_url"
        case country, id
        case sections
        case originalVideoURL = "original_video_url"
        case description, name
    }
}


// MARK: - Instruction
struct Instruction: Codable {
    let endTime: Int?
    let temperature, appliance: String?
    let id: Int?
    let displayText: String?
    let position, startTime: Int?

    enum CodingKeys: String, CodingKey {
        case endTime = "end_time"
        case temperature, appliance, id
        case displayText = "display_text"
        case position
        case startTime = "start_time"
    }
}


// MARK: - Section
struct Section: Codable {
    let components: [Component]?
    let name: String?
    let position: Int?
}

// MARK: - Component
struct Component: Codable {
    let rawText, extraComment: String?
    let position: Int?
    let measurements: [Measurement]?
    let ingredient: Ingredient?
    let id: Int?

    enum CodingKeys: String, CodingKey {
        case rawText = "raw_text"
        case extraComment = "extra_comment"
        case position, measurements, ingredient, id
    }
}

// MARK: - Ingredient
struct Ingredient: Codable {
    let updatedAt, id: Int?
    let name, displaySingular, displayPlural: String?
    let createdAt: Int?

    enum CodingKeys: String, CodingKey {
        case updatedAt = "updated_at"
        case id, name
        case displaySingular = "display_singular"
        case displayPlural = "display_plural"
        case createdAt = "created_at"
    }
}

// MARK: - Measurement
struct Measurement: Codable {
    let id: Int
    let quantity: String
    let unit: Unit
}

// MARK: - Unit
struct Unit: Codable {
    let name, abbreviation, displaySingular, displayPlural: String
    let system: System

    enum CodingKeys: String, CodingKey {
        case name, abbreviation
        case displaySingular = "display_singular"
        case displayPlural = "display_plural"
        case system
    }
}

enum System: String, Codable {
    case imperial = "imperial"
    case metric = "metric"
    case none = "none"
}
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

struct SimilaritiesRecipe:Decodable {
    let count: Int?
    let results: [SimilaritiesRecipeResult]?
}

// MARK: - Result
struct SimilaritiesRecipeResult :Decodable{
    let videoID: Int?
    let name: String?
    let originalVideoURL: String?
    let numServings: Int?
    let thumbnailURL: String?
    let videoURL: String?
    let id: Int?
    let description: String?
    enum CodingKeys: String, CodingKey {
        case numServings = "num_servings"
        case videoID = "video_id"
        case id
        case name
        case description
        case thumbnailURL = "thumbnail_url"
        case videoURL = "video_url"
        case originalVideoURL = "original_video_url"
    }
}

