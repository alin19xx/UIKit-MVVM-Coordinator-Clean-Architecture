//
//  LaunchesUseCaseTest.swift
//  SpaceXplorerTests
//
//  Created by Alex Lin Segarra on 29/12/24.
//

import XCTest
@testable import SpaceXplorer

final class LaunchesUseCaseTest: XCTestCase {
    
    func testLaunchesUseCase_when_success() async {
        // GIVEN
        let repository = LaunchesRepositorySuccessMock(data: LaunchesMock.makeJsonMock())
        let useCase = DefaultLaunchesUseCase(repository: repository)
        
        do {
            // WHEN
            let page = try await useCase.execute(limit: 5)
            
            // THEN
            XCTAssertEqual(page.totalItems, 205, "Total items in the mock should be 7")
            XCTAssertEqual(page.limit, 5, "The limit should match the request")
            XCTAssertEqual(page.offset, 5, "Offset should reflect the total fetched items")
            XCTAssertTrue(page.hasNextPage, "There should be more pages available")
            XCTAssertFalse(page.hasPrevPage, "There should not be a previous page")
            XCTAssertEqual(page.items.count, 5, "The number of items should match the limit")
        } catch {
            XCTFail("Expected success but got error: \(error)")
        }
    }
    
    func testLandPadUseCase_when_last_page() async {
        // GIVEN
        let repository = LaunchesRepositorySuccessMock(data: LaunchesLastPageMock.makeJsonMock())
        let useCase = DefaultLaunchesUseCase(repository: repository)
        
        do {
            // WHEN
            let page = try await useCase.execute(limit: 5)
            
            // THEN
            XCTAssertEqual(page.totalItems, 205, "Total items in the mock should be 7")
            XCTAssertEqual(page.limit, 5, "The limit should match the request")
            XCTAssertEqual(page.offset, 205, "Offset should reflect the total fetched items")
            XCTAssertFalse(page.hasNextPage, "There should not be more pages available")
        } catch {
            XCTFail("Expected success but got error: \(error)")
        }
    }
    
    func testLandPadUseCase_when_empty_docs_after_last_page() async {
        // GIVEN
        let repository = LaunchesRepositorySuccessMock(data: LaunchesNoMoreDocsMock.makeJsonMock())
        let useCase = DefaultLaunchesUseCase(repository: repository)
        
        do {
            // WHEN
            let page = try await useCase.execute(limit: 5)
            
            // THEN
            XCTAssertEqual(page.totalItems, 205, "Total items in the mock should be 7")
            XCTAssertEqual(page.limit, 5, "The limit should match the request")
            XCTAssertEqual(page.offset, 205, "Offset should reflect the total fetched items")
            XCTAssertFalse(page.hasNextPage, "There should not be more pages available")
            XCTAssertTrue(page.hasPrevPage, "There should be a previous page")
            XCTAssertEqual(page.items.count, 0, "Items should be empty for the last page")
        } catch {
            XCTFail("Expected success but got error: \(error)")
        }
    }
}
