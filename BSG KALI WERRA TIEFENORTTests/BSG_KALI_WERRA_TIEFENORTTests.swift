//
//  BSG_KALI_WERRA_TIEFENORTTests.swift
//  BSG KALI WERRA TIEFENORTTests
//
//  Created by Jan Morgenweck on 15.07.24.
//

//
//  BSG_KALI_WERRA_TIEFENORTTests.swift
//  BSG KALI WERRA TIEFENORTTests
//
//  Created by Jan Morgenweck on 15.07.24.
//

import XCTest
@testable import BSG_KALI_WERRA_TIEFENORT

final class BSG_KALI_WERRA_TIEFENORTTests: XCTestCase {
    
    var viewModel: NewsViewModel!
    var mockStore: MockFireStoreClient!
    
    override func setUp() {
        super.setUp()
        mockStore = MockFireStoreClient()
    }
    
    override func tearDown() {
        viewModel = nil
        mockStore = nil
        super.tearDown()
    }
    
    func testFetchNewsSuccess() async {
        // Arrange: Vorbereiten der Testdaten
        mockStore.shouldThrowError = false
        
        // Act: Aufruf der fetchNews-Methode
        await MainActor.run {
                    viewModel = NewsViewModel(store: mockStore)
                }
        await viewModel.fetchNews()
        
        // Assert: Überprüfen, ob die Daten korrekt geladen wurden
        await MainActor.run {
            XCTAssertFalse(viewModel.news.isEmpty)
            XCTAssertEqual(viewModel.news.count, 2)
            XCTAssertEqual(viewModel.news[0].header, "News Title 1")
            XCTAssertEqual(viewModel.news[1].header, "News Title 2")
            XCTAssertNil(viewModel.error)
        }
    }
    
    func testFetchNewsFailure() async {
        // Arrange: Simulieren eines Fehlers
        mockStore.shouldThrowError = true
        
        // Act: Aufruf der fetchNews-Methode
        await MainActor.run {
                    viewModel = NewsViewModel(store: mockStore)
                }
        await viewModel.fetchNews()
        
        // Assert: Überprüfen, ob ein Fehler aufgetreten ist
        await MainActor.run {
            XCTAssertTrue(viewModel.news.isEmpty)
            XCTAssertNotNil(viewModel.error)
        }
    }
}

