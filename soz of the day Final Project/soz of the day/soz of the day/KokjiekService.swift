import Foundation
import Alamofire

nonisolated
struct FeedModel: Decodable {
    let id: Int
    let title: String
    let description: String
    let thumbnail: String
    let url: String
}

protocol KokjiekServiceDelegate: AnyObject {
    func didUpdateFeed(_ feed: [FeedModel])
}

class KokjiekService {
    weak var delegate: KokjiekServiceDelegate?

    func fetchFeeds(count: Int) {
        var tempFeed: [FeedModel] = []
        let group = DispatchGroup()

        for i in 0..<count {
            group.enter()
            let url = "https://kokjiek-feed-default-rtdb.asia-southeast1.firebasedatabase.app/\(i).json"
            AF.request(url).responseDecodable(of: FeedModel.self) { resp in
                defer { group.leave() }
                if let video = resp.value { tempFeed.append(video) }
            }
        }

        group.notify(queue: .main) { [weak self] in
            self?.delegate?.didUpdateFeed(tempFeed.sorted { $0.id < $1.id })
        }
    }
}
