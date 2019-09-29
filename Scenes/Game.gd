extends Node

var animationActive = 0;
var LifeMonster = 100;
var FoodMonster = 100;
var EmotionMonster = 100;
var tiempoDia = 0;
var EmotionofDay = "";
var EmotionofYesterday = "";
var Emotions = ["Angry", "Anxiety", "depression"];
var stateSleep = false;
var stateEmotion = false;
var stateShop = true;
var stateGames = true;
var stateEat = true;


##Funcion inicial del juego
func _ready():
	
	$AnimationMonster.start();
	$LifeMonsterTimer.start();
	animationActive = 1;
	setEmotionofDay();
	
	#Update the position of monster in middle of screen
	var viewportWidth = get_viewport().size.x
	var viewportHeight = get_viewport().size.y
	var player = get_node("Monster")
	player.set_position(Vector2(viewportWidth/2, (viewportHeight)/2))
	get_tree().get_root().connect("size_changed", self, "reSize")


#Funcion de ajuste del tamaño de la ventana
func reSize():
	var viewportWidth = get_viewport().size.x
	var viewportHeight = get_viewport().size.y	
	var player = get_node("Monster")
	player.set_position(Vector2(viewportWidth/2, (viewportHeight)/2))	


func _on_Home_pressed():
	get_tree().change_scene('res://Scenes/Menu.tscn')


func _on_AnimationMonster_timeout():
	var sprite_player = get_node("Monster/sprite_player")
	
	if(animationActive == 1):
		sprite_player.animation = "Breathing"
		sprite_player.play()
		animationActive = 2
	elif(animationActive == 2):
		sprite_player.animation = "Still"
		sprite_player.play()
		animationActive = 1
		


#Manejo de la salud
func getLifeMonster():
	return LifeMonster;


func setLifeMonster(number):
	LifeMonster = LifeMonster + number; 


#Manejo de la comida
func getFoodMonster():
	return FoodMonster;


func setFoodMonster(number):
	FoodMonster = FoodMonster + number;

	
#Manejo de las emociones del monstruo
func getEmotionMonster():
	return EmotionMonster;


func setEmotionMonster(number):
	EmotionMonster = EmotionMonster + number;	


#Manejo de la emocion del dia
func getEmotionofDay():
	return EmotionofDay;


func setEmotionofDay():
	
	var numberRandom = randi() % 3;
	if(EmotionofYesterday == ""):
		EmotionofDay = Emotions[numberRandom];	
	else:	
		while(Emotions[numberRandom] == EmotionofYesterday):	
			numberRandom = randi() % 3;
		EmotionofYesterday = EmotionofDay;
		EmotionofDay = Emotions[numberRandom];


#Timer manejador de la vida del monstruo
func _on_LifeMonsterTimer_timeout():
	tiempoDia = tiempoDia + 1; #Se aumenta cada minuto
	FoodMonster = FoodMonster - 1;
	EmotionMonster = EmotionMonster - 1;
	
	if(FoodMonster < 50):
		LifeMonster = LifeMonster - 1;
	if(EmotionMonster < 50):
		LifeMonster = LifeMonster - 1;
	
	if(tiempoDia == 60):
		tiempoDia = 0;
		setEmotionofDay();
	
	print(LifeMonster)
	print(FoodMonster)
	print(EmotionMonster)
	print(tiempoDia)



