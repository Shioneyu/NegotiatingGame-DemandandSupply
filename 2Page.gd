extends Panel



func _ready():
	$S1Price.text = "Seller 1 now bid: \n %s cents/kWh" % Global.price1
	$S2Price.text = "Seller 2 now bid: \n %s cents/kWh" % Global.price2	
	$TradingStatus.text = "Transaction Status: Not traded \nTrading price:  ???  cents/kWh"	
	$Feedback.visible = false
	$Celebration.visible = false



func _on_s_1_price_pressed():
	get_node("/root/Main/UI/MainUIPanel").show_page(3)
	$Feedback.visible = false


func _on_s_2_price_pressed():
	get_node("/root/Main/UI/MainUIPanel").show_page(4)
	$Feedback.visible = false


func _on_back_button_pressed():
	get_node("/root/Main/UI/MainUIPanel").show_page(1)
	$Feedback.visible = false



func _on_s_1_negotiate_price_1_update(price1):
	$S1Price.text = "Seller 1 now bid: \n %s cents/kWh" % Global.price1
	$S2Price.text = "Seller 2 now bid: \n %s cents/kWh" % Global.price2	
	



func _on_s_1_trade_trade_s_1_update(price1):
	$TradingStatus.text = "Transaction Status: SUCCESS-S1\nTrading price: %s cents/kWh" %Global.price1
	if min(Global.price1, Global.price2) == min(Global.cost1, Global.cost2):
		$Celebration.visible = true
		$Feedback.visible = false
	else:
		$Feedback.visible = true
		$Celebration.visible = false

func _on_s_1_negotiate_trade_s_1_nego_update(price1):
	$TradingStatus.text = "Transaction Status: SUCCESS-S1 \nTrading price: %s cents/kWh" %Global.price1
	if min(Global.price1, Global.price2) == min(Global.cost1, Global.cost2):
		$Celebration.visible = true
		$Feedback.visible = false
	else:
		$Feedback.visible = true
		$Celebration.visible = false

func _on_s_2_trade_trade_s_2_update(price2):
	$TradingStatus.text = "Transaction Status: SUCCESS-S2 \nTrading price: %s cents/kWh" %Global.price2
	if min(Global.price1, Global.price2) == min(Global.cost1, Global.cost2):
		$Celebration.visible = true
		$Feedback.visible = false
	else:
		$Feedback.visible = true
		$Celebration.visible = false


func _on_s_2_negotiate_2_price_2_update(price2):
	$S1Price.text = "Seller 1 now bid: \n %s cents/kWh" % Global.price1
	$S2Price.text = "Seller 2 now bid: \n %s cents/kWh" % Global.price2	
	
	

func _on_s_2_negotiate_2_trade_s_2_nego_update(price2):
	if min(Global.price1, Global.price2) == min(Global.cost1, Global.cost2):
		$Celebration.visible = true
		$Feedback.visible = false
	else:
		$Feedback.visible = true
		$Celebration.visible = false


func _on_restart_pressed():
	Global.price1 = 6
	Global.price2 = 5
	$Feedback.visible = false
	$S1Price.text = "Seller 1 now bid: \n %s cents/kWh" % Global.price1
	$S2Price.text = "Seller 2 now bid: \n %s cents/kWh" % Global.price2	
	$TradingStatus.text = "Transaction Status: Not traded \nTrading price:  ???  cents/kWh"	
	$Celebration.visible = false



