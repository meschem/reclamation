/// @description Init

event_inherited()

swarms = [
    new swarmGroupCollection(
        [
            new swarmGroup(obj_zombie, 30),
        ],
        3
    ),
    
    new swarmGroupCollection(
        [
            new swarmGroup(obj_zombie, 20),
            new swarmGroup(obj_zombie_elite, 20),
        ],
        7
    ),

    new swarmGroupCollection(
        [
            new swarmGroup(obj_zombie, 30),
            new swarmGroup(obj_zombie_huge, 4),
        ],
        9
    ),

    new swarmGroupCollection(
        [
            new swarmGroup(obj_zombie, 30),
            new swarmGroup(obj_zombie_elite, 15),
            new swarmGroup(obj_zombie_huge, 10)
        ],
        13
    )
]
