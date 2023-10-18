extends CanvasLayer


func level_transition(target: String):
	$AnimationPlayer.play("FadeToBlack")
	await $AnimationPlayer.animation_finished
	get_tree().unload_current_scene()
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards("FadeToBlack")
