//
//  KokjiekViewController.swift
//  soz of the day
//
//  Created by Асан Мырзахметов on 10.12.2025.
//

import UIKit

class KokjiekViewController: UIViewController {
    
    @IBOutlet weak var KokjiekTableView: UITableView!
    
    public var feed: [FeedModel] = []
    private var service = KokjiekService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        KokjiekTableView.dataSource = self
        service.delegate = self
        service.fetchFeeds(count: 10)
        KokjiekTableView.delegate = self
    }
}

extension KokjiekViewController: KokjiekServiceDelegate {
    func didUpdateFeed(_ feed: [FeedModel]) {
        self.feed = feed
        KokjiekTableView.reloadData()
    }
}

extension KokjiekViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = KokjiekTableView.dequeueReusableCell(withIdentifier: "kokjiekId") as! KokjiekViewCell
        let currentVideo = feed[indexPath.row]
        cell.configure(with: currentVideo)
        return cell
    }
}

extension KokjiekViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let video = feed[indexPath.row]
        if let url = URL(string: video.url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
