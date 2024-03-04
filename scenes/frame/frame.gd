extends CharacterBody2D
class_name Frame

@onready var control = %Control

@export var MAX_VELOCITY = 10

var dragging_distance : float = 0
var dir := Vector2.ZERO
var new_position := Vector2.ZERO
var mouse_in := false
var dragging := false

func get_control() -> Control:
	return control

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() && mouse_in:
			dragging_distance = position.distance_to(get_viewport().get_mouse_position())
			dir = (get_viewport().get_mouse_position() - position).normalized()
			dragging = true
			new_position = get_viewport().get_mouse_position() - dragging_distance * dir
		else:
			dragging = false
			
	elif event is InputEventMouseMotion:
		if dragging:
			new_position = get_viewport().get_mouse_position() - dragging_distance * dir

func _physics_process(delta):
	if dragging:
		velocity = (new_position - position) * Vector2(1, 1) * MAX_VELOCITY
		move_and_slide()

func on_mouse_entered():
	mouse_in = true
	print("mouse in")

func on_mouse_exited():
	mouse_in = false
	print("mouse out")
