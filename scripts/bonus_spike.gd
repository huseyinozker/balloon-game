extends Area2D

var i=0;
var isim="bonus"
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if $AnimatedSprite.frame >2 && $AnimatedSprite.frame <6:
		$CollisionShape2D.disabled=false
	else:
		$CollisionShape2D.disabled=true;
	if get_parent().get_parent().get_node("PathFollow2D").offset>=160:
			$AnimatedSprite.play()
	if i==6:
		$AnimatedSprite.stop()
	if i==6:
		queue_free()
func _physics_process(delta):
	get_parent().get_parent().get_node("PathFollow2D").offset  +=100*delta;
	

func _on_AnimatedSprite_animation_finished():
		print(i)
		i+=1

func _on_Area2D_area_entered(area):
		pass