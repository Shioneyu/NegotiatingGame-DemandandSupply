extends Panel



signal price1_update(price1)

func _on_nego_1_pressed():	
	
	if Global.price1 >= Global.price2:
		if Global.price1 > Global.cost1:
			$SellerAgree.visible = true
			$SellerRefuse.visible = false
			$CostRefuse.visible = false
			Global.update_price1()
			$Price.text = "Seller 1 now bid: " + str(Global.price1) + " cents/kWh"
			price1_update.emit(Global.price1)
		else:
			$SellerRefuse.visible = false
			$SellerAgree.visible = false
			$CostRefuse.visible = true
			price1_update.emit(Global.price1)
			$Price.text = "Seller 1 now bid: " + str(Global.cost1) + " cents/kWh"

	
	else:
		
		$SellerAgree.visible = false
		if Global.price1 > Global.cost1:
			$SellerRefuse.visible = true
			$CostRefuse.visible = false
			$Price.text = "Seller 1 now bid: " + str(Global.price1) + " cents/kWh"
		else:
			$SellerRefuse.visible = false
			$CostRefuse.visible = true
			$Price.text = "Seller 1 now bid: " + str(Global.cost1) + " cents/kWh"
	


signal tradeS1_nego_update(price1)

func _on_nego_buy_1_pressed():
	get_node("/root/Main/UI/MainUIPanel").show_page(2)
	tradeS1_nego_update.emit(Global.price1)


func _on_back_pressed():
	get_node("/root/Main/UI/MainUIPanel").show_page(3)
	
