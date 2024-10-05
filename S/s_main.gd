extends Control


func _on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://S/s_game.tscn")

@onready var v_box_container: VBoxContainer = $VBoxContainer
@onready var panel: Panel = $Panel

func _on_button_2_button_down() -> void:
	panel.visible=true
	v_box_container.visible=false


func _on_return_button_down() -> void:
	panel.visible=false
	v_box_container.visible=true





@onready var button_a: Button = $Panel/HBoxContainer/VBoxContainer2/ButtonA
@onready var button_d: Button = $Panel/HBoxContainer/VBoxContainer2/ButtonD


var V_input:bool=false
@onready var label: Label = $Panel/Label
var V_position:int=0
func _on_button_a_button_down() -> void:
	label.visible=true
	V_input=true
	V_position=1
	
func _on_button_d_button_down() -> void:
	label.visible=true
	V_input=true
	V_position=2
	
func _input(_event: InputEvent) -> void:
	if V_input:
		if _event is InputEventKey:
			label.visible=false
			if V_position==1:
				V_position=0
				InputMap.action_erase_events("A")
				InputMap.action_add_event("A",_event)
				button_a.text=InputMap.action_get_events("A")[0].as_text()
			elif V_position==2:
				V_position=0
				InputMap.action_erase_events("D")
				InputMap.action_add_event("D",_event)
				button_d.text=InputMap.action_get_events("D")[0].as_text()
				
func _ready() -> void:
	button_a.text=InputMap.action_get_events("A")[0].as_text()
	button_d.text=InputMap.action_get_events("D")[0].as_text()
