extends Node2D

signal game_finished(result)

var map_node

var current_wave = 0
var enemies_in_wave = 0

var base_health = 100
var money = 50

var build_mode = false
var build_valid = false
var build_tile 
var build_location
var build_type
var category

var number_of_flask = 0
var spawn_flask = true

func _ready():
	map_node = get_node("Map1")
	create_flask()
	for i in get_tree().get_nodes_in_group("build_buttons"):
		i.pressed.connect(initiate_build_mode.bind(i.name))


func _process(_delta):
	check_number_of_flask()
	if build_mode:
		update_tower_preview()


func _unhandled_input(event):
	if event.is_action_released("ui_cancel") and build_mode == true:
		cancel_build_mode()
	if event.is_action_released("ui_accept") and build_mode == true:
		verify_and_build()
		cancel_build_mode()

##
## Wave Functions
##
func start_next_wave():
	var wave_data = retrieve_wave_data()
	await (get_tree().create_timer(0.2)).timeout
	spawn_enemies(wave_data)


func retrieve_wave_data():
	var wave_data = [
		["greenmonster", 0], ["greenmonster", 0],["greenmonster", 0],["greenmonster", 0],["greenmonster", 10],
		["greenmonster", 0], ["greenmonster", 0],["greenmonster", 0],["greenmonster", 0],["greenmonster", 0],["greenmonster", 10],
		["greenmonster", 0], ["greenmonster", 0],["greenmonster", 0],["greenmonster", 0],["greenmonster", 0],["greenmonster", 0],["greenmonster", 10],
	]
	current_wave += 1
	enemies_in_wave = wave_data.size()
	return wave_data


func spawn_enemies(wave_data):
	for i in wave_data:
		var new_enemy = load("res://Scenes/Enemies/" + i[0] + ".tscn").instantiate()
		new_enemy.connect("base_damage", Callable(self, "on_base_damage"))
		new_enemy.connect("add_money", Callable(self, "update_money"))
		map_node.get_node("Path2D").add_child(new_enemy, true)
		if i[1] > 0:
			await (get_tree().create_timer(i[1])).timeout
		else:
			await (get_tree().create_timer(randf_range(0.5, 3))).timeout


##
## BUILDING FUNCTIONS
##
func initiate_build_mode(tower_type):
	if build_mode:
		cancel_build_mode()
	print(tower_type)
	build_type = tower_type + "t1"
	build_mode = true 
	get_node("UI").set_tower_preview(build_type, get_global_mouse_position())


func update_tower_preview():
	var mouse_position = get_global_mouse_position()
	var current_tile = map_node.get_node("TowerExclusion").local_to_map(mouse_position)
	var title_position = map_node.get_node("TowerExclusion").map_to_local(current_tile)
	
	if map_node.get_node("TowerExclusion").get_cell_source_id(0, current_tile) == -1:
		get_node("UI").update_tower_preview(title_position, "fff")
		build_valid = true 
		build_location = title_position
		build_tile = current_tile
	
	else:
		get_node("UI").update_tower_preview(title_position, "000")
		build_valid = false


func cancel_build_mode():
	build_mode = false 
	build_valid = false 
	get_node("UI/TowerPreview").free()


func verify_and_build():
	if build_valid and money >= GameData.tower_data[build_type]['cost']:
		update_money(-GameData.tower_data[build_type]['cost'])
		var new_tower = load("res://Scenes/Turrets/" + build_type + ".tscn").instantiate()
		new_tower.position = build_location
		new_tower.built = true
		new_tower.type = build_type
		new_tower.category = GameData.tower_data[build_type]["category"]
		map_node.get_node("Turrets").add_child(new_tower, true)
		map_node.get_node("TowerExclusion").set_cell(0, build_tile, 6, Vector2(1, 0))


##
## Flask / QUESTION BOXES
##
func create_flask():
	if spawn_flask:
		var flask = load("res://Scenes/MoneyFlask/MoneyFlask.tscn").instantiate()
		flask.position = Vector2((randf_range(0,1000)), (randf_range(6,525)))
		$UI.connect("correct_answer", Callable(self, "_on_correct_answer"))
		map_node.add_child(flask, true)
		number_of_flask += 1
		await (get_tree().create_timer(randf_range(10,30))).timeout

func check_number_of_flask():
	if number_of_flask >= 4:
		spawn_flask = false
	elif number_of_flask < 4:
		await (get_tree().create_timer(randf_range(10,11))).timeout
		create_flask()
	else:
		spawn_flask = true
		create_flask()

func flask_answered():
	number_of_flask -= 1

##
## MIS FUNCTIONS
##
func on_base_damage(damage):
	base_health -= damage
	if base_health <= 0:
		emit_signal("game_finished", false)
	else:
		get_node("UI").update_health(base_health)


func update_money(amount):
	money += amount
	get_node("UI").change_cash_amount(money)
