import Foundation
import Alamofire

nonisolated
struct OlenModel: Decodable {
    let id: Int
    
    let author: String
    let author_image: String
    
    let q_text: String
    let en_text: String
    
    let description: String
}

protocol OlenServiceDelegate {
    func onOlenDidUpdate(olen: OlenModel)
}

struct OlenService {
    var delegate: OlenServiceDelegate?
    
    func fetchOlen() {
        let randomId = Int.random(in: 1...21)
        let urlString = "https://olen-of-the-day-default-rtdb.asia-southeast1.firebasedatabase.app/olen/\(randomId).json"
        AF.request(urlString).responseDecodable(of: OlenModel.self) { response in
            switch response.result {
            case .success(let olen):
                delegate?.onOlenDidUpdate(olen: olen)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
