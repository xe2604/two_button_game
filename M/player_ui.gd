extends CanvasLayer


@onready var input_1: Label = $input1
@onready var input_2: Label = $input2

func _ready() -> void:
	input_1.text="Button1:"+InputMap.action_get_events("A")[0].as_text()
	input_2.text="Button2:"+InputMap.action_get_events("D")[0].as_text()
