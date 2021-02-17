extends Node2D
var i=3;
const arrow_scene=preload("res://scenes/arrow.tscn");
func _ready():
	pass

func _process(delta):
	translate(Vector2(i,0));
	if(self.position.x>320):
		i=-3;
	if(self.position.x<0):
		self.queue_free()

func _on_Timer_timeout():
	var a=arrow_scene.instance();
	a.position=self.position;
	get_parent().add_child(a);
	$AudioStreamPlayer2D.play();