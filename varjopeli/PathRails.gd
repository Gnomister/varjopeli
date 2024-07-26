extends PathFollow2D

#Find out why this has to be so small value
var SPEED = 0.02

func _process(delta):
	progress_ratio += SPEED * delta



