import UIKit
import Kingfisher

class OlenViewController: UIViewController {

    @IBOutlet weak var olenTimer: UILabel!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var olenQaz: UITextView!
    @IBOutlet weak var olenEn: UITextView!
    @IBOutlet weak var olenDescription: UITextView!
    @IBOutlet weak var authorImage: UIImageView!
    
    var olenService = OlenService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        olenService.delegate = self
    }
    @IBAction func buttonDidTap(_ sender: UIButton) {
        olenService.fetchOlen()
    }
}

extension OlenViewController: OlenServiceDelegate {
    func onOlenDidUpdate(olen: OlenModel) {
        configure(olen: olen)
    }
    
    func configure(olen: OlenModel) {
        authorName.text = olen.author
        authorImage.kf.setImage(with: URL(string: olen.author_image))
        
        olenQaz.text = olen.q_text
        olenEn.text = olen.en_text
        
        olenDescription.text = olen.description
        
        
    }
}
