extends Control

@onready var hammer = $Hammer
@onready var score_label = $score
@onready var timer_label = $timer

@onready var TOP_LEFT = $CenterContainer/VBoxContainer/top/top_left
@onready var TOP_MID = $CenterContainer/VBoxContainer/top/top_mid
@onready var TOP_RIGHT = $CenterContainer/VBoxContainer/top/top_right

@onready var BOTTOM_LEFT = $CenterContainer/VBoxContainer/bottom/bottom_left
@onready var BOTTOM_MID = $CenterContainer/VBoxContainer/bottom/bottom_mid
@onready var BOTTOM_RIGHT = $CenterContainer/VBoxContainer/bottom/bottom_right

@onready var TIMER = $Timer
@onready var TIMER_FOR_LABEL = $ControlTimerLabel

@onready var HIT_SOUND = $HitSound

var HOLES = []
var active_hole = null
var timer_label_seconds = 0
var score = 0

var is_hitting = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	HOLES = [TOP_LEFT, TOP_MID, TOP_RIGHT, BOTTOM_LEFT, BOTTOM_MID, BOTTOM_RIGHT]
	for hole in HOLES:
		var box = hole.get_child(0)
		box.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	hammer.global_position = get_global_mouse_position()
	

func _input(event):
	var mouse_pos = get_global_mouse_position()
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			hit_animation()
			if active_hole != null and active_hole.get_global_rect().has_point(mouse_pos):
				#get_tree().paused = true
				score += 1
				score_label.text = str(score)
				print("HIT!")
				HIT_SOUND.play()

func _spawn_box():
	
	var select_hole = HOLES.pick_random()
	active_hole = select_hole
	select_hole.get_child(0).visible = true
	await get_tree().create_timer(0.5).timeout
	select_hole.get_child(0).visible = false
	

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


func _on_timer_timeout() -> void:
	_spawn_box()


func _on_control_timer_label_timeout() -> void:
	timer_label_seconds += 1
	timer_label.text = str(timer_label_seconds)
