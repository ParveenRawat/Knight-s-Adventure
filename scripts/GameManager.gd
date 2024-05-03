extends Node

var collected_coin = 0
@onready var coins = $Label4
@onready var coin = $coin
@onready var win_text = $"../Player/Camera2D/WinText"

func _ready():
	win_text.visible = false
	coin.visible = false

func add_coin():
	collected_coin += 1
	if collected_coin == 15:
		win_text.visible = true
	coins.text = "You collected :    x "+str(collected_coin)

func _on_coin_15_body_entered(body):
	coin.visible = true
	
func _on_quit_pressed():
	get_tree().quit()


func _on_ok_pressed():
	win_text.visible = false
