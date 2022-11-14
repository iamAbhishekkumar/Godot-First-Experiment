extends Area2D
tool  # will make the chnages in editor
 
onready var anim_player : AnimationPlayer = $AnimationPlayer

# changing scenes
# packed scene is type of tcsn 
export var next_scene : PackedScene

func _get_configuration_warning() -> String:
	return "Add the next scene property" if not next_scene else ""

func teleport() -> void:
	anim_player.play("Fade In")
	yield(anim_player,"animation_finished")
	get_tree().change_scene_to(next_scene)
	


func _on_Portal_body_entered(body: Node) -> void:
	teleport()
	
