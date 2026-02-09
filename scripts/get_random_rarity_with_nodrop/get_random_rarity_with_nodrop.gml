///@description                             Gets a random rarity that can include a nodrop
///@param {real} _dropType                  Type of drop that effectively converts a type to a percentage. Uses enumNoDropType.
///@param {real} _magicFind                 Boost to magic find
///@param {real} _minRarity                 Min rarity of drop
function get_random_rarity_with_nodrop(_dropType, _magicFind = 0, _minRarity = enumRarity.normal)
{
    var _noDropChance = 1
    
    //enum enumNoDropType {
        //baddiePest,
        //baddieFodder,
        //baddieHeavy,
        //baddieSuperHeavy,
        //baddieElite,
        //baddieUnique,
        //baddieFieldBoss,
        //baddieDungeonBoss
    //}
    
    switch (_dropType) {
        case enumNoDropType.baddiePest:         _noDropChance = 1;    break;
        case enumNoDropType.baddieFodder:       _noDropChance = 0.99; break;
        case enumNoDropType.baddieHeavy:        _noDropChance = 0.97; break;
        case enumNoDropType.baddieSuperHeavy:   _noDropChance = 0.95; break;
        case enumNoDropType.baddieElite:        _noDropChance = 0.95; break;
        case enumNoDropType.baddieUnique:       _noDropChance = 0.95; break;
        case enumNoDropType.baddieFieldBoss:    _noDropChance = 0.95; break;
        case enumNoDropType.baddieDungeonBoss:  _noDropChance = 0.95; break;
    }
}