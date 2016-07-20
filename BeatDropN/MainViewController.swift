//
//  ViewController.swift
//  BeatDropN
//
//  Created by Brian Tang on 7/9/16.
//  Copyright © 2016 bytLabs. All rights reserved.
//

import UIKit
import Alamofire
import BoxContentSDK
import RxSwift
import RxCocoa

class MainViewController: UITableViewController {
    
    let controllerFactory: ControllerFactory!
    let userManager: UserManager!
    let disposeBag = DisposeBag()
    var tracks: [HypeTrack]?
    
    init(
        controllerFactory: ControllerFactory!,
        tracksStream: HypeTracksStream!,
        userManager: UserManager!) {
        self.controllerFactory = controllerFactory
        self.userManager = userManager
        super.init(nibName: "Main", bundle: nil)
        
        tracksStream.tracks()
            .observeOn(MainScheduler.instance)
            .subscribeNext({ tracks in
                self.tracks = tracks
                self.tableView.reloadData()
            })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(UINib(nibName: "HypeTrackCell", bundle: nil), forCellReuseIdentifier: "HypeTrackCell")
//        userManager.authenticate()
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let tracks = tracks {
            return tracks.count
        }
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HypeTrackCell") as! HypeTrackCell
        let artist = tracks?[indexPath.row].artist ?? ""
        let title = tracks?[indexPath.row].title ?? ""
        cell.trackLabel.text = "\(artist) - \(title)"
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

