extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var isim="arrow"
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if(self.position.y<-50):
		self.queue_free()
	self.translate(Vector2(0,-20));

