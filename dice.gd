extends Control

onready var rollall = get_node("VBoxContainer")


func roll():
	rollall._on_Roll_pressed()

func clear():
	rollall._on_Clear_pressed()

func sum():
	rollall._on_Sum_pressed()
