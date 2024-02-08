#region KEYBOARD KEYS

/* Teclas pressionadas e mantidas pressionadas */
// WASD
global.heldW = keyboard_check(ord("W"))
global.heldA = keyboard_check(ord("A"))
global.heldS = keyboard_check(ord("S"))
global.heldD = keyboard_check(ord("D"))
// Setinhas
global.heldUpArrow = keyboard_check(vk_up)
global.heldLeftArrow = keyboard_check(vk_left)
global.heldDownArrow = keyboard_check(vk_down)
global.heldRightArrow = keyboard_check(vk_right)
// Espaço e mouse
global.heldSpace = keyboard_check(vk_space)
global.heldMouseAny = mouse_check_button(mb_any)
global.heldMouseLeft = mouse_check_button(mb_left)
global.heldMouseRight = mouse_check_button(mb_right)
// Outros
global.heldShift = keyboard_check(vk_shift)
global.heldCtrl = keyboard_check(vk_control)
global.heldTab = keyboard_check(vk_tab)

/*Teclas pressionadas uma vez*/
// WASD
global.pressedW = keyboard_check_pressed(ord("W"))
global.pressedA = keyboard_check_pressed(ord("A"))
global.pressedS = keyboard_check_pressed(ord("S"))
global.pressedD = keyboard_check_pressed(ord("D"))
// Setinhas
global.pressedUpArrow = keyboard_check_pressed(vk_up)
global.pressedLeftArrow = keyboard_check_pressed(vk_left)
global.pressedDownArrow = keyboard_check_pressed(vk_down)
global.pressedRightArrow = keyboard_check_pressed(vk_right)
// Espaço e mouse
global.pressedSpace = keyboard_check_pressed(vk_space)
global.pressedMouseAny = mouse_check_button_pressed(mb_any)
global.pressedMouseLeft = mouse_check_button_pressed(mb_left)
global.pressedMouseRight = mouse_check_button_pressed(mb_right)
// Outros
global.pressedShift = keyboard_check_pressed(vk_shift)
global.pressedCtrl = keyboard_check_pressed(vk_control)
global.pressedTab = keyboard_check_pressed(vk_tab)

/*Teclas soltas*/
// WASD
global.releasedW = keyboard_check_released(ord("W"))
global.releasedA = keyboard_check_released(ord("A"))
global.releasedS = keyboard_check_released(ord("S"))
global.releasedD = keyboard_check_released(ord("D"))
// Setinhas
global.releasedUp = keyboard_check_released(vk_up)
global.releasedLeft = keyboard_check_released(vk_left)
global.releasedDown = keyboard_check_released(vk_down)
global.releasedRight = keyboard_check_released(vk_right)
// Espaço e mouse
global.releasedSpace = keyboard_check_released(vk_space)
global.releasedMouseAny = mouse_check_button_released(mb_any)
global.releasedMouseLeft = mouse_check_button_released(mb_left)
global.releasedMouseRight = mouse_check_button_released(mb_right)
// Outros
global.releasedShift = keyboard_check_released(vk_shift)
global.releasedCtrl = keyboard_check_released(vk_control)
global.releasedTab = keyboard_check_released(vk_tab)
#endregion
#region PLAYER GLOBAL VARIABLES
global.playerIsTouchingGround = false
#endregion
#region CAMERA, WINDOW AND GUI
global.cameraViewWidth		=	camera_get_view_width(view_camera[0])
global.cameraViewHeight	=	camera_get_view_height(view_camera[0])

global.guiViewWidth			=	display_get_gui_width()
global.guiViewHeight			=	display_get_gui_height()


#endregion
#region DEBUG VARIABLES
global.debug = false
#endregion
#region PAUSE VARIABLE
global.pause = false

#endregion