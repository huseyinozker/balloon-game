extends Node2D
var counter =3;
func _ready():
	globals.ok=globals.wave + 1 + globals.ekleme;
	globals.ok_sayisi=globals.ok;
	globals.vurulan_balon=0;
	globals.pause_mod=true;

func _process(delta):
	self.z_index=1;
	if(counter>-1):
		$counter_txt.text=str(counter);
	$wave_txt.text="WAVE  " + str(globals.wave);
	if(counter==-1):
		globals.menu_created=false;
		globals.vurulan_balon=0;
		globals.pause_mod=false;
		globals.ekleme=0;
		#####* blok ekleme işlemleri
		if globals.wave > 5 && globals.wave < 8:
			var block1 = preload("res://scenes/block1.tscn")
			var b=block1.instance();b.position=Vector2(rand_range(30,250),250);
			get_parent().add_child(b);
		if globals.wave >=8 && globals.wave <15:
			var block2 = preload("res://scenes/block2.tscn")
			var b=block2.instance();b.position=Vector2(rand_range(30,250),250);
			get_parent().add_child(b);
		#####*
		self.queue_free()
	
func _on_Timer_timeout():
		counter -=1;