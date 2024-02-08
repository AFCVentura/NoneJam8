#region PAUSE
if (global.pause){
	image_speed = 0
	exit
}
else{
	image_speed = playerSpriteSpeed
}
#endregion
switch(playerState){
	#region WALKING
	case playerStateWALKING:
		playerStateString = "WALKING"
		methodPlayerStateWALKINGStep()
	break;
	#endregion
	
	#region IDLE
	case playerStateIDLE:
		playerStateString = "IDLE"
		methodPlayerStateIDLEStep()
	break;
	#endregion
	
	#region JUMPING
	case playerStateJUMPING:
		playerStateString = "JUMPING"
		methodPlayerStateJUMPINGStep()
	break;
	#endregion

	#endregion
	

}