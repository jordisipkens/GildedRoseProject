@testable import GildedRoseProject
import XCTest
import Foundation

class GildedRoseTests: XCTestCase {    
    
    // MARK: - Unit Tests
    
    // One function to test all default situations
    func testAllTypesOfItems_whenDayPasses_shouldMutateByGivenQuality() throws {
        try? testGivenItem_whenDayPasses_shouldResultInGivenQuantity(
            item: normalItem,
            quantity: normalItem.quality - 1
        )
        
        try? testGivenItem_whenDayPasses_shouldResultInGivenQuantity(
            item: agedBrie,
            quantity: agedBrie.quality + 1
        )
        
        try? testGivenItem_whenDayPasses_shouldResultInGivenQuantity(
            item: backstageItem,
            quantity: backstageItem.quality + 1
        )
        
        try? testGivenItem_whenDayPasses_shouldResultInGivenQuantity(
            item: conjuredItem,
            quantity: conjuredItem.quality - 2
        )
    }
    
    
    // MARK: -- Items
    
    // SellIn is negative, so quality decreases by two every day now
    func testItem_whenSellInIsNegative_decreaseQualityByTwo() throws {
        try? testGivenItem_whenDayPasses_shouldResultInGivenQuantity(
            item: normalItemWithNegativeSellIn,
            quantity: normalItemWithNegativeSellIn.quality - 2
        )
    }
    
    func testItem_whenQualityGoesNegative_resetQualityToLowestQuality() throws {
        try? testGivenItem_whenDayPasses_shouldResultInGivenQuantity(
            item: normalItemWithLowQuality,
            quantity: ItemConst.minItemQuality
        )
    }
    
    
    // MARK: -- Aged Brie
    
    func testAgedBrie_whenQualitySurpassesMax_capQualityAtMax() throws {
        try? testGivenItem_whenDayPasses_shouldResultInGivenQuantity(
            item: agedBrieWithHighQuality,
            quantity: ItemConst.maxItemQuality
        )
    }
    
    
    // MARK: -- Sulfuras Items
    
    func testSulfurasItemType_whenDayPasses_shouldNotMutateQualityOrSellInValue() throws {
        let items = [sulfurasItem]
        let originalQuality = items[0].quality
        let originalSellIn = items[0].sellIn
        let app = GildedRose(items: items)
        
        app.updateQuality()
        
        XCTAssertEqual(items[0].quality, originalQuality)
        XCTAssertEqual(items[0].sellIn, originalSellIn)
    }
    
   
    // MARK: -- Backstage passes
    
    // 10 to 6 days should increase quality by 2
    func testBackstagePass_whenLessThenTenDaysRemain_shouldIncreaseByTwo() throws {
        try? testGivenItem_whenDayPasses_shouldResultInGivenQuantity(
            item: backstageItemCloseToConcert,
            quantity: backstageItemCloseToConcert.quality + 2
        )
    }
    
    // 5 to 0 days should increase quality by 3
    func testBackstagePass_whenOneDayBeforeConcert_shouldIncreaseByThree() throws {
        try? testGivenItem_whenDayPasses_shouldResultInGivenQuantity(
            item: backstageItemOneDayBeforeConcert,
            quantity: backstageItemOneDayBeforeConcert.quality + 3
        )
    }
    
    // if the quality increases above 50, reset it to max value which is currently 50
    func testBackstagePass_whenOneDayBeforeConcertWithHighQuality_shouldCapAtMax() throws {
        try? testGivenItem_whenDayPasses_shouldResultInGivenQuantity(
            item: backstageItemOneDayBeforeConcertWithHighQuality,
            quantity: ItemConst.maxItemQuality)
    }
    
    // The concert will pass, so the quality should be the minimal value
    func testBackstagePass_whenConcertHasPassed_QualityShouldBeMinValue() throws {
        try? testGivenItem_whenDayPasses_shouldResultInGivenQuantity(item: backstageItemWithConcertToday, quantity: ItemConst.minItemQuality)
    }
    
    
    // MARK: -- Conjured items
    
    func testConjuredItem_whenSellInIsNegative_QualityShouldDegradeByFour() throws {
        try? testGivenItem_whenDayPasses_shouldResultInGivenQuantity(
            item: conjuredItemWithNegativeSellIn,
            quantity: conjuredItemWithNegativeSellIn.quality - 4
        )
    }
    
    func testConjuredItem_whenQualityGoesNegative_resetQualityToLowestQuality() throws {
        try? testGivenItem_whenDayPasses_shouldResultInGivenQuantity(
            item: conjuredItemWithLowQuality,
            quantity: ItemConst.minItemQuality
        )
    }
    
    
    // MARK: -- Test SellIn values
    
    func testOtherItemTypes_whenDayPasses_shouldDecreaseSellInByOne() throws {
        let items = [normalItem, agedBrie, backstageItem, conjuredItem]
        let app = GildedRose(items: items)
        let originalSellInValues = items.map { $0.sellIn }
        
        app.updateQuality()
        
        items.indices.forEach { index in
            XCTAssertEqual(items[index].sellIn, originalSellInValues[index] - 1)
        }
    }
    
    
    // MARK: - Reusable testable function!
    
    func testGivenItem_whenDayPasses_shouldResultInGivenQuantity(item: Item, quantity: Int) throws {
        let items = [item]
        let app = GildedRose(items: items)
        
        // Day passes
        app.updateQuality()
        
        XCTAssertEqual(items[0].quality, quantity)
    }
}
