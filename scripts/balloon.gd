extends Area2D

var i=int(rand_range(0,6))
var isim="balloon"

const point=preload("res://scenes/point_scene.tscn");

const frame0=preload("res://spriteframes/yellow_spriteframes.tres");
const frame1=preload("res://spriteframes/red_spriteframes.tres");
const frame2=preload("res://spriteframes/blue_spriteframes.tres");
const frame3=preload("res://spriteframes/orange_spriteframes.tres");
const frame4=preload("res://spriteframes/purple_spriteframes.tres");
const frame5=preload("res://spriteframes/green_spriteframes.tres");
const frame6=preload("res://spriteframes/pink_spriteframes.tres");
var series=[frame0,frame1,frame2,frame3,frame4,frame5,frame6]
var x_speed;
var velocity;
var destroy=false;
func _ready():
	var a=160-2*globals.wave;var b=160+2*globals.wave;#balon hızı randomluğu
	if a<140:
		a=140
	if b>185:
		b=185;
	x_speed=rand_range(a,b);
	var s=rand_range(-0.025,0.025);
	self.scale +=Vector2(s,s);
	velocity=Vector2(x_speed,0);
	$AnimatedSprite.frames=series[i];
func _process(delta):
	self.position +=velocity*delta;
	self.rotation +=delta
	if destroy:
		_destroy();
	if self.position.x>360:
		self.queue_free();
func _on_Area2D_area_entered(area):
	if destroy==false:
		if area.isim=="arrow":
			area.queue_free();
			$AudioStreamPlayer.play();
			destroy=true
		if area.isim=="bonus":
			print("bonussss")
			destroy=true
			$AudioStreamPlayer.play();
func _on_Timer_timeout():
	pass
func _destroy():
	$AnimatedSprite.play("pop");
	
	if $AnimatedSprite.frame==5:
		if i==0:
			globals.ok_sayisi +=1;
		if i==2:
			globals.ok_sayisi +=2;
		if i==3:
			globals.ok_sayisi +=1;
		if i==6:
			globals.ok_sayisi +=3;
		globals.vurulan_balon +=1;
		if globals.bonus_point<=100:
			if i==0:
				globals.bonus_point +=5;
				call_point(5);
			if i==1:
				globals.bonus_point +=5;
				call_point(5);
			if i==2:
				globals.bonus_point +=5;
				call_point(5);
			if i==3:
				globals.bonus_point +=0;
			if i==4:
				globals.bonus_point +=5;
				call_point(5);
			if i==5:
				globals.bonus_point +=5;
				call_point(5);
			if i==6:
				globals.bonus_point +=5;
				call_point(5);
			if i==7:
				globals.bonus_point +=0;
		self.queue_free()
func call_point(i):
	var p=point.instance()
	p.eklenecek=i;
	p.position=self.position;
	get_parent().add_child(p);
