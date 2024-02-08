/// @description DEBUG
// Desenhando a si mesmo
draw_self()

// Escrevendo o estado do player
if (global.debug){
	draw_set_valign(1)
	draw_set_halign(1)
	draw_text_transformed(x, y - sprite_height - 3, playerStateString, 0.2, 0.2, 0)
	draw_set_valign(-1)
	draw_set_halign(-1)
}












