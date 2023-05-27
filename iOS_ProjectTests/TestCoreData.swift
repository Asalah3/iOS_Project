//
//  TestCoreData.swift
//  iOS_ProjectTests
//
//  Created by Asalah Sayed on 26/05/2023.
//

import XCTest
@testable import iOS_Project
final class TestCoreData: XCTestCase {

    var favouriteItems: LocalDataSourceProtocol?
    override func setUp()  {
        favouriteItems = LocalDataSource()
    }

    override func tearDown()  {
        favouriteItems = nil
    }
    
    func testGetFavouritesResult(){
        // Given
        favouriteItems?.InsertItem(favouriteName: "name", favouriteId: 1, favouriteImage: "favouriteImage", favouriteMealCheif: "favouriteMealCheif", favouriteMealType: "favouriteMealType", favouriteServings: "favouriteServings")
        // When
        let result = favouriteItems?.fetchFavouriteItems()
        // Then
        XCTAssertNotEqual(result?.count, 0)

    }
    
    func testInsertItem(){
        // Given
        favouriteItems?.InsertItem(favouriteName: "name", favouriteId: 1, favouriteImage: "favouriteImage", favouriteMealCheif: "favouriteMealCheif", favouriteMealType: "favouriteMealType", favouriteServings: "favouriteServings")
        // When
        let result = favouriteItems?.fetchFavouriteItems()
        // Then
        XCTAssertNotEqual(result?.count, 0)

    }
    
    func testDeleteItemById(){
        // Given
        favouriteItems?.InsertItem(favouriteName: "name", favouriteId: 12, favouriteImage: "favouriteImage", favouriteMealCheif: "favouriteMealCheif", favouriteMealType: "favouriteMealType", favouriteServings: "favouriteServings")
        favouriteItems?.InsertItem(favouriteName: "name", favouriteId: 2, favouriteImage: "favouriteImage", favouriteMealCheif: "favouriteMealCheif", favouriteMealType: "favouriteMealType", favouriteServings: "favouriteServings")
        favouriteItems?.deleteItemById(favouriteId: 12)
        // When
        let result = favouriteItems?.checkIfInserted(favouriteId: 12)
        // Then
        XCTAssertNotEqual(result, true)
    }
    func testCheckIfInserted(){
        // Given
        favouriteItems?.InsertItem(favouriteName: "name", favouriteId: 1, favouriteImage: "favouriteImage", favouriteMealCheif: "favouriteMealCheif", favouriteMealType: "favouriteMealType", favouriteServings: "favouriteServings")
        favouriteItems?.InsertItem(favouriteName: "name", favouriteId: 2, favouriteImage: "favouriteImage", favouriteMealCheif: "favouriteMealCheif", favouriteMealType: "favouriteMealType", favouriteServings: "favouriteServings")
        // When
        let result = favouriteItems?.checkIfInserted(favouriteId: 1)
        // Then
        XCTAssertEqual(result, true)
    }

}
