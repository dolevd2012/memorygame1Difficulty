//
//  FirstController.swift
//  memorygame
//
//  Created by user196688 on 5/15/21.
//

import UIKit

class FirstController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        playButton.addTarget(self, action: #selector(playButtonClicked), for: .touchUpInside)

    }
    
    @objc func playButtonClicked() {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let controller = story.instantiateViewController(identifier: "CollectionViewController")as! CollectionViewController
        let navigation = UINavigationController(rootViewController: controller)
        self.view.addSubview(navigation.view)
        self.addChild(navigation)
        navigation.didMove(toParent: self)
        
    }
    


}
