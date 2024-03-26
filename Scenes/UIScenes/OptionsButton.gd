extends TextureButton


#Ensure that the options menu is initially hidden 
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#The button will display an options menu when clicked
func _on_pressed():
	$HUD/OptionsMenu.visible = true
