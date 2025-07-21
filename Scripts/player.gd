extends CharacterBody2D


var SPEED = 300.0
var habilidad=true
var tiempo=0.0

func _physics_process(delta):
	#Con esto recibiremos los comandos de las 4 direcciones
	var direction = Vector2 (Input.get_axis("left", "right"),
	Input.get_axis("up", "down"))
	
	#Con esto pondremos frenos si se intenta ir mas rapido de lo normal en diagonal
	if direction.length()>0:
		direction=direction.normalized()
	
	#Esta es una opcion que hace un dash y tiene enfriamiento
	if Input.is_action_pressed("jump") and habilidad==true:
		Turbo()
	
	#Aqui comienza el enfriamiento, usando delta que son los fps consntante, se ira reduciendo hasta liberarse
	if !habilidad:
		print("entra"+str(tiempo))
		tiempo-=delta
		if tiempo<=0.0:
			print("libre")
			habilidad=true
		if tiempo<=4.5:
			print("libre")
			SPEED=300
	#esto se encargara de moverse con la direccion que le demos mas la velocidad planteada
	velocity=direction*SPEED
	move_and_slide()

func Turbo():
	#Nos da mas velocidad pero apagara la habilidad
	SPEED=600
	tiempo=6.0
	habilidad=false
	print("bloqueado, tiempo tiene="+ str(tiempo))



func _on_area_2d_body_entered(body):
	queue_free()
	get_tree().change_scene_to_file("res://Scene/fin.tscn")
	
