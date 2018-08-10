import UIKit

protocol ChoseImageDelegate {
    func tapOnImage(name: String, image: UIImage, color: UIColor)
}

class SecondViewController: UIViewController {
    
    
    private var tapPikachuGestureRecognizer: UITapGestureRecognizer = .init()
    private var tapChermanderGestureRecognizer: UITapGestureRecognizer = .init()
    private var tapBulbasaurGestureRecognizer: UITapGestureRecognizer = .init()

    @IBOutlet weak var pikachuLabel: UILabel!
    
    @IBOutlet weak var charmanderLabel: UILabel!
    
    @IBOutlet weak var bulbasaurLabel: UILabel!
    
    
    @IBOutlet weak var pikachuImage: UIImageView! {
        didSet {
        oldValue?.removeGestureRecognizer(tapPikachuGestureRecognizer)
        pikachuImage.addGestureRecognizer(tapPikachuGestureRecognizer)
        }
    }
    
    
    @IBOutlet weak var charmanderImage: UIImageView!{
        didSet {
        oldValue?.removeGestureRecognizer(tapChermanderGestureRecognizer)
        charmanderImage.addGestureRecognizer(tapChermanderGestureRecognizer)
        }
    }
    
    
    @IBOutlet weak var bulbasaurImage: UIImageView! {
        didSet {
            oldValue?.removeGestureRecognizer(tapBulbasaurGestureRecognizer)
            bulbasaurImage.addGestureRecognizer(tapBulbasaurGestureRecognizer)
        }
    }
    
    var tapOnImageDelegate: ChoseImageDelegate!
    
    override func viewDidLoad() {
        print ("загрузка SecondViewController")
        super.viewDidLoad()
        
        pikachuImage.isUserInteractionEnabled = true
        tapPikachuGestureRecognizer.addTarget(self, action: #selector(pikachuImageTapped))
        
        charmanderImage.isUserInteractionEnabled = true
        tapChermanderGestureRecognizer.addTarget(self, action: #selector(chermanderImageTapped))
        
        bulbasaurImage.isUserInteractionEnabled = true
        tapBulbasaurGestureRecognizer.addTarget(self, action: #selector(bulbasaurImageTapped))
        
    }
    
    
    @IBAction func dismissSecondViewController(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    deinit {
        print("Second View Controller Deinited")
    }
    
    @objc func pikachuImageTapped(_ sender: UITapGestureRecognizer) {
        print("нажали pikachuImageTapped")
        if let tapedImage = (sender.view as! UIImageView).image {
            tapOnImageDelegate.tapOnImage(name: "Pikachu", image: tapedImage, color: .yellow )
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func chermanderImageTapped(_ sender: UITapGestureRecognizer) {
        print("нажали chermanderImageTapped")
        if let tapedImage = (sender.view as! UIImageView).image {
            tapOnImageDelegate.tapOnImage(name: "Charmander", image: tapedImage, color: .red )
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func bulbasaurImageTapped(_ sender: UITapGestureRecognizer) {
        print("нажали bulbasaurImageTapped")
        if (sender.view as! UIImageView).image != nil {
        tapOnImageDelegate.tapOnImage(name: "Bulbasaur", image: (sender.view as! UIImageView).image!, color: .green )
        }
        self.dismiss(animated: true, completion: nil)
    
    }
}

