// Inherit the parent event
event_inherited();

for (var i = 0; i < array_length(wakes); i++) {
    if (instance_exists(wakes[i])) {
        instance_destroy(wakes[i])
    }
}
