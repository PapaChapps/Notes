//
//  videoListController.swift
//  anotherTableViewapp
//
//  Created by Makay Chapple on 12/18/18.
//  Copyright © 2018 Makay Chapple. All rights reserved.
//

import UIKit

class videoListController: UIViewController {
    
 var videos: [Video] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func creatArray() -> [Video] {
        var tempVideos: [Video] = []
        let video1 = Video(image: UIImage(named: "beginner-first-app")!, title: "the first app")
        let video2 = Video(image: UIImage(named: "dev-setup")!, title: "")
        let video3 = Video(image: UIImage(named: "int-overview")!, title: "")
        let video4 = Video(image: UIImage(named: "ss-delagates")!, title: "")
        let video5 = Video(image: UIImage(named: "ss-uipickerview")!, title: "")
        let video6 = Video(image: UIImage(named: "vlog-4")!, title: "")

        tempVideos.append(video1)
        tempVideos.append(video2)
        tempVideos.append(video3)
        tempVideos.append(video4)
        tempVideos.append(video5)
        tempVideos.append(video6)
     
        return tempVideos
    }

}

extension videoListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
}
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let video = videos[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell") as! videoCell
        
        cell.setVideo(video: video)
        
        return cell
    }
}
