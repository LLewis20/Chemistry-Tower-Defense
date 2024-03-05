extends Node


func _ready():
	load_main_menu()

func load_main_menu():
	get_node("MainMenu/MarginContainer/VBoxContainer/PlayButton").connect("pressed", Callable(self, "_on_play_button_pressed"))
	get_node("MainMenu/MarginContainer/VBoxContainer/ExitButton").connect("pressed", Callable(self, "_on_exit_button_pressed"))


func _on_play_button_pressed():
	get_node("MainMenu").queue_free()
	var game_scene = load("res://Scenes/MainScenes/game_scene.tscn").instantiate()
	game_scene.connect("game_finished", Callable(self, 'unload_game'))
	add_child(game_scene)


func _on_exit_button_pressed():
	get_tree().quit()


func unload_game(_result):
	get_node("GameData").queue_free()
	var main_menu = load("res://Scenes/UIScenes/main_menu.tscn").instantiate()
	add_child(main_menu)
	load_main_menu()
