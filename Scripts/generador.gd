extends Area2D

var monedaEsacena=load("res://Scene/moneda.tscn")#cargamos el objeto
var EnemigoEscena=load("res://Scene/enemigoP.tscn")#cargamos el objeto
var random=RandomNumberGenerator.new()#un rado mizer
var Agregar=true

func _process(delta):
	spawner()

func spawner():
	if Agregar:
		$Timer.start()#se inicia el contador de nuevo
		Agregar=false
		var moneda=monedaEsacena.instantiate()#creamos muchas moendas
		var enemigo=EnemigoEscena.instantiate()#creamos muchas enemigos
		moneda.position=Vector2(random.randi_range(12,1139), random.randi_range(12,634) )#las coloca
		enemigo.position=Vector2(random.randi_range(12,1139), random.randi_range(12,634) )#las coloca
		add_child(moneda)# anadimos
		add_child(enemigo)# anadimos

func _on_timer_timeout():
	Agregar=true
