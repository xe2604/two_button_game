extends CharacterBody2D



const zl:float =5
@export var jump:int

var kongzhon:bool=false

func _physics_process(_delta: float) -> void:
	
	if !is_on_floor():
		if kongzhon:
			velocity.y+=zl
			if velocity.y>0.5:
				velocity.y=0.5
		else :
			velocity.y+=zl
	else:
		on_dm=true
	_player_input(_delta)
	
	move_and_slide()

var button_a:bool=false
var button_d:bool=false
var a_time:float=0
var d_time:float=0
func _player_input(_delta: float)->void:
	if Input.is_action_just_pressed("A"):
		button_a=true
		kongzhon=false
		a_time=0
	elif Input.is_action_just_pressed("D"):
		button_d=true
		d_time=0
	elif Input.is_action_just_released("A"):
		button_a=false
		if on_dm:
			A_effect(a_time)
	elif Input.is_action_just_released("D"):
		button_d=false
		D_effect(d_time)
	if button_a:
		a_time+=_delta
	if button_d:
		d_time+=_delta
		
@onready var jump_time: Timer = $jump_time
@onready var shoot_time: Timer = $shoot_time



func A_effect(_a_time):
	print(_a_time)
	if _a_time>0.5:
		velocity.y-=jump
		jump_time.start()
		kongzhon=true	
		on_dm=false
	else :
		on_dm=false
		velocity.y-=jump
		
@onready var sprite_2d_2: Sprite2D = $Sprite2D2
		
var red_state:bool=false
func D_effect(_d_time):
	if _d_time>0.4:
		red_state=true
		sprite_2d_2.visible=true
		shoot_time.start()
var on_dm:bool=true

func _on_jump_time_timeout() -> void:
	kongzhon=false


func _on_shoot_time_timeout() -> void:
	red_state=false
	sprite_2d_2.visible=false
