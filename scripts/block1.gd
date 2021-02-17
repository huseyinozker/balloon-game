extends Area2D
const particle=preload("res://scenes/explosion_particle.tscn");
var isim="blok"

func _ready():
	pass
func _process(delta):
	if globals.pause_mod==true:
		self.queue_free()
func _on_Area2D_area_entered(area):
	if area.isim=="arrow":
		area.queue_free()
		add_particle();
		self.queue_free()
func add_particle():
	var p=particle.instance();
	p.position=self.position;
	get_parent().add_child(p);