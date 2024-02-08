function jumping(){
	#region Keys
	var _up		=	keyboard_check(ord("W"));
	var _down	=	keyboard_check(ord("S"));
	var _left		=	keyboard_check(ord("A"));
	var _right	=	keyboard_check(ord("D"));
	var _space	=	keyboard_check_pressed(vk_space);
	#endregion

	#region Other variables
	// Variável de direrção e velocidade horizontal
	horizontalSpeed		=	(_right -  _left) * horizontalMaxSpeed;
	
	#endregion

	#region Checking if the player is on the ground
	// Checando se o player está no chão
	var _playerIsGround	=	place_meeting(x, y + 1, obj_ground);

	// Se o player está no chão, a quantidade de pulos reseta
	if (_playerIsGround){
		jumpQuantity = jumpMaxQuantity;
	}
	// Só aplica a gravidade se ele não estiver no chão
	else{
		// Gravidade sendo aplicada à velocidade vertical
		verticalSpeed	+=	 gravityVariable;
	}
	#endregion

	#region Jumping
	// Se apertar ESPAÇO e tiver pulos extras...
	if (_space && jumpQuantity > 0){
		//... inverte a velocidade vertical, deixando ela com metade da velocidade máxima,...
		//... essencialmente você pode dar um pulo que tem metade da velocidade que a gravidade pode ter
		verticalSpeed	=	- verticalMaxSpeed / 2;
	
		//... Reduz a quantidade de pulos
		jumpQuantity-- ;
	}
	#endregion

	#region Limiting vertical speed
	// Limita a velocidade vertical ao máximo para cima e ao dobro do máximo para baixo
	verticalSpeed	 =	clamp(verticalSpeed, -verticalMaxSpeed, verticalMaxSpeed * 2);
	#endregion
}