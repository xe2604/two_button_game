extends Node2D


@onready var dm: TileMapLayer = $dm

@export  var start:int=50
@export var end:int=-30

@export var speed:float

func _process(_delta: float) -> void:
	position=Vector2(position.x-speed*_delta,position.y)
	
@onready var timer: Timer = $Timer


var treee:int=0
const BARRIER = preload("res://M/barrier.tscn")
func _on_timer_timeout() -> void:
	if timer.wait_time>0.15:
		timer.wait_time-=0.0035
	speed+=0.01
	end+=1
	dm.erase_cell(Vector2(end,5))
	start+=1

	if randf()>0.3:
		dm.set_cell(Vector2i(start,5),0,Vector2i(1,1))
	
	if randf()<0.02:
		treee=0
		var BARRIER_=BARRIER.instantiate()
		add_child(BARRIER_)
		BARRIER_.position=Vector2(start*9-27,24)
	else :
		treee+=1
		if treee>20:
			treee=0
			var BARRIER_=BARRIER.instantiate()
			add_child(BARRIER_)
			BARRIER_.position=Vector2(start*9-27,24)
