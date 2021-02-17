extends Node2D
var admob = null
var isReal=false
var isTop=false
var adBannerId="ca-app-pub-3940256099942544/6300978111"
func _ready():
	if(Engine.has_singleton("AdMob")):
		admob= Engine.get_singleton("AdMob")
		admob.init(isReal,get_instance_id())
		loadBanner()

func _process(delta):
	$AudioStreamPlayer2D.position=$Camera2D.position

func _on_TextureButton_button_down():
	get_tree().change_scene("res://mainscene.tscn")
	$click.play();
	if admob !=null:
		admob.hideBanner();


func _on_TextureButton2_button_down():
	$Camera2D.position=Vector2(510,241)
	$click.play();


func _on_back_button_down():
	$Camera2D.position=Vector2(190,241)
	$click.play();


func _on_TextureButton3_button_down():
	$Camera2D.position=Vector2(-180,241)
	$click.play();


func _on_back2_button_down():
	$Camera2D.position=Vector2(130,241)
	$click.play();

func loadBanner():
	if admob != null :
		admob.loadBanner(adBannerId,isTop)

func _on_TextureButton2_toggled(button_pressed):
	if admob !=null:
		if button_pressed:
			admob.showBanner()
		else:
			admob.hideBanner()
