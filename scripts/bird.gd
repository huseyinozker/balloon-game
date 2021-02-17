extends Area2D
var isim="bird"
func _ready():
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func _physics_process(delta):
	translate(Vector2(2.5,0))

func _on_Area2D_area_entered(area):
	if area.isim=="arrow":
		$AudioStreamPlayer.play()
		area.queue_free()
		globals.bonus_point -=10;
		#globals.ok_sayisi -=1;
		$AnimatedSprite.queue_free()
		$explosion.visible=true;
		$explosion.play("default")

func _on_explosion_animation_finished():
	self.queue_free()


