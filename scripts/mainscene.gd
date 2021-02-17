extends Node2D
const bird=preload("res://scenes/bird.tscn")
const arrow_object=preload("res://scenes/arrow.tscn")
const ballon_object=preload("res://scenes/balloon.tscn");
const wave_menu_scene=preload("res://scenes/wave_menu.tscn");
const wave_over_menu_scene=preload("res://scenes/wave_over_menu.tscn")
const bonus_icon_scene=preload("res://scenes/bonus_icon.tscn")
var side=1;
func _ready():
	
	$arrow_sprite.position=Vector2(310,get_viewport_rect().size.y-50);

func _process(delta):
	$bonus_txt.text=str(globals.bonus_point) + "/100"
	globals.vurulacak_balon=globals.wave;
	#ok harekeltleri
	if($arrow_sprite.position.x>10 && side==1):
		$arrow_sprite.position.x -=500*delta;
		if($arrow_sprite.position.x<=10):
			side=0;
	if($arrow_sprite.position.x<310 && side==0):
		$arrow_sprite.position.x +=500*delta;
		if($arrow_sprite.position.x>=310):
			side=1;
	######
	$arrow_txt.text=str(globals.ok_sayisi);
	##wave artışı
	if globals.pause_mod==false:
		if(globals.vurulan_balon==globals.vurulacak_balon):
			if globals.menu_created==false:
				_next_wave();
		if(globals.ok_sayisi==0):
			yield(get_tree().create_timer(1.00),"timeout");
			if globals.ok_sayisi==0:
				if(globals.vurulan_balon!=globals.vurulacak_balon):
					if globals.menu_created==false:
						_wave_failed();
func _input(event):
	###ok fırlatma işlemi
	if globals.pause_mod==false:
		if event is InputEventMouseButton && $spawner_icon.enter==false:
			if event.pressed:
				if globals.ok_sayisi>0:
					var arrow=arrow_object.instance();
					arrow.position=$arrow_sprite.position;
					get_parent().add_child(arrow);
					$AudioStreamPlayer.play();
					globals.ok_sayisi-=1;
	###
func _on_Timer_timeout():
	#IP.clear_cache()
	var balloon=ballon_object.instance();
	balloon.position=Vector2(-20,rand_range(30,180));
	get_parent().add_child(balloon);
	$Timer.wait_time=rand_range(0.8,1.25)
	var a=$Timer.wait_time
	print(a)
	###adding bird
	if globals.wave>10:
		randomize();
		var i=randi()%5+1;
		print(i)
		if i==1:
			add_bird();
func _next_wave():
		print("next cagrildi")
		globals.wave +=1;
		var menu=wave_menu_scene.instance();
		menu.position=get_viewport_rect().position/2;
		menu.z_index=1;
		get_parent().add_child(menu);
		globals.menu_created=true;
func _wave_failed():
		print("failed cagrildi")
		if globals.vurulan_balon!=globals.vurulacak_balon:
			var menu=wave_over_menu_scene.instance();
			menu.position=get_viewport_rect().position/2;
			menu.z_index=1;
			get_parent().add_child(menu);
			globals.menu_created=true;
			
func add_bird():
	var b=bird.instance();
	b.position=Vector2(-20,rand_range(30,180));
	get_parent().add_child(b);