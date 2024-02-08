#region Variables
#region Gravity and fall variables
// Variável adicionada toda vez à velocidade vertical
gravityVariable		=	.25;
#endregion

#region Speed Variables
// Variáveis de velocidade que fazem mover
horizontalSpeed		=	0;
verticalSpeed		=	0;
// Variáveis de velocidade que limitam o máximo
horizontalMaxSpeed	=	5;
verticalMaxSpeed	=	15;
#endregion

#region Jump Variables
// Double Jump
jumpMaxQuantity	=	2;
jumpQuantity		=	jumpMaxQuantity;

// String que mostra o estado atual do player
playerStateString = ""
#endregion
#region Sprite Speed
playerSpriteSpeed = image_speed
#endregion
#endregion

#region Functions/Methods and Cases


#region IDLE state

methodPlayerStateIDLEStep	=	function(){
	#region Keys
	var _up		=	keyboard_check(ord("W"));
	var _down	=	keyboard_check(ord("S"));
	var _left		=	keyboard_check(ord("A"));
	var _right	=	keyboard_check(ord("D"));
	var _space	=	keyboard_check_pressed(vk_space);
	#endregion
	
	#region CHANGING STATE
	if (!place_meeting(x, y + 1, obj_ground) || _space){
		playerState = playerStateJUMPING
	}
	else if (_left ^^ _right){
		playerState = playerStateWALKING
	}
	#endregion
	
	#region Sprites
	if (_up ^^ _down){
		if (_up){
			sprite_index = spr_playerUp
			playerSpriteSpeed = image_speed
		}
		else{
			sprite_index = spr_playerDown
			playerSpriteSpeed = image_speed
		}
	}
	else{
		sprite_index = spr_playerIdle
		playerSpriteSpeed = image_speed
	}
	#endregion
	
}
methodPlayerStateIDLEStepFinal	=	function(){
	collisions()

}
playerStateIDLE	=	function(){
	methodPlayerStateIDLEStep()
	methodPlayerStateIDLEStepFinal()
}
#endregion

#region WALKING state
// Código que roda no step event
methodPlayerStateWALKINGStep		 =	 function(){
	
		#region Keys
		var _up		=	keyboard_check(ord("W"));
		var _down	=	keyboard_check(ord("S"));
		var _left		=	keyboard_check(ord("A"));
		var _right	=	keyboard_check(ord("D"));
		var _space	=	keyboard_check_pressed(vk_space);
		#endregion
		
				
		#region CHANGING STATE
		if (!place_meeting(x, y + 1, obj_ground) || _space){
			playerState = playerStateJUMPING
		}
		else if (!_left && !_right){
			playerState = playerStateIDLE
		}
		#endregion

		#region Sprites
		sprite_index = spr_playerWalking
		playerSpriteSpeed = image_speed
		if (horizontalSpeed != 0){
			image_xscale = sign(horizontalSpeed)
		}
		#endregion
		
		#region Other variables
		// Variável de direrção e velocidade horizontal
		horizontalSpeed		=	(_right -  _left) * horizontalMaxSpeed;
		#endregion

		
}
// Código que roda no end step event
methodPlayerStateWALKINGStepFinal	 =	 function(){
	collisions()
}
// Junção de todos os eventos em determinado estado
playerStateWALKING		=	function(){

	methodPlayerStateWALKINGStep();
	methodPlayerStateWALKINGStepFinal();
	
}

#endregion

#region JUMPING state
methodPlayerStateJUMPINGStep = function(){
	#region CHANGING STATE
	if (place_meeting(x, y + 1, obj_ground)){
		playerState = playerStateIDLE
	}
	#endregion
	
	#region Sprite
	sprite_index = spr_playerJumping
	playerSpriteSpeed = image_speed
	if (horizontalSpeed != 0){
		image_xscale = sign(horizontalSpeed)
	}
	#endregion
}
methodPlayerStateJUMPINGStepFinal = function(){
	jumping()
	collisions()
}
playerStateJUMPING		=	function(){
	methodPlayerStateJUMPINGStep();
	methodPlayerStateJUMPINGStepFinal();
}
#endregion

#region DEAD state

#endregion

// Atribuição da junção à variável de estado
playerState	 =	playerStateJUMPING
#endregion