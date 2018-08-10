import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var choosePokemonImage: UIImageView!{
        didSet {
            print("загрузка choosePokemoneImage")
        }
    }
    
    
    @IBOutlet weak var nameOfChosenPokemonLable: UILabel!{
        didSet {
            print("загрузка nameOfChosenPokemonLable")
        }
    }
    
    override func viewDidLoad() {
        print("загрузка view")
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func ChoosePokemon(_ sender: UIButton) {
        print("загрузка ChoosePokemone")
        let selectPokemonVC = storyboard?.instantiateViewController(withIdentifier: "secondViewController") as! SecondViewController
        selectPokemonVC.tapOnImageDelegate = self
        present(selectPokemonVC, animated: true, completion : nil)
    }
    
    deinit {
        print("View Controller Deinited")
    }
}

extension ViewController:  ChoseImageDelegate {
    
    func tapOnImage(name: String, image: UIImage, color: UIColor) {
        print("нажали tapOnImage")
        print(name)
        nameOfChosenPokemonLable.text = name
        choosePokemonImage.image = image
        self.view.backgroundColor = color
    }
}

    
    



