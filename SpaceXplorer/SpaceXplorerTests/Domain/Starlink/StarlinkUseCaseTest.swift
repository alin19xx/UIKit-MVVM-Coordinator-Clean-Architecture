//
//  StarlinkUseCaseTest.swift
//  SpaceXplorerTests
//
//  Created by Alex Lin Segarra on 29/12/24.
//

import XCTest
@testable import SpaceXplorer

final class StarlinkUseCaseTest: XCTestCase {
    
    func testStarlinkUseCase_when_success() async {
        // GIVEN
        let repository = StarlinkRepositorySuccessMock()
        let useCase = DefaultStarlinkUseCase(repository: repository)
        
        do {
            // WHEN
            let satellites = try await useCase.execute()
            
            // THEN
            XCTAssertEqual(satellites.count, 3, "There should be exactly 3 Starlink satellites in the mock data")
            
            let satellite1 = satellites[0]
            XCTAssertEqual(satellite1.id, "5eed770f096e59000698560d", "The first satellite ID should match")
//            XCTAssertEqual(satellite1.name, "STARLINK-30", "The first satellite name should match")
            XCTAssertNil(satellite1.latitude, "The latitude for the first satellite should be nil")
            XCTAssertNil(satellite1.longitude, "The longitude for the first satellite should be nil")
            
            let satellite2 = satellites[1]
            XCTAssertEqual(satellite2.id, "5eed770f096e59000698560e", "The second satellite ID should match")
//            XCTAssertEqual(satellite2.name, "STARLINK-74", "The second satellite name should match")
            XCTAssertNil(satellite2.latitude, "The latitude for the second satellite should be nil")
            XCTAssertNil(satellite2.longitude, "The longitude for the second satellite should be nil")
        } catch {
            XCTFail("Expected success but got error: \(error)")
        }
    }
}
