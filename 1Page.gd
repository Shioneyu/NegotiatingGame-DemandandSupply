extends Panel



func _on_back_button_pressed():
	get_node("/root/Main/UI/MainUIPanel").show_page(0)


func _on_next_button_pressed():
	get_node("/root/Main/UI/MainUIPanel").show_page(2)
