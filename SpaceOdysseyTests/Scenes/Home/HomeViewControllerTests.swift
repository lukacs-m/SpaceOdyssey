//
//  HomeViewControllerTests.swift
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
import Quick
import Nimble

class HomeViewControllerTests: QuickSpec {
    
    override func spec() {
        
        describe("HomeViewController tests") {
            
            // MARK: Subject under test
            
            var sut: HomeViewController!
            var window: UIWindow!
            let layout = UICollectionViewFlowLayout()
            
            // MARK: Test setup
            
            func setupHomeViewController() {
                sut = HomeViewController()
            }
            
            beforeSuite {
                LaunchesNetworkInjector.networkManager = LaunchesNetworkManagerMock()
            }
            
            afterSuite {
                LaunchesNetworkInjector.networkManager = LaunchesNetworkManager()
            }
            
            beforeEach {
                window = UIWindow(frame: UIScreen.main.bounds)
                setupHomeViewController()
            }
            
            afterEach {
                window = nil
            }
            
            func loadview() {
                window.addSubview(sut.view)
                sut.beginAppearanceTransition(true, animated: false)
                sut.endAppearanceTransition()
            }
            
            // MARK: Test doubles
            
            class HomeBusinessLogicSpy: HomeBusinessLogic {
                var fetchHomeLaunchesCalled = false
                
<<<<<<< HEAD
                
                func fetchHomeLaunches(request: Home.FetchHomeLaunches.Request) {
                    fetchHomeLaunchesCalled = true
                }
=======
                func fetchHomeLaunches(request: Home.FetchHomeLaunches.Request) {
                    fetchHomeLaunchesCalled = true
                }
                
                func fetchHomeSortedLaunches(request: Home.FetchHomeLaunches.Request) {
                    
                }
                
                func fetchSearchLaunches(request: Home.SearchLaunches.Request) {
                    
                }
>>>>>>> develop
            }
            
            //MARK: - Test
            
            context("When view is loaded") {
                it("Should be a HomeViewController") {
                    expect(sut).to(beAKindOf(HomeViewController.self))
                }
                
                it("Should fetch space x launches informations on start") {
                    let homeBusinessLogicSpy = HomeBusinessLogicSpy()
                    sut.interactor = homeBusinessLogicSpy
                    
                    loadview()
                    
                    expect(homeBusinessLogicSpy.fetchHomeLaunchesCalled).to(beTrue())
                }
            }
            
            context("When collection view is loaded") {
                
                it("Should have one section in Collection View") {
                    loadview()

                    // Given
                    let collectionView = sut.collectionView

                    // When
<<<<<<< HEAD
                    let numberOfSections = sut.numSections(in: collectionView!)
=======
                    let numberOfSections = sut.numSections(in: collectionView)
>>>>>>> develop

                    expect(numberOfSections) == 1
                }
                
                it("Should have two rows in section of collectionView") {
                    // Given
                    loadview()
                    
                    let displayedLaunches = [Home.FetchHomeLaunches.ViewModel.DisplayedLaunch(name: "Test", date: "Date", imgUrl: nil),Home.FetchHomeLaunches.ViewModel.DisplayedLaunch(name: "Test2", date: "Date2", imgUrl: nil) ]

                    let viewModel = Home.FetchHomeLaunches.ViewModel(displayedLaunches: displayedLaunches, error: nil)

                    sut.displayHomeLaunches(viewModel: viewModel)

                    // When
                    let numberOfRows = sut.collectionView.numberOfItems(inSection: 0)

                    expect(numberOfRows) == displayedLaunches.count
                }
                
                it("Should be HomeCollectionViewCell") {
                    loadview()

                    // Given
                    let collectionView = sut.collectionView

                    let displayedLaunches = [Home.FetchHomeLaunches.ViewModel.DisplayedLaunch(name: "Test", date: "Date", imgUrl: nil),Home.FetchHomeLaunches.ViewModel.DisplayedLaunch(name: "Test2", date: "Date2", imgUrl: nil) ]

                    let viewModel = Home.FetchHomeLaunches.ViewModel(displayedLaunches: displayedLaunches, error: nil)

                    sut.displayHomeLaunches(viewModel: viewModel)

                    // When
<<<<<<< HEAD
                    let cell = sut.collectionView(collectionView!, cellForItemAt: IndexPath(row: 0, section: 0))
=======
                    let cell = sut.collectionView(collectionView, cellForItemAt: IndexPath(row: 0, section: 0))
>>>>>>> develop

                    expect(cell).to(beAKindOf(HomeCollectionViewCell.self))
                }
            }
        }
    }
}
