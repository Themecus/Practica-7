extends CharacterBody2D
var speed = 100
var movimiento=false
var movimiento1=true
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
	
func _on_area_2d_area_entered(area):
	movimiento=false
	set_collision_mask_value(1, false)
	set_collision_mask_value(1, false)
	Campo.actualizar(3)

func _on_area_2d_2_body_entered(body):
	if movimiento1:
		movimiento=true
		movimiento1=false
		
