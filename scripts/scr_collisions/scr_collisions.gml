function verticalCollision(){
	#region Important local variables
	// Módulo das velocidades
	var _absoluteHorizontalSpeed	 =		abs(horizontalSpeed)
	var _absoluteVerticalSpeed		 =		abs(verticalSpeed)
	#endregion

	#region Vertical collision
	// Colisão vertical
	repeat(_absoluteVerticalSpeed){
		#region Important local variables
		// Sinal (negativo ou positivo) da velocidade
		var _verticalSpeedSign	=	sign(verticalSpeed);
	
		// Variável que checa se está colidindo acima ou abaixo
		var _placeMeetingVerticalSign		=	place_meeting(x, y + _verticalSpeedSign, obj_ground)
		#endregion
	
		#region Collision checks
		// Se tá tocando abaixo um pixel, para de cair
		if (_placeMeetingVerticalSign){
			verticalSpeed		=		0;
			break;
		}
		// Se não, desce mais
		else{
			y		+=		_verticalSpeedSign;
		}
		#endregion
	}
	#endregion
	
	#region Checking if the player is on the ground
	// Checando se o player está no chão
	var _playerIsGround	=	place_meeting(x, y + 1, obj_ground);
	
	// Se o player não está no chão, a gravidade é aplicada
	if (!_playerIsGround){
		// Gravidade sendo aplicada à velocidade vertical
		verticalSpeed	+=	 gravityVariable;
	}
	#endregion
}

 function horizontalCollision(){
	#region Important local variables
	// Módulo das velocidades
	var _absoluteHorizontalSpeed	 =		abs(horizontalSpeed)
	var _absoluteVerticalSpeed		 =		abs(verticalSpeed)
	#endregion
	#region Horizontal collision
		// Colisão horizontal
		repeat (_absoluteHorizontalSpeed){
			#region Important local variables
			// Sinal (negativo ou positivo) da velocidade
			var _horizontalSpeedSign				=	sign(horizontalSpeed);
	
			// Variável que checa se está colidindo à esquerda ou direita
			var _placeMeetingHorizontalSign		=	place_meeting(x + _horizontalSpeedSign, y, obj_ground)
	
			// Altura máxima da rampa
			var _rampLimit = 4
			// Verifica se NÃO está colidindo à esquerda ou direita no tamanho limite da rampa
			var _placeMeetingFreeRamp			=		!place_meeting(x + _horizontalSpeedSign, y - _rampLimit, obj_ground)
	
			// Verifica se NÃO está colidindo à esquerda ou direita no tamanho limite da rampa
			var _placeMeetingFreeRampBelow	=		!place_meeting(x + _horizontalSpeedSign, y + _rampLimit + 1, obj_ground)
	
	
			#endregion
	
	
			#region Collision checks
	
			#region Colliding horizontal - NOT Colliding with the ramp limit - UPSTAIR
	
			// Se está colidindo ao lado mas não está ao lado um pouco acima...
			if (_placeMeetingHorizontalSign && _placeMeetingFreeRamp){
				// Repita a quantidade de pixels de altura máxima da rampa
				repeat(_rampLimit){
					// Meio redundante mas recupera o sinal da altura da rampa máxima
					var _rampLimitSign				=	sign(_rampLimit)

					// Checa se está colidindo na altura do sinal
					var _placeMeetingFreeRampSign	=	!place_meeting(x + _horizontalSpeedSign, y - _rampLimitSign, obj_ground)
			
					// Checa se passa em 5 de altura
					var _placeMeetingWaitThatsWall	=	place_meeting(x + _horizontalSpeedSign, y - (_rampLimitSign * (_rampLimit+1)), obj_ground)
			
					// Se não colidiu na altura do sinal, sobe um e move um pra frente
					if (_placeMeetingFreeRampSign){
						y	-=	 _rampLimitSign;
						x	+=	 _horizontalSpeedSign
				
					}
					// Se viu que é um muro, sai do loop
					else if (_placeMeetingWaitThatsWall){
						break;
					}
					// Se não ta livre ainda mas é uma rampa, sobe um bloco e checa de novo
					else{
						y	-=	_rampLimitSign;
					}
	
			
				}		
			}
			#endregion
	
			#region NOT colliding horizontal - NOT Colliding with the ramp limit BELOW - NOT FALL - DOWNSTAIR
			// Se não colidiu do lado mas colidiu na diagonal pra baixo
			if (!_placeMeetingHorizontalSign && !_placeMeetingFreeRampBelow){
				repeat(_rampLimit + 1){
					#region Important local variables
					// Meio redundante mas recupera o sinal da altura da rampa máxima
					var _rampLimitBelowSign						=		sign(-_rampLimit)	
					// Checa se é uma queda
					var _placeMeetingWaitThatsFall				=		!place_meeting(x + _horizontalSpeedSign, y - (_rampLimitBelowSign * (_rampLimit+1)), obj_ground)
					// Checa se está colidindo na altura do sinal
					var _placeMeetingFreeRampBelowSign		=		!place_meeting(x + _horizontalSpeedSign, y - _rampLimitBelowSign, obj_ground)
			
					// Meio redundante mas recupera o sinal da altura da rampa máxima
					_rampLimitBelowSign			=		sign(-_rampLimit)	
	
					// Checa se é uma queda
					_placeMeetingWaitThatsFall		=		!place_meeting(x + _horizontalSpeedSign, y - (_rampLimitBelowSign * (_rampLimit+1)), obj_ground)
					#endregion
			
					// Se colidiu na diagonal um abaixo
					if (!_placeMeetingFreeRampBelowSign){
						break
					}
					// Se viu que é um buraco, sai do loop
					else if (_placeMeetingWaitThatsFall){
						break;
					}
					else{
						y	 -=	_rampLimitBelowSign;
				
					}
				}
			}
			else{
		
			}
			#endregion
	
			#region Colliding Horizontal
			// Se tá tocando ao lado, para
			if (_placeMeetingHorizontalSign){
				horizontalSpeed		=	0;
				break;
			}
			// Se não, move
			else{
				x	+=	_horizontalSpeedSign;
			}
			#endregion
			#endregion
		}
		#endregion
}



function collisions(){
	verticalCollision()
	horizontalCollision()
}