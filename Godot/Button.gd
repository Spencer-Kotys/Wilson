extends Button

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(73):
		$Popup.popup()
	else:
		$Popup.hide()


func _on_Button_pressed():
	$Popup.popup()

func _on_Inventory_GoBack():
	$Popup.hide()
