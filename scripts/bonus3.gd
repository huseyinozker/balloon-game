extends Area2D
var isim="bonus"
func _ready():
	#yield(get_tree().create_timer(1.50),"timeout");
	$AnimatedSprite.play("default")

func _process(delta):
	pass

func _on_Area2D_area_entered(area):
	if $AnimatedSprite.frame>1 && $AnimatedSprite.frame<11:
		if area.isim=="balloon":
			area.destroy=true;

func _on_AnimatedSprite_animation_finished():
	self.queue_free()
