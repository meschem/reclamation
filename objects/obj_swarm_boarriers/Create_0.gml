/// @description Init

event_inherited()

swarms = [
    new swarmGroupCollection(
        [
            new swarmGroup(obj_boarrior, 8),
        ],
        3,
        [
            enumBiomes.forest,
            enumBiomes.plains
        ]
    ),
    
    new swarmGroupCollection(
        [
            new swarmGroup(obj_boarrior, 10),
            new swarmGroup(obj_boarrior_emerald, 6),
        ],
        5,
        [
            enumBiomes.forest,
            enumBiomes.plains
        ]
    ),
    
    new swarmGroupCollection(
        [
            new swarmGroup(obj_boarrior_emerald, 12)
        ],
        8,
        [
            enumBiomes.forest,
            enumBiomes.plains
        ]
    ),
]
