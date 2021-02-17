extends Area2D
var isim="explosion"
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	if(anim_name=="default"):
		queue_free()
