extends CPUParticles2D

var lifeTime: float

func _ready():
	restart()

func _process(delta):
	lifeTime += delta
	
	if lifeTime > 1:
		queue_free()
