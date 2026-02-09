/// @description Init

event_inherited()

swarms = [
    new swarmGroupCollection(
        [
            new swarmGroup(obj_wraith, 10),
        ],
        2
    ),
    
    new swarmGroupCollection(
        [
            new swarmGroup(obj_wraith, 15),
            new swarmGroup(obj_reaper, 5),
        ],
        4
    ),
    
    new swarmGroupCollection(
        [
            new swarmGroup(obj_reaper, 20),
        ],
        7
    )
]
