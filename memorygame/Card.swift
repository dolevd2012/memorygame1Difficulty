import Foundation



class Card{
    var animalName:String
    var flipped:Bool
    
    init() {
        self.animalName=""
        self.flipped=false
    }
    
    init(animalName: String) {
        self.animalName = animalName
        self.flipped=false
    }
}
