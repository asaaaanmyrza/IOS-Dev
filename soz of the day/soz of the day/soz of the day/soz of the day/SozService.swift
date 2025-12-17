import Foundation
import Alamofire

nonisolated
struct SozModel: Codable {
    let id: Int
    let word: String
    let description: String
    let examples: [String]
}

protocol SozServiceDelegate {
    func onSozDidUpdate(soz: SozModel)
}

struct SozService {

    var delegate: SozServiceDelegate?

    func fetchSoz() {
        let randomId = Int.random(in: 1...21)
        let urlString = "https://soz-of-the-day-default-rtdb.asia-southeast1.firebasedatabase.app/soz/\(randomId).json"
        AF.request(urlString).responseDecodable(of: SozModel.self) { response in
            switch response.result {
            case .success(let soz):
                delegate?.onSozDidUpdate(soz: soz)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
