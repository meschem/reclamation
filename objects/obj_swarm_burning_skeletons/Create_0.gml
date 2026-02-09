/// @description Init

event_inherited()

swarms = [
    new swarmGroupCollection(
        [
            new swarmGroup(obj_burning_skeleton, 16),
        ],
        2
    ),
    
    new swarmGroupCollection(
        [
            new swarmGroup(obj_burning_skeleton, 16),
            new swarmGroup(obj_burning_skeleton_warrior, 16),
        ],
        5
    ),
    
    new swarmGroupCollection(
        [
            new swarmGroup(obj_burning_skeleton, 15),
            new swarmGroup(obj_burning_skeleton_warrior, 15),
            new swarmGroup(obj_burning_skeleton_champion, 5),
        ],
        9
    ),
]
