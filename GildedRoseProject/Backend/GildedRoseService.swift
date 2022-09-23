enum ItemConst {
    static let maxItemQuality = 50
    static let minItemQuality = 0
}

public class GildedRose {
    var items: [Item]
    
    public init(items: [Item]) {
        self.items = items
    }
    
    public func updateQuality() {
        items.forEach { item in
            item.quality += item.type.calculateMutationRate(sellIn: item.sellIn)
            
            if item.type == .legendary {
                return
            }
            
            item.sellIn -= 1
            
            if item.sellIn < 0 && item.type == .tickets {
                item.quality = 0
            }
            
            if item.quality < ItemConst.minItemQuality {
                item.quality = ItemConst.minItemQuality
            }
            
            if item.quality > ItemConst.maxItemQuality {
                item.quality = ItemConst.maxItemQuality
            }
        }
    }
}
