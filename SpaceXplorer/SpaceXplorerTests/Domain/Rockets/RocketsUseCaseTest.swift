//
//  RocketsUseCaseTest.swift
//  SpaceXplorerTests
//
//  Created by Alex Lin Segarra on 29/12/24.
//

import XCTest
@testable import SpaceXplorer

final class RocketsUseCaseTest: XCTestCase {
    
    func testRocketsUseCase_when_success() async {
        // GIVEN
        let repository = RocketsRepositorySuccessMock()
        let useCase = DefaultRocketsUseCase(repository: repository)
        
        do {
            // WHEN
            let rockets = try await useCase.execute()
            
            // THEN
            XCTAssertEqual(rockets.count, 1, "There should be exactly one rocket in the mock data")
            
            let rocket = rockets.first
            XCTAssertNotNil(rocket, "Rocket should not be nil")
            XCTAssertEqual(rocket?.name, "Falcon 1", "The rocket name should match")
            XCTAssertEqual(rocket?.active, false, "The rocket should not be active")
            XCTAssertEqual(rocket?.flickrImages, [
                            "https://imgur.com/DaCfMsj.jpg",
                            "https://imgur.com/azYafd8.jpg"
                        ], "The Flickr images should match")
        } catch {
            XCTFail("Expected success but got error: \(error)")
        }
    }
}
