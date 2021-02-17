extends Node2D
var admob = null
var isReal=false
var isTop=true
var adRewardedId="ca-app-pub-3940256099942544/5224354917"
const wave_counter_scene=preload("res://scenes/wave_counter.tscn");
func _ready():
	IP.clear_cache()
	globals.ekleme=0;##ödülü 0 lıyoruz
	if(Engine.has_singleton("AdMob")):
		admob= Engine.get_singleton("AdMob")
		admob.init(isReal,get_instance_id())
		loadRewardedVideo()
	globals.pause_mod=true;
func _process(delta):
	$Label.text="Wave " + str(globals.wave -1) + " Completed";
func _on_continue_buttton_pressed():
	##globals.vurulacak_balon+=1;
	var wave_counter=wave_counter_scene.instance();
	wave_counter.position=get_viewport_rect().position/2;
	get_parent().add_child(wave_counter);
	self.queue_free()
func loadRewardedVideo():
	if admob !=null:
		admob.loadRewardedVideo(adRewardedId)
func _on_video_button2_pressed():
	if admob !=null:
		admob.showRewardedVideo()
func _on_rewarded_video_ad_left_application():
	globals.ekleme =3;