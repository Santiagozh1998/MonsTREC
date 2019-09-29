extends Control


func _ready():
	##print("Resizing: ", get_viewport().size, OS.get_screen_size())
	get_tree().get_root().connect("size_changed", self, "reSize")

func reSize():
	
    print("Resizing: ", get_viewport().size, OS.get_screen_size())
	##print("Resizing: ", OS.get_screen_size())
	
func _on_Options_pressed():
	get_tree().change_scene('res://Scenes/OptionsGame.tscn')


func _on_Credits_pressed():
	get_tree().change_scene('res://Scenes/CreditsGame.tscn')


func _on_NewGame_pressed():
	get_tree().change_scene('res://Scenes/Game.tscn')

func _on_Exit_pressed():
	get_tree().quit()
