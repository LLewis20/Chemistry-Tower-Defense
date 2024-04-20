# Scenes

## SceneHandler
#### SceneHandler.tscn
For this project, the SceneHandler file will be the main scene for the project. It will always be the parent node in the tree when the game is running. Currently when the project starts running, we have already instantiated the MainMenu as a child within the SceneHandler tree. The main menu music is also a child within this scene, from this you should be able to change the volume of the music that starts playing when the game starts running.

#### SceneHandler\.gd
The file that is attached to SceneHandler.tscn has very basic functions within the file, the main functions within this file are ``load_main_menu()`` and ``unload_game()``. The ``load_main_menu()`` function is called anytime when the SceneHandler scene is called and will load the main menu scene. The ``unload_game()`` function is called when the game is over and will unload GameScene and load the main menu scene. Other methods within this file are used to define what the buttons on the main menu will do when they are clicked.

___

## Enemies
### Enemy Scenes
The enemy scenes are currently all sperated for each type of acid that is in the game. The function and node tree are all the same for each enemy, the only difference is some variables within each file for the enemies which will be discussed in the Enemy\.gd file section.

The enemy scenes parent nodes are a PathFollow2D node this is used to move the spirte along the path that is defined within the GameScene. The enemy scenes also have a CharacterBody2D node that is used to define the collision shape of the enemy and the animated sprite that is used to display the enemy on the screen. Finally, the enemy scenes have a TextureProgressBar node to display the health of the enemy on the screen to to player.

### Enemy\.gd
The Enemy files will all have the same layout, the only difference between the files are that some variables are changed to make stats for some enemies better or worse than others. The most important variables are the first five that appear in the file, these are the variables that are used to define the state of the enemy.

#### ```_ready()```
When called the animation for the enemy moving will start playing along with setting values for the health bar.

#### ```_physics_process()```
This function is called every frame and a conditional will check if the enemy is at the end of the path, if it is the the program will emit a signal to the GameScene to reduce the players health based off of the enemies damage variable. After we will ```queue_free()``` the enemy to remove it from memory. If the enemy is not at the end of the path then we will move the enemy along the path.

#### ```move()```
This function is used to move the enemy along the path that is defined in the GameScene.

#### ```on_hit()```
This function is called when the enemy is hit by a tower, the function will reduce the enemies health by the amount of damage that the tower does. If the enemies health is less than or equal to zero then the enemy will play an animation to show that the enemy has died, the function will next emit signal to add currency to the player and then ```on_destroy()``` the enemy to remove it from memory.

___

## Turrrets
### Turret Scenes
The turret scenes have the same tree set up the only difference is the number of muzzle flashes that are attached to the barrel of the turret.

The turret scenes parent node is a Node2D node, after that we have the sprite for the turret, with a Marker2D node as a child that will mark the flash locations for the muzzle flashes. The next set of nodes is an Area2D to mark the collision of the turret. Finally, we have an AnimationPlayer node to play the animations for the turret and an audio node to play shooting noises.

### Turrets\.gd
Each turret has their own script that inherits from the [Turrets.gd](./Turrets/Turrets.gd) script since all turrets have the same functions just different numbers for their stats. We first create some variables that we will need to track enemies when they come into the turrets range.

#### ```_ready()```
In this function we will use the CollisionShape2D node and set it's size equal to the range of the turrets which is defines within the GameData.gd singleton.

#### ```_physics_process()```
For this function we will check if there is an enemy within our range, if there is we will call the ```select_enemy()``` method and then call the ```turn()``` method. Finally, if the turret is off of it's cooldown we will call the ```fire()``` method.

#### ```turn()```
This function will turn the turret to face the enemy that we are currently targeting.

#### ```select_enemy()```
This function will take the enemy array and will find the enemy that is in the turrets range and is the furthest along the path.

#### ```fire()```
This function will first check to see if any enemies within the enemy array health is at or below 0 if so it erases that instance from the array. Next the function will check to see what type category the turrets is under, currently only hitscan is implemented, but the function for projectiles is there but not used. Finally, the function will call the signal ```on_hit()``` to the enemy that is currently being targeted, then the program will create a timer before the turret can shoot again. 

#### ```fire_gun()```
This function will play the animation for the turret shooting and play the sound for the turret shooting.

___

## Maps
#### map1.tscn
The map1 scene is the first map that has been created for the game. The map scene starts with the parent node of a Node2D, the first child node is a TileMap node that is used to create the visuals that the player will see when the game is running. The next child node is another TileMap node, this map is used to define the area where players can place turrets on the map. The next child node is a Path2D node that is used to define the path that the enemies will take when they are spawned. The final child node is a Node2D, we will add all the turrets that the player created under this node.

___

## Money Flask
#### MoneyFlask.tscn
This scene is used to create the flask that will spawn on the map for the player to answer questions from. The parent node for this scene is a Node2D, the first child node is a Sprite that is used to display the flask asset on the screen. The next child node is a Area2D with a CollisionShape2D node as a child, this is used to define the clickable area for the flask.

#### MoneyFlask\.gd
This file is used to define the functions for the flask that will spawn randomly on the map.

#### ```_ready()```
This function will create two functions which are ```correct_answer``` and ```incorrect_answer``` that will be used to emit signals to the GameScene.

#### ```_on_clickable_area_input_event()```
This function will be called when the flask is clicked on by the player. The function will call the method ```create_question()``` within the UI scene to create a question for the player to answer.

#### ```destroy_flask()```
This function will be called when the ```correct_answer``` or ```incorrect_answer``` functions are called. The function will ```queue_free()``` the flask to remove it from memory.

___

## GameScene
#### GameScene.tscn
This scene is a large scene becuase the HUD of the game is also built on this scene, this is because the HUD will always be the same and would never change. The parent node for this scene is a Node2D, the first child node is an instance of the map1.tscn scene. The next child node will be the a CanvasLayer node that will hold the HUD for the game. 

#### GameScene\.gd
The beginning of the file will have variables that are used to track many different things within the game scene. 

#### ```_ready()```
In the ```_ready()``` function we will find all the groups that are within the map1 scene, this allows us to give scenes that are in that group the method of ```initiate_build_mode()```.

#### ```_process(_delta)```
This function is called every frame and will check if different conditions, the first one is checking the balance of the players and what towers the player can build this is the responsibility of the ```check_money_and_price()``` function. The next condition is checking if there is a flask on the map that a player can click on, this is the responsibility of the ```check_and_spawn_flask()``` function. Finally, the last condition is checking if the player is in build mode, if so then we call the function ```update_tower_preview()```.

#### ```_unhandled_input(event)```
This function is called when the player presses a key on the keyboard or mouse. If the player presses their mouse button and are in build mode they will build the tower that they have selected, we will then call ```verify_and_build()``` and then we will call the ```cancel_build_mode()``` function. If the player presses the right mouse button and we have build mode on we will call the ```cancel_build_mode()``` function. We then have a conditional that will check if the player presses the ESC key, if so then a pause menu will appear.

#### ```start_next_wave()```
