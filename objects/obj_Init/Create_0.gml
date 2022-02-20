/// @description Insert description here
// You can write your code in this editor
globalvar font, dmgFont;
font = font_add_sprite_ext(spr_spriteFont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789*.,-+ /:€§@¤", true, 1);
dmgFont = font_add_sprite_ext(spr_FontDamage, "1234567890!", true, -1);
draw_set_font(font);
room_goto_next();