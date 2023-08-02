//
//  ViewController.swift
//  URLSession'Image'
//
//  Created by Edgar Sargsyan on 04.07.23.
//

import UIKit

class ViewController: UIViewController {
    var imageWidth  = ""
    var imageHeight = ""
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func imageButton(_ sender: Any) {
        //1) API
        let API = "https://picsum.photos/" + imageWidth + "/" + imageHeight
        //2) sargel URL (get zapros)
        guard let apiURL = URL(string: API) else {
            fatalError("some Error")
        }
        //3) init sesia
        let session = URLSession(configuration: .default)
        //4)  Data task
        let task = session.dataTask(with: apiURL){ (data,response, error) in
            //5)  dannineri vera.
            guard let data = data, error == nil else {return}
            DispatchQueue.main.async {
                // data = .jpg
                self.imageView.image = UIImage(data: data)
            }
            
        }
        
        task.resume()
        
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let height = imageView.bounds.height
        // Stringy uni metor format vorde asumenq inchqan znak ylni storaketic heto , esi sidjey flota  sarqumenq double  storaketic heto zronery hanumenq
        self.imageHeight = String(format: "%.0f", Double(height))
        let width = imageView.bounds.width
        self.imageWidth = String(format: "%.0f", Double(width))
    }


}

