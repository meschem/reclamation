/// @description Init

event_inherited()

swarms = [
    new swarmGroupCollection(
        [
            new swarmGroup(obj_skeleton, 10),
            new swarmGroup(obj_skeleton_warrior, 2)
        ],
        0
    ),

    new swarmGroupCollection(
        [
            new swarmGroup(obj_skeleton, 16),
            new swarmGroup(obj_skeleton_warrior, 4),
            new swarmGroup(obj_gold_skeleton_warrior, 1, 0.33)
        ],
        1
    ),
    
    new swarmGroupCollection(
        [
            new swarmGroup(obj_skeleton, 4),
            new swarmGroup(obj_skeleton_warrior, 15),
            new swarmGroup(obj_gold_skeleton_warrior, 2, 0.33)
        ],
        4
    ),
    
    new swarmGroupCollection(
        [
            new swarmGroup(obj_skeleton, 20),
            new swarmGroup(obj_skeleton_warrior, 12),
            new swarmGroup(obj_skeleton_champion, 4),
            new swarmGroup(obj_gold_skeleton_warrior, 5, 0.33)
        ],
        8
    ),
    
    new swarmGroupCollection(
        [
            new swarmGroup(obj_dark_skeleton_warrior, 30),
            new swarmGroup(obj_gold_skeleton_warrior, 5, 0.33)
        ],
        10
    ),
    
    new swarmGroupCollection(
        [
            new swarmGroup(obj_skeleton_champion, 16),
            new swarmGroup(obj_gold_skeleton_warrior, 8, 0.33)
        ],
        12
    )
]
