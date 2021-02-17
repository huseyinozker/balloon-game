extends Node2D
const arrow_scene=preload("res://scenes/arrow.tscn");
func _ready():
	pass

func _process(delta):
	pass
func _fire():
	var i=0
	var coordinate=self.position + Vector2(25,0)
	while(i<7):
		var a=arrow_scene.instance();
		a.position=coordinate;
		get_parent().add_child(a);
		$AudioStreamPlayer2D.play();
		i+=1;
		coordinate +=Vector2(45,0)

func _on_Timer_timeout():
	_fire();


func _on_Timer2_timeout():
	self.queue_free()
