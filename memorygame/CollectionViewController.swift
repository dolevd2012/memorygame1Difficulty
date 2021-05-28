//
//  CollectionViewController.swift
//  memorygame
//
//  Created by user196688 on 5/4/21.
//

import UIKit

private let reuseIdentifier = "Cell"

var array: [String] = ["pig","pig","snake","snake","cat","cat","eagle","eagle","sheep","sheep","zebra","zebra","hyena","hyena","rabbit","rabbit"]
var cardsArray: [Card] = []
var firstCard = Card.init(animalName:  "EmptyFirstCard")
var firstCardCellIndex: IndexPath!
var firstCardArrayIndex: Int = 0
var secondCard = Card.init(animalName: "")
var count : Int = 0
var sectionFooterr: SectionFooter? = nil
var timer : Int = 0
class CollectionViewController: UICollectionViewController {
var timerInterval:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<array.count{
            cardsArray.append(Card.init(animalName: array[i]))
        }
        cardsArray.shuffle()
        

    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardsArray.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if let customeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell{
            
            customeCell.configure(with: cardsArray[indexPath.row])
            cell = customeCell
            
        }
        
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            
            if let sectionFooter = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "FooterView", for: indexPath)as? SectionFooter{
                sectionFooter.sectionFooterlabel.text = "round number: 0"
                sectionFooterr = sectionFooter
                timerInterval = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(action), userInfo: nil, repeats: true)
                
                return sectionFooterr!
            }
        
        /// Normally should never get here
        return UICollectionReusableView()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let currentcell = collectionView.cellForItem(at: indexPath)as! CollectionViewCell

        let cardSelected = cardsArray[indexPath.row]
          
        
        
        if(secondCard.animalName == "EmptySecondCard" && cardSelected.flipped == false){
            secondCard.animalName = cardSelected.animalName
            cardSelected.flipped = true
            currentcell.checkCard(card: secondCard)
            //We have 2 cards fliped in our board
            if(secondCard.animalName != firstCard.animalName )
            {
                cardsArray[firstCardArrayIndex].flipped = false
                cardSelected.flipped = false
                
                currentcell.Reverse()
                let previousCell = collectionView.cellForItem(at: firstCardCellIndex)as! CollectionViewCell
                previousCell.Reverse()
                count = count + 1
                sectionFooterr!.sectionFooterlabel.text = "round number: \(count)"
                
            }
            else {
                count = count + 1
                if checkGameOver() == true {
                    sectionFooterr!.sectionFooterlabel.text = "Game Completed In \(count) Rounds"

                }
                else {
                sectionFooterr!.sectionFooterlabel.text = "round number: \(count)"
                }
                
            }
        }
        if(firstCard.animalName == "EmptyFirstCard"  && cardSelected.flipped == false){
            firstCard.animalName = cardSelected.animalName
            cardSelected.flipped = true
            currentcell.checkCard(card: firstCard)
            secondCard.animalName = "EmptySecondCard"
            //helping us recall the last cell we picked on the board
            firstCardCellIndex = indexPath
            firstCardArrayIndex = indexPath.row
            
        }
        // after both cards were played we reset the cards selection
        if(firstCard.animalName != "EmptyFirstCard" &&  secondCard.animalName != "EmptySecondCard"){
            firstCard.animalName = "EmptyFirstCard"
        }
        
    }
    func checkGameOver() -> Bool{
        var c : Int = 0
        for i in 0..<cardsArray.count{
            if(cardsArray[i].flipped == true){
                c = c + 1
                if(c == 16){
                    timerInterval?.invalidate()
                   return true
                }
            }
            
        }
        return false
    }
    @objc func action(){
        sectionFooterr!.timer.text = "timer: \(timer+1)"
        timer = timer + 1
        
    }

    
}