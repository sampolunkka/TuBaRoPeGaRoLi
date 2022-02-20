/// @description THINKING
// You can write your code in this editor

step = 0;
var delay = 20;

var targets = find_battlers(obj_Ally);
var n = array_length(targets);
var i = irandom_range(0, n-1);
target = targets[i];

burrowing = true;


//NEXT
alarm[step + 1] = delay;