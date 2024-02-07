extends Panel



func _on_back_pressed():
	get_node("/root/Main/UI/MainUIPanel").show_page(2)
	


func _on_nego_1_pressed():
	get_node("/root/Main/UI/MainUIPanel").show_page(5)



signal tradeS1_update(price1)

func _on_buy_1_pressed():
	get_node("/root/Main/UI/MainUIPanel").show_page(2)
	tradeS1_update.emit(Global.price1)

