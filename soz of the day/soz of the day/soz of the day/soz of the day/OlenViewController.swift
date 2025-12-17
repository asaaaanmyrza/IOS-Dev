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
    private var timer: Timer?
    private var seconds = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        olenService.delegate = self
        
        startTimer()
    }
    
    func startTimer() {
        olenService.fetchOlen()
        olenTimer.text = "Kelesi olen: \(seconds)"

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }

            self.seconds -= 1
            self.olenTimer.text = "Kelesi olen: \(self.seconds)"

            if self.seconds == 0 {
                self.seconds = 30
                self.olenService.fetchOlen()
            }
        }
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
