import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var filterBackground: UIView!
    @IBOutlet weak var videoBackgroundWebView: UIWebView!
    
    @IBOutlet weak var loginBtn:  UIButton!
    @IBOutlet weak var joinUsBtn: UIButton!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setVideoBackground()
        self.setBackgroundFilter()
        self.setButtons()
    }
    
    // MARK: - Interface
    
    private func setVideoBackground() {
        let htmlName = "WebViewContent"
        guard let htmlPath = Bundle.main.path(forResource: htmlName, ofType: "html") else { return }
        let htmlURL = URL(fileURLWithPath: htmlPath)
        guard let html = try? Data(contentsOf: htmlURL) else { return }
        
        self.videoBackgroundWebView.load(html, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: htmlURL.deletingLastPathComponent())
    }
    
    private func setBackgroundFilter() {
        self.filterBackground.backgroundColor = UIColor.black
        self.filterBackground.alpha = 0.5
    }
    
    private func setButtons() {
        self.setButtonInterface(loginBtn)
        self.setButtonInterface(joinUsBtn)
    }
    
    private func setButtonInterface(_ button: UIButton) {
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 2
    }
}


