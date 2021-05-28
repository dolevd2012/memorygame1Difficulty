//
//  CollectionViewCell.swift
//  memorygame
//
//  Created by user196688 on 5/4/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    
    @IBOutlet private weak var cardImage: UIImageView!
    func configure(with card:Card){
        //print(card.animalName)
    }
    
    
    func checkCard(card: Card){
            cardImage.image = UIImage(named: card.animalName)
        
    }
    func Reverse(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.cardImage.image = UIImage(named: "card4")
        
        })
    }
}
