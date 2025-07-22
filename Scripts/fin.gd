extends Control

@onready var contador=$VBoxContainer/Label2

func _on_button_pressed():
	Campo.numero=0
	get_tree().change_scene_to_file("res://Scene/campo.tscn")


func _on_button_2_pressed():
	get_tree().quit()
	
func _ready():
	contador.text=("Puntuacion: "+str(Campo.numero))
