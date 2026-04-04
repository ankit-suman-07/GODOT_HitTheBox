extends Control

@onready var hammer = $Hammer
@onready var score_label = $score
@onready var timer_label = $timer

var is_hitting = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	hammer.global_position = get_global_mouse_position()

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			hit_animation()

func hit_animation():
	if is_hitting:
		return
	
	is_hitting = true
	
	# Rotate down (hit)
	hammer.rotation_degrees = -45
	hammer.scale = Vector2(3, 3)
	
	await get_tree().create_timer(0.08).timeout
	
	# Return to normal
	hammer.rotation_degrees = 0
	hammer.scale = Vector2(3, 3)
	
	is_hitting = false

func _on_restart_btn_pressed() -> void:
	get_tree().reload_current_scene()


func _on_quit_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
