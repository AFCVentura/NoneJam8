/// @description


if (global.pause){
	// Desenhar tela escurecendo
	draw_set_alpha(alphaPause)
	draw_set_color(#0c0c0d)
	draw_rectangle(0, 0, global.guiViewWidth, global.guiViewHeight, false)
	draw_set_alpha(-1)
	draw_set_color(-1)
	
	// Botão aparecendo
	draw_set_alpha(alphaPauseButton)
	draw_sprite_ext(spr_pauseButton, 0, global.guiViewWidth / 2, global.guiViewHeight / 2, 4, 4, 0, -1, alphaPauseButton)
	draw_set_alpha(-1)

	// Manipulando variáveis
	alphaPauseButton += 0.05
	alphaPauseButton =  min(alphaPauseButton, alphaPauseButtonMax)
	
	alphaPause += 0.01
	alphaPause =  min(alphaPause, alphaPauseMax)
	
	alphaUnpauseButton = alphaPauseButtonMax
	alphaUnpause = alphaPauseMax
	alarm[0] = 120
}
else if (alarm[0] >= 1){
	// Desenhar tela clareando
	draw_set_alpha(alphaUnpause)
	draw_set_color(#0c0c0d)
	draw_rectangle(0, 0, global.guiViewWidth, global.guiViewHeight, false)
	draw_set_alpha(-1)
	draw_set_color(-1)

	// Botão desaparecendo
	draw_set_alpha(alphaUnpauseButton)
	draw_sprite_ext(spr_pauseButton, 0, global.guiViewWidth / 2, global.guiViewHeight / 2, 4, 4, 0, -1, alphaUnpauseButton)
	draw_set_alpha(-1)

	// Manipulando Variváveis
	alphaUnpauseButton -= 0.05
	alphaPauseButton =  max(alphaUnpauseButton, 0)
	
	alphaUnpause -= 0.01
	alphaUnpause =  max(alphaUnpause, 0)
	
	alphaPauseButton = 0
	alphaPause = 0
}












