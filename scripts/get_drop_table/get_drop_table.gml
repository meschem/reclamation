///@description                             Gets an array of drop rarities based on enemy type and magic find
///@param {real} _dropType                  Type of drop that effectively converts a type to a percentage. Uses enumDropType.
///@return {array<struct.lootDropRoll>}
function get_drop_table(_dropType) {
    enum enumDropType {
        baddiePest,
        baddieFodder,
        baddieHeavy,
        baddieSuperHeavy,
        baddieElite,
        baddieUnique,
        baddieFieldBoss,
        baddieDungeonBoss
    }
    
    switch (_dropType) {
        case enumDropType.baddieElite:
            return [
                new lootDropRoll(1.00, enumRarity.normal, 0.15),
                new lootDropRoll(0.5, enumRarity.normal, 0.05),
                new lootDropRoll(0.5, enumRarity.normal, 0),
                new lootDropRoll(0.25, enumRarity.normal, 0),
            ]

        case enumDropType.baddieUnique:
            return [
                new lootDropRoll(1.00, enumRarity.normal, 0.25),
                new lootDropRoll(0.5, enumRarity.normal, 0.10),
                new lootDropRoll(0.5, enumRarity.normal, 0.1),
                new lootDropRoll(0.25, enumRarity.normal, 0),
            ]
                     
        case enumDropType.baddieFieldBoss:
            return [
                new lootDropRoll(1.00, enumRarity.magic, 0.25),
                new lootDropRoll(0.90, enumRarity.normal, 0.15),
                new lootDropRoll(0.75, enumRarity.normal, 0.1),
                new lootDropRoll(0.25, enumRarity.normal, 0),
            ]
            
        case enumDropType.baddieDungeonBoss:
            return [
                new lootDropRoll(1.00, enumRarity.rare, 0.5),
                new lootDropRoll(1.00, enumRarity.normal, 0.4),
                new lootDropRoll(0.75, enumRarity.normal, 0.25),
                new lootDropRoll(0.50, enumRarity.normal, 0.1),
                new lootDropRoll(0.25, enumRarity.normal, 0.1),
            ]
        
    }
    
    return []
}