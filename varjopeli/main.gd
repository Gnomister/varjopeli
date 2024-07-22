extends Node

@onready var GlobalDarkener = $GlobalDarkener
 #Called when the node enters the scene tree for the first time.
func _ready():
	GlobalDarkener.color =  Color(0,0,0,1)
	

 #Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
