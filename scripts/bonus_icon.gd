extends Node2D
var enter=false;
const bonus1=preload("res://scenes/bonus1.tscn");
const bonus2=preload("res://scenes/bonus2.tscn");
const bonus3=preload("res://scenes/bonus3.tscn");
const bonus4=preload("res://scenes/bonus4_container.tscn");
var bonus_array=[bonus1,bonus2,bonus3,bonus4]
func _ready():
	pass
func _process(delta):
	pass
func _spawn_bonus():
	if globals.bonus_point>=100:
		var i=int(rand_range(1,4));
		var b=bonus_array[i].instance();
		if i==2:
			var a=bonus_array[i].instance();
			a.position=Vector2(rand_range(80,160),rand_range(60,120));
			get_parent().add_child(a)
			b.position=Vector2(rand_range(160,250),rand_range(60,180));
		else:
			b.position=get_parent().get_node("spawn_pos").position;
		get_parent().add_child(b);
		globals.bonus_point =0;

func _on_TextureButton_pressed():
	_spawn_bonus();

func _on_TextureButton_mouse_entered():
	enter=true
func _on_TextureButton_mouse_exited():
	enter=false;
