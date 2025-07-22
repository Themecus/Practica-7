extends Area2D

var EnemigoEscena=load("res://Scene/enemigoP.tscn")#cargamos el objeto
var EnemigoEscena1=load("res://Scene/enemigoS.tscn")#cargamos el objeto
var EnemigoEscena2=load("res://Scene/enemigoA.tscn")#cargamos el objeto
var random=RandomNumberGenerator.new()#un randomizer
var pos=RandomNumberGenerator.new()#un randomizer
var Agregar=true

func _process(delta):
	spawner()

func spawner():
	if Agregar:
		var enemigo
		pos=randi_range(1,8)
		random=randi_range(1,3)
		$Timer.start()#se inicia el contador de nuevo
		Agregar=false
		match random:
			1:
				enemigo=EnemigoEscena.instantiate()#creamos muchas enemigos
			2:
				enemigo=EnemigoEscena1.instantiate()#creamos muchas enemigos
			3:
				enemigo=EnemigoEscena2.instantiate()#creamos muchas enemigos
		match pos:
			1:
				enemigo.position=Vector2(20, 40)#las coloca
			2:
				enemigo.position=Vector2(564, 26)#las coloca
			3:
				enemigo.position=Vector2(1120, 26)#las coloca
			4:
				enemigo.position=Vector2(1120, 303)#las coloca
			5:
				enemigo.position=Vector2(1120, 625)#las coloca
			6:
				enemigo.position=Vector2(578, 625)#las coloca
			7:
				enemigo.position=Vector2(40, 625)#las coloca
			8:
				enemigo.position=Vector2(40, 325)#las coloca

		add_child(enemigo)# anadimos

func _on_timer_timeout():
	Agregar=true
