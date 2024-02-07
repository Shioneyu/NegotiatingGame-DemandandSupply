extends Panel
func _input(event):
	if event is InputEventKey and event.pressed:
		hide()  # 隐藏当前节点
		# 如果需要，也可以完全从场景中移除
		# queue_free()
