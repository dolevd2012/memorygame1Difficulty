//
//  FirstController.swift
//  memorygame
//
//  Created by user196688 on 5/15/21.
//

import UIKit

class FirstController: UIViewController {

    @IBOutlet weak var playNormalButton: UIButton!
    @IBOutlet weak var playHardButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func NormalButtonClicked(_ sender: Any) {
        UserDefaults.standard.setValue("Normal", forKey: "Difficulty")
        let story = UIStoryboard(name: "Main", bundle: nil)
        let controller = story.instantiateViewController(identifier: "CollectionViewController")as! CollectionViewController
        let navigation = UINavigationController(rootViewController: controller)
        self.view.addSubview(navigation.view)
        self.addChild(navigation)
        navigation.didMove(toParent: self)
    }
    
    @IBAction func HardButtonClicked(_ sender: Any) {
        UserDefaults.standard.setValue("Hard", forKey: "Difficulty")
        let story = UIStoryboard(name: "Main", bundle: nil)
        let controller = story.instantiateViewController(identifier: "CollectionViewController")as! CollectionViewController
        let navigation = UINavigationController(rootViewController: controller)
        self.view.addSubview(navigation.view)
        self.addChild(navigation)
        navigation.didMove(toParent: self)
    }
    
    

}
