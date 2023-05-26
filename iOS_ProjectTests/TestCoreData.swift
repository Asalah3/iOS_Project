//
//  TestCoreData.swift
//  iOS_ProjectTests
//
//  Created by Asalah Sayed on 26/05/2023.
//

import XCTest
@testable import iOS_Project
final class TestCoreData: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetFavouritesResult(){
        // Given
        FavouriteItems.favouriteItems.InsertItem(favouriteName: "name", favouriteId: 1, favouriteImage: "favouriteImage", favouriteMealCheif: "favouriteMealCheif", favouriteMealType: "favouriteMealType", favouriteServings: "favouriteServings")
        // When
        let result = FavouriteItems.favouriteItems.fetchFavouriteItems()
        // Then
        XCTAssertNotEqual(result.count, 0)

    }
    
    func testInsertItem(){
        // Given
        FavouriteItems.favouriteItems.InsertItem(favouriteName: "name", favouriteId: 1, favouriteImage: "favouriteImage", favouriteMealCheif: "favouriteMealCheif", favouriteMealType: "favouriteMealType", favouriteServings: "favouriteServings")
        // When
        let result = FavouriteItems.favouriteItems.fetchFavouriteItems()
        // Then
        XCTAssertNotEqual(result.count, 0)

    }
    
    func testDeleteItemById(){
        // Given
        FavouriteItems.favouriteItems.InsertItem(favouriteName: "name", favouriteId: 12, favouriteImage: "favouriteImage", favouriteMealCheif: "favouriteMealCheif", favouriteMealType: "favouriteMealType", favouriteServings: "favouriteServings")
        FavouriteItems.favouriteItems.InsertItem(favouriteName: "name", favouriteId: 2, favouriteImage: "favouriteImage", favouriteMealCheif: "favouriteMealCheif", favouriteMealType: "favouriteMealType", favouriteServings: "favouriteServings")
        FavouriteItems.favouriteItems.deleteItemById(favouriteId: 12)
        // When
        let result = FavouriteItems.favouriteItems.checkIfInserted(favouriteId: 12)
        // Then
        XCTAssertNotEqual(result, true)
    }
    func testCheckIfInserted(){
        // Given
        FavouriteItems.favouriteItems.InsertItem(favouriteName: "name", favouriteId: 1, favouriteImage: "favouriteImage", favouriteMealCheif: "favouriteMealCheif", favouriteMealType: "favouriteMealType", favouriteServings: "favouriteServings")
        FavouriteItems.favouriteItems.InsertItem(favouriteName: "name", favouriteId: 2, favouriteImage: "favouriteImage", favouriteMealCheif: "favouriteMealCheif", favouriteMealType: "favouriteMealType", favouriteServings: "favouriteServings")
        // When
        let result = FavouriteItems.favouriteItems.checkIfInserted(favouriteId: 1)
        // Then
        XCTAssertEqual(result, true)
    }

}
