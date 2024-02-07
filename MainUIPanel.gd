extends Panel

# 添加函数来控制页面的显示和隐藏
func show_page(page_number):
	for i in range(get_child_count()):
		var child = get_child(i)
		if child is Panel:
			child.visible = false  # 首先隐藏所有页面
	# 然后根据page_number显示对应的页面
		get_child(page_number).visible = true





func _on_leave_button_pressed():
	get_node("/root/Main/UI").hide()  # hide UI


func _on_next_button_pressed():
	get_node("/root/Main/UI/MainUIPanel").show_page(1)  # show page 1



