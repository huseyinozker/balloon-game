extends Node2D
const wave_counter_scene=preload("res://scenes/wave_counter.tscn");
func _ready():
	globals.ekleme=0;##ödülü 0 lıyoruz
	globals.pause_mod=true;
	$Label.text="Wave " + str(globals.wave) + " Failed!";

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_continue_buttton_pressed():
	var wave_counter=wave_counter_scene.instance();
	wave_counter.position=get_viewport_rect().position/2;
	get_parent().add_child(wave_counter);
	self.queue_free()