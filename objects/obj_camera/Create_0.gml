#region Setting important variables
// Alvo da câmera (player geralmente) e state machine dela
cameraTarget	=	 noone;
cameraState	=	 noone;
#endregion

#region Setting camera to follow the player 

#region Functions

#region Following player function
cameraStateFollowingPLAYER = function(){
	#region checking if obj_player exists
	// Checando se o player existe primeiro
	if (instance_exists(obj_player)){
		// Se o player existe, a câmera adquire o alvo player
		cameraTarget = obj_player;
	}
	// Se o player não existe, a câmera adquire o estado de não seguir nada
	else{
		cameraState = cameraStateFollowingNOTHING
	}
	#endregion
	#region making obj_camera follow obj_player smoothly
	// Fazendo o obj_camera seguir o player de forma 'suave'
	x	=	lerp(x, cameraTarget.x, 0.1)
	y	=	lerp(y, cameraTarget.y, 0.1)
	#endregion
	#region making camera follow obj_camera and setting other things
	// Isso define onde fica a origem da câmera (canto superior esquerdo)
	// Mandar a câmera ficar nas coordenadas do objeto menos metade da tela faz com que...
	// ... o ponto de origem da câmera vá metade da tela para a esquerda e para cima,... 
	// ... centralizando o meio da câmera no obj_camera que segue o obj_player *emoji oculos nerd*
	var _cameraX	=	x - (global.cameraViewWidth / 2)
	var _cameraY	=	y - (global.cameraViewHeight / 2)
	// Travando para a câmera não sair da room
	_cameraX		=	clamp(_cameraX, 0, room_width - global.cameraViewWidth)
	_cameraY		=	clamp(_cameraY, 0, room_height - global.cameraViewHeight)
	// Função que define finalmente a posição da câmera
	camera_set_view_pos(view_camera[0], _cameraX, _cameraY)
	#endregion	
}
#endregion
#region Following nothing function
// Se a câmera estar no estado de não seguir nada, o alvo dela se torna noone
cameraStateFollowingNOTHING = function(){
	cameraTarget = noone
}
#endregion
#endregion

#region Final settings
// Definindo que o estado inicial da câmera é seguir o player (depois de criar as funções)
cameraState = cameraStateFollowingPLAYER
#endregion
#endregion