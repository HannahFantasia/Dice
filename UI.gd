extends Control

var modifier = 0
var dicemax = 6
var dicemin = 1
var arrayresult = [] #empty arrayresult stores the rolls 
var index = 0 #stores the index of the arrayresult
var sum = 0



func _on_Plus_Dice_pressed():
	dicemax = dicemax + 1
	$Dice.text = String(dicemax)
	
func _on_Minus_Dice_pressed():
	if dicemax <= 1:
		pass
	else:
		dicemax = dicemax - 1
	$Dice.text = String(dicemax)

func _on_Minus_pressed():
	modifier = modifier - 1
	$Modifier.text = String(modifier)

func _on_Plus_pressed(): 
# I want to call this variable on the function below.
	modifier = modifier + 1
	$Modifier.text = String(modifier)

func _on_Roll_pressed():
	$Result.set_text("") # Clear roll texts from screen
	var roll = round((rand_range(dicemin,dicemax)))
	if arrayresult.size() <= index: # checks if index is smaller than length of arrayresult
		arrayresult.append(roll) # adds to arrayresult if true
	else:
		#assigns roll to the index of arrayresult 
		arrayresult[index] = roll
	if dicemax < dicemin:
		dicemin = abs(1)
	# For each roll, show the number on screen, separated by newline:
	index = wrapi(index + 1,0,5)
	for i in range(arrayresult.size()):
		$Result.text += String(arrayresult[i]) + "\n"
	$Result.set_max_lines_visible(5) # This is not really necessary

func _on_Clear_pressed():
	$Result.set_text("")
	$Summed.set_text("") # clears the label's text
	arrayresult = []
	index = 0
	sum = 0

func _on_Sum_pressed():
	sum = 0 + modifier
	for f in arrayresult:
		sum += f
		$Summed.text = String(sum)
