import GildedRoseProject


// MARK: -- Items

let normalItem = Item(
    name: "+5 Dexterity Vest",
    sellIn: 10,
    quality: 20
)

let normalItemWithNegativeSellIn = Item(
    name: "+5 Dexterity Vest",
    sellIn: -2,
    quality: 18
)

let normalItemWithLowQuality = Item(
    name: "+5 Dexterity Vest",
    sellIn: -2,
    quality: 1
)


// MARK: -- Aged Brie

let agedBrie = Item(
    name: "Aged Brie",
    sellIn: 2,
    quality: 0
)

let agedBrieWithHighQuality = Item(
    name: "Aged Brie",
    sellIn: -2,
    quality: 50
)

// MARK: -- Sulfuras

let sulfurasItem = Item(
    name: "Sulfuras, Hand of Ragnaros",
    sellIn: 0,
    quality: 80
)


// MARK: -- Backstage passes

let backstageItem = Item(
    name: "Backstage passes to a TAFKAL80ETC concert",
    sellIn: 15,
    quality: 20
)

let backstageItemCloseToConcert = Item(
    name: "Backstage passes to a TAFKAL80ETC concert",
    sellIn: 6,
    quality: 24
)

let backstageItemOneDayBeforeConcert = Item(
    name: "Backstage passes to a TAFKAL80ETC concert",
    sellIn: 5,
    quality: 44
)

let backstageItemOneDayBeforeConcertWithHighQuality = Item(
    name: "Backstage passes to a TAFKAL80ETC concert",
    sellIn: 1,
    quality: 49
)

let backstageItemWithConcertToday = Item(
    name: "Backstage passes to a TAFKAL80ETC concert",
    sellIn: -2,
    quality: 44
)


// MARK: -- Conjured items

let conjuredItem = Item(
    name: "Conjured Mana Cake",
    sellIn: 3,
    quality: 6
)

let conjuredItemWithNegativeSellIn = Item(
    name: "Conjured Mana Cake",
    sellIn: -3,
    quality: 6
)

let conjuredItemWithLowQuality = Item(
    name: "Conjured Mana Cake",
    sellIn: -1,
    quality: 2
)

