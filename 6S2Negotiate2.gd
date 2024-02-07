extends Panel


signal price2_update(price2)


func _on_nego_2_pressed():
	
	if Global.price1 <= Global.price2:
		
		if Global.price2 > Global.cost2:
			$SellerAgree.visible = true
			$SellerRefuse.visible = false
			$CostRefuse.visible = false
			Global.update_price2()
			$Price.text = "Seller 2 now bid:" + str(Global.price2) + " cents/kWh"
			price2_update.emit(Global.price2)
		else:
			$SellerRefuse.visible = false
			$SellerAgree.visible = false
			$CostRefuse.visible = true
			price2_update.emit(Global.price2)
			$Price.text = "Seller 1 now bid:" + str(Global.cost2) + " cents/kWh"

	
	else:
		
		$SellerAgree.visible = false
		if Global.price2 > Global.cost2:
			$SellerRefuse.visible = true
			$CostRefuse.visible = false
			$Price.text = "Seller 2 now bid: " + str(Global.price2) + " cents/kWh"
		else:
			$SellerRefuse.visible = false
			$CostRefuse.visible = true
			$Price.text = "Seller 2 now bid: " + str(Global.cost2) + " cents/kWh"
			

signal tradeS2_nego_update(price2)

func _on_nego_buy_2_pressed():
	get_node("/root/Main/UI/MainUIPanel").show_page(2)

	tradeS2_nego_update.emit(Global.price2)

func _on_back_pressed():
	get_node("/root/Main/UI/MainUIPanel").show_page(4)
