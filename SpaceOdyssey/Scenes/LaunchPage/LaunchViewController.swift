//
//  LaunchViewController.swift
//  SpaceOdyssey
//
//  Created by Martin Lukacs on 23/09/2018.
//  Copyright (c) 2018 martin. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import youtube_ios_player_helper

protocol LaunchDisplayLogic: class {
    func displayLaunch(viewModel: LaunchPage.GetLaunch.ViewModel)
}

final class LaunchViewController: UIViewController, LaunchDisplayLogic {
    var interactor: LaunchBusinessLogic?
    var router: (NSObjectProtocol & LaunchRoutingLogic & LaunchDataPassing)?
    
    // MARK: OUtlets
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var playerContainerView: UIView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblSuccess: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    // MARK: Variables
    
    private let playerView = YTPlayerView()
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = LaunchInteractor()
        let presenter = LaunchPresenter()
        let router = LaunchRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    private func setUpUI() {
        playerContainerView.addSubview(playerView)
        playerView.frame = playerContainerView.bounds
        playerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        playerView.backgroundColor = Style.Color.MainGray
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getLaunch()
    }
    
    // MARK: Launch Display
    
    /// Get launch information
    func getLaunch() {
        let request = LaunchPage.GetLaunch.Request()
        interactor?.getLaunch(request: request)
    }
    
    /// Display the launch information on view
    ///
    /// - Parameter viewModel: ViewModel containing the information to display about the current selected launch
    func displayLaunch(viewModel: LaunchPage.GetLaunch.ViewModel) {
        lblTitle.text = viewModel.displayedLaunch.title
        lblDate.text = viewModel.displayedLaunch.date
        lblSuccess.text = viewModel.displayedLaunch.success ? "Success" : "Fail"
        lblDescription.text = viewModel.displayedLaunch.description
        title = viewModel.displayedLaunch.title
        guard playerView.videoUrl() == nil, let videoId = viewModel.displayedLaunch.videoUrl else { return }
        playerView.load(withVideoId: videoId)
    }
}
