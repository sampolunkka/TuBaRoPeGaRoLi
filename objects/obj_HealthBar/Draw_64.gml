/// @description Insert description here
// You can write your code in this editor
if (instance_exists(ConBattleControl)) {
draw_set_alpha(1);
draw_set_font(font);

x =  54 + 34 * owner.partyIndex;
y = 96;

label_x = x - 5;
label_y = y + 19;

hp_bar_x = x - 6;
hp_bar_y = y + 26;

xp_bar_x = x - 2;
xp_bar_y = y + 14;

label_colour = c_white;
label_string = label;

hp_bar_w = 24;
hp_bar_fill_w = round(hp_bar_w * (hp / maxHp) - 1);

xp_bar_w = 21;
xp_bar_fill_w = min(xp_bar_w, round(xp_bar_w * (xp / xpMax))) - 2;

mugshot_x = x - 8;
mugshot_y = y + 9;

//LOOK FOR HP
if (owner != noone) {
	hp		=	owner.hp;
	maxHp	=	owner.maxHp;
	xp		=	owner.xp;
	xpMax	=	owner.xpToLevel;
	lvl		=	owner.level;
	spirit	=	owner.spirit;
}


//HUD CHARACTER HIGHLIGHT
if ( BattleControl.orderPhase && activeBattler != noone) {
	if ( activeBattler.id == owner.id) {
		draw_set_alpha(0.2);
		draw_sprite(spr_guiHighlight, 0, x - 9, y + 6);
		draw_set_alpha(1);
	}
}


//LABEL STRING
draw_text_color(label_x + 1, label_y + 1, label_string, c_black, c_black, c_blue, c_black, 1);
draw_set_color(label_colour);
draw_text(label_x, label_y, label_string);

//HP BAR
draw_sprite_stretched(spr_healthBarBase, 1, hp_bar_x, hp_bar_y, hp_bar_w, 3);
draw_sprite_stretched(spr_healthBarFill, 0, hp_bar_x, hp_bar_y+1, hp_bar_fill_w, 1);

//HP BAR BORDER
draw_sprite(spr_healthBarBase, 0, hp_bar_x, hp_bar_y);
draw_sprite(spr_healthBarBase, 0, hp_bar_x + hp_bar_w, hp_bar_y);

//BHP AR BLIP
var blip_x = max(hp_bar_x, hp_bar_x + hp_bar_fill_w);
draw_sprite(spr_healtBarBlip, 0, blip_x, hp_bar_y+1);
/*
//HP STRING
var str = string(hp);// + "/" + string(maxHp);
hp_x = x + 2;
hp_y = y - 3;
hp_alpha = 1;

draw_text_color(hp_x + 1, hp_y + 1, str, c_black, c_black, c_blue, c_black, 1);
draw_set_alpha(hp_alpha);
draw_set_color(c_white);
draw_text(hp_x, hp_y, str);
draw_set_alpha(1);
*/
//EXP BAR
draw_sprite_stretched(spr_expBar, 1, xp_bar_x, xp_bar_y, xp_bar_w, 3);
draw_sprite_stretched(spr_expBar, 0, xp_bar_x+1, xp_bar_y+1, xp_bar_fill_w, 1);

//LV TEXT	
str = "€" + string(lvl);
lv_x = xp_bar_x + xp_bar_w - (string_width(str));
lv_y = y + 8;

draw_text_color(lv_x + 1, lv_y + 1, str, c_black, c_black, c_blue, c_black, 1);
draw_set_color(c_white);
draw_text(lv_x, lv_y, str);

draw_sprite(mugshot_sprite, 0, mugshot_x, mugshot_y);
//draw_sprite(spr_saber, 0, mugshot_x + 4, mugshot_y + 3);

//HP TEXT
str = "§ " + string(hp);

hp_str_x = x - 6;
hp_str_y = y + 30;

draw_text_color(hp_str_x + 1, hp_str_y + 1, str, c_black, c_black, c_blue, c_black, 1);
draw_set_color(c_white);
draw_text(hp_str_x, hp_str_y, str);

//MP STRING
str = "¤ " + string(spirit);

hp_str_x = x - 6;
hp_str_y = y + 37;

draw_text_color(hp_str_x + 1, hp_str_y + 1, str, c_black, c_black, c_blue, c_black, 1);
draw_set_color(c_white);
draw_text(hp_str_x, hp_str_y, str);


}