#region PAUSE
if (global.pause){
	exit
}

switch(playerState){
	#region WALKING
	case playerStateWALKING:
		methodPlayerStateWALKINGStepFinal()
	break;
	#endregion
	
	#region IDLE
	case playerStateIDLE:
		methodPlayerStateIDLEStepFinal()
	break;
	#endregion
	
	#region JUMPING
	case playerStateJUMPING:
		methodPlayerStateJUMPINGStepFinal()
	break;
	#endregion


}