extends Node2D


@export var speed:float

var game_over_df:bool=false
var df_float:float=1
@onready var df: Label = $Player_UI/df

func _process(_delta: float) -> void:
	if !game_over_df:
		df_float+=_delta
		df.text="score:"+str(int(df_float))
	if Input.is_action_just_pressed("A"):
		print(1)
	elif Input.is_action_just_pressed("D"):
		print(2)

@onready var player: CharacterBody2D = $player

func _on_area_2d_body_entered(_body: Node2D) -> void:
	_body.kongzhon=false
	print("游戏结束")
	
	
@onready var game_over: Label = $Player_UI/game_over
@onready var start: Button = $Player_UI/start

func player_game_over()->void:
	player.queue_free()
	game_over_df=true
	game_over.visible=true
	start.visible=true


func _on_area_2d_body_exited(_body: Node2D) -> void:
	player_game_over()

func _on_area_2d_2_area_entered(_area: Area2D) -> void:
	_area.queue_free()


func _on_area_2d_2_body_entered(_body: Node2D) -> void:
	_body.queue_free()


func _on_start_button_down() -> void:
	get_tree().change_scene_to_file("res://S/s_main.tscn")
