extends Panel



func _on_back_pressed():
	get_node("/root/Main/UI/MainUIPanel").show_page(2)


signal tradeS2_update(price2)

func _on_buy_2_pressed():
	get_node("/root/Main/UI/MainUIPanel").show_page(2)
	tradeS2_update.emit(Global.price2)


func _on_nego_2_pressed():
	get_node("/root/Main/UI/MainUIPanel").show_page(6)
