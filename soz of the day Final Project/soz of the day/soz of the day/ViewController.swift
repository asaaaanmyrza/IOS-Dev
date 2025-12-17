//
//  ViewController.swift
//  soz of the day
//
//  Created by Асан Мырзахметов on 04.12.2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


//// MARK: - Сервис
//struct KokjiekService {
//    func fetchFeed(completion: @escaping ([FeedModel]) -> Void) {
//        let urlString = "https://example.com/your-json.json"
//        AF.request(urlString)
//            .validate()
//            .responseDecodable(of: [FeedModel].self) { response in
//                switch response.result {
//                case .success(let feedArray):
//                    completion(feedArray)
//                case .failure(let error):
//                    debugPrint(error)
//                    completion([])
//                }
//            }
//    }
//}
//
//// MARK: - ViewController
//class KokjiekViewController: UIViewController {
//
//    @IBOutlet weak var KokjiekTableView: UITableView!
//
//    private var feed: [FeedModel] = []
//    private let service = KokjiekService()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        KokjiekTableView.dataSource = self
//
//        service.fetchFeed { [weak self] feedArray in
//            guard let self = self else { return }
//            self.feed = feedArray
//            DispatchQueue.main.async {
//                self.KokjiekTableView.reloadData()
//            }
//        }
//    }
//}

