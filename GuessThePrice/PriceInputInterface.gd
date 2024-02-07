extends Control

func _on_confirm_pressed():
	
	$GuessPrice.visible = false
	var price_text = $GuessPrice/LineEdit.text
	var price = float(price_text)
	if price == 6.17:
		# 显示操作成功的提示
		$SuccessPanel.visible = true
		$ExcessDemandPanel.visible = false
		$ExcessSupplyPanel.visible = false
	elif price < 6.17:
		# 显示Excess Demand提示和图片
		$SuccessPanel.visible = false
		$ExcessDemandPanel.visible = true
		$ExcessSupplyPanel.visible = false
	else:
		# 显示Excess Supply提示和图片
		$SuccessPanel.visible = false
		$ExcessDemandPanel.visible = false
		$ExcessSupplyPanel.visible = true



func _on_cancel_pressed():
	$GuessPrice.visible = false
	$SuccessPanel.visible = false
	$ExcessDemandPanel.visible = false
	$ExcessSupplyPanel.visible = false
