/// @description Decide attack

sporeCooldown--;
if (sporeCooldown <= 0) {
	sporulatio();
	resolve_turn();
	sporeCooldown = sporeCooldownMax;
} else {
	resolve_turn();
}