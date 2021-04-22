extends Node2D

var dice = load("res://UI.tscn")
var multidice = []
var multidex = 0
var sum_total = 0

func _on_Add_Dice_pressed():
	if $Grid.get_child_count() < 4:
		var spawndice = dice.instance()
		$Grid.add_child(spawndice)
	else:
		pass

func _on_Remove_Dice_pressed():
	if $Grid.get_child_count() > 0:
		$Grid.get_children()[-1].queue_free()


func _on_Roll_All_pressed():
 #gets the child nodes from the instance inside container and counts them up
	for i in $Grid.get_children().size():
		 #gets the dies again but now it goes over the entire array and then it rolls it
		$Grid.get_children()[i]._on_Roll_pressed()

func _on_Sum_All_pressed():
 #gets the child nodes from the instance inside container and counts them up
	for i in $Grid.get_children().size():
		 #gets the dies again but now it goes over the entire array and then it rolls it
		$Grid.get_children()[i]._on_Sum_pressed()

func _on_Clear_All_pressed():
 #gets the child nodes from the instance inside container and counts them up
	for i in $Grid.get_children().size():
		$Grid.get_children()[i]._on_Clear_pressed()
	sum_total = 0
	$Sum.text = String("")
	for i in $Grid.get_children().size():
		$Grid.get_children()[i]._Clear_Summed()


func _on_Sum_Total_pressed():
		if sum_total != 0:
			pass
		else:
			for i in $Grid.get_children().size():
				_on_Sum_All_pressed()
				sum_total += $Grid.get_children()[i].sum
				$Sum.text = String(sum_total)


func _on_Clear_Sum_Total_pressed():
	sum_total = 0
	$Sum.text = String("")
	for i in $Grid.get_children().size():
		$Grid.get_children()[i]._Clear_Summed()
