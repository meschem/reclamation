/// @description Init

event_inherited()

swarms = [
    new swarmGroupCollection(
        [
            new swarmGroup(obj_poison_skeleton, 10),
            new swarmGroup(obj_greater_serpent_green, 5),
        ],
        6,
        [
            enumBiomes.marsh
        ]
    ),
    
    new swarmGroupCollection(
        [
            new swarmGroup(obj_burning_skeleton, 10),
            new swarmGroup(obj_greater_serpent, 6),
        ],
        7,
        [
            enumBiomes.forest,
            enumBiomes.plains,
        ]
    ),
    
    new swarmGroupCollection(
        [
            new swarmGroup(obj_greater_serpent_green, 20),
        ],
        12,
        [
            enumBiomes.marsh
        ]
    ),
    
    new swarmGroupCollection(
        [
            new swarmGroup(obj_greater_serpent, 20),
        ],
        13,
        [
            enumBiomes.forest,
            enumBiomes.plains,
        ]
    ),
]
