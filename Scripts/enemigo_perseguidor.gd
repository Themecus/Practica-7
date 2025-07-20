extends CharacterBody2D
#quitamos la colision del personaje y solo dejamos la del area2d para probar cuando se queda quieto
var speed = 100
var movimiento=true
var player = null
var tiempo= 2

func _ready():
	player = get_tree().get_nodes_in_group("player")[0]# con esto rellenamos la variable del nodo con el que trabajos
	#usando grupos
	#investiga los grupos
	

func _process(delta):
	follow()

func follow():
	if player !=null and movimiento:
		velocity = position.direction_to(player.position) * speed#se multiplica la posicion del jugador por la velocidad para seguirlo
	else:
		velocity=Vector2.ZERO #en caso que lo toque se detiene el enemigo
	move_and_slide()

func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("entro")
	movimiento=false


func _on_area_2d_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	print("salio")
	movimiento=true

