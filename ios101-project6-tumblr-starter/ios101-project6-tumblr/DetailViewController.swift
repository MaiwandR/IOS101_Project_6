import UIKit
import Nuke

class DetailViewController: UIViewController {

    @IBOutlet weak var big_img: UIImageView!
    @IBOutlet weak var big_txt: UITextView!

    var post: Post?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Post received in detail: \(String(describing: post))") 
        
        title = "Post Details"
        navigationController?.navigationBar.prefersLargeTitles = true

        big_txt.isEditable = false
        big_txt.isScrollEnabled = true

        guard let post = post else { return }

        // Clean up HTML tags from the caption
        big_txt.text = post.caption.trimHTMLTags()
        
        // Load the image using Nuke
        if let pic = post.photos.first {
            let url = pic.originalSize.url
            Nuke.loadImage(with: url, into: big_img)
        }
    }
}
