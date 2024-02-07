
extends Node

var price1 = 6
var price2 = 5
var cost1 = 3
var cost2 = 4

func update_price1():
	if price1 >= price2:
		price1 -= 1

func update_price2():
	if price1 <= price2:
		price2 -= 1
