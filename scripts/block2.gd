extends Area2D
const particle=preload("res://scenes/explosion_particle.tscn");
var isim="blok"
var i=2;
var a;
var b;
func _ready():
	a=$Position2D.global_position.x
	b=$Position2D2.global_position.x
func _process(delta):
	self.translate(Vector2(i,0))
	if $AnimatedSprite.frame==3:
		add_particle()
		self.queue_free()
	if  self.global_position.x>a:
		i=-2
	if self.global_position.x<b:
		i=+2;
	if globals.pause_mod==true:
		self.queue_free()
	
	
func _on_Area2D_area_entered(area):
	if area.isim=="arrow":
		$AudioStreamPlayer.play()
		area.queue_free()
		$AnimatedSprite.frame +=2
func add_particle():
	var p=particle.instance();
	p.position=self.position;
	get_parent().add_child(p);