extends Panel


func _on_leave_pressed():
	get_node("/root/Main/UI/MainUIPanel").hide()  # hide UI


func _on_back_pressed():
	get_node("/root/Main/UI/MainUIPanel").show_page(2)


func _on_feedback_pressed():
	get_node("/root/Main/UI/MainUIPanel").show_page(7)
	if min(Global.price1, Global.price2) == min(Global.cost1, Global.cost2):
		$Sucess.visible = true
		$Fail.visible = false
	else:
		$Sucess.visible = false
		$Fail.visible = true



func _on_celebration_pressed():
	get_node("/root/Main/UI/MainUIPanel").show_page(7)
	if min(Global.price1, Global.price2) == min(Global.cost1, Global.cost2):
		$Sucess.visible = true
		$Fail.visible = false
	else:
		$Sucess.visible = false
		$Fail.visible = true
