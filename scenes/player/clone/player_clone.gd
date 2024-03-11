extends CharacterBody2D
class_name PlayerClone

@onready var sprite_2d = %Sprite2D

var player : Player

func _ready():
	player = get_tree().get_first_node_in_group("player") as Player
	if player == null:
		printerr("no player node in scene")

func _process(delta):
	if player == null:
		return
		
	#sprite_2d.texture = player.sprite_2d.texture
	#sprite_2d.transform = player.sprite_2d.transform
	global_transform = player.global_transform
	mirror_player()

func mirror_player():
	sprite_2d.frame = player.sprite_2d.frame
	sprite_2d.flip_h = player.sprite_2d.flip_h

