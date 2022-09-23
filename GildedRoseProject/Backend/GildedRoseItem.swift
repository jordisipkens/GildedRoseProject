import Foundation


protocol GildedRoseItem {
    var name: String { get set }
    var sellIn: Int { get set }
    var quality: Int { get set  }
    var type: ItemType { get }
}

extension Item: GildedRoseItem {
    var type: ItemType {
        switch self.name {
            case "Aged Brie":
                return ItemType.cheese
            case "Backstage passes to a TAFKAL80ETC concert":
                return ItemType.tickets
            case "Sulfuras, Hand of Ragnaros":
                return ItemType.legendary
            case "Conjured Mana Cake":
                return ItemType.conjured
            default:
                return ItemType.normal
        }
    }
}

enum ItemType {
    case normal
    case legendary
    case tickets
    case cheese
    case conjured
    
    func calculateMutationRate(sellIn days: Int) -> Int {
        var mutation = 0
        
        switch self {
            case .normal:
                mutation = days < 0 ? -2 : -1
            case .legendary:
                mutation = 0
            case .tickets:
                mutation = 1
                if days < 11 {
                    mutation = 2
                    if days < 6 {
                        mutation = 3
                        if days < 0 {
                            mutation = 0
                        }
                    }
                }
                return mutation
            case .cheese:
                mutation = 1
            case .conjured:
                mutation = days < 0 ? -4 : -2
        }
        return mutation
    }
}
