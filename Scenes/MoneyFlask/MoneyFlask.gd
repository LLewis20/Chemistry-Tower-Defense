extends Node2D



func _on_clickable_area_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		get_node("../../UI").create_question()
		get_node("../../UI").connect("correct_answer", Callable(self, 'destory_flask'))
		
func destory_flask():
	print("DESTORYING FLASK")
	queue_free()
