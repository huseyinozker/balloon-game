extends Node2D
var eklenecek;
var zaman=0;
func _ready():
	$Label.text="+" + str(eklenecek)

func _process(delta):
	if zaman<1:
		self.position +=Vector2(5,-5)*delta;
	if zaman==1:
		self.queue_free();
func _on_Timer_timeout():
	zaman +=1;
