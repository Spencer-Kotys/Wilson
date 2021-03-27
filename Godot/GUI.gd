extends CanvasLayer

# Declare member variables here. Examples:
onready var bar = $MarginContainer/HBoxContainer/TextureProgress
onready var tween = $Tween
var animated_health = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	var player_max_health = $"../Soldier".max_health
	bar.max_value = player_max_health
	update_health(player_max_health)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	bar.value = animated_health

func _on_Soldier_health_changed(player_health):
	update_health(player_health)

func update_health(new_value):
	tween.interpolate_property(self, "animated_health", animated_health, new_value, .06, Tween.TRANS_LINEAR, Tween.EASE_IN)
	if not tween.is_active():
		tween.start()

func _on_Soldier_dead():
	update_health(0)
	$"Game Over".show()


func _on_Soldier_win():
	$"Win".show()
	$"Win/Particles2D".restart()
