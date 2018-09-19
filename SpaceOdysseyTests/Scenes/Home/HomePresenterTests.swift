//
//  HomePresenterTests.swift
//  SpaceOdyssey
//
//  Created by Martin Lukacs on 19/09/2018.
//  Copyright (c) 2018 martin. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import SpaceOdyssey
import XCTest

class HomePresenterTests: XCTestCase {
  // MARK: Subject under test
  
  var sut: HomePresenter!
  
  // MARK: Test lifecycle
  
  override func setUp() {
    super.setUp()
    setupHomePresenter()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupHomePresenter() {
    sut = HomePresenter()
  }
  
  // MARK: Test doubles
  
  class HomeDisplayLogicSpy: HomeDisplayLogic {
    var displaySomethingCalled = false
    
    func displaySomething(viewModel: Home.Something.ViewModel) {
      displaySomethingCalled = true
    }
  }
  
  // MARK: Tests
  
  func testPresentSomething() {
    // Given
    let spy = HomeDisplayLogicSpy()
    sut.viewController = spy
    let response = Home.Something.Response()
    
    // When
    sut.presentSomething(response: response)
    
    // Then
    XCTAssertTrue(spy.displaySomethingCalled, "presentSomething(response:) should ask the view controller to display the result")
  }
}