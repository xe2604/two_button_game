extends Area2D





func _on_body_entered(_body: Node2D) -> void:
	if _body.red_state:
		queue_free()
		return
	
	
	var over=get_tree().get_nodes_in_group("main")[0]
	if over!=null:
		over.player_game_over()
