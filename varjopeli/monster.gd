extends CharacterBody2D

var speed = 180

signal disable_patrol

#### PATHFINDING CODE AND AGGRO RANGE TOGGLER
@export var target: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D

# 
func _on_aggro_range_body_entered(body):
	if target and body == target:
		print("body entered aggro range: ", body.name)
		$PathfindingUpdater.start()
		$PointLight2D.show()
		speed = 180

func _physics_process(delta: float) -> void:
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * speed
	move_and_slide()

func _on_aggro_range_body_exited(body):
	if target and body == target:
		print("body left aggro range: ", body.name)
		#$PathfindingUpdater.stop()
		speed = 90
		$PointLight2D.hide()

func makepath() -> void:
	nav_agent.target_position = target.global_position

func _on_timer_timeout():
	makepath()
