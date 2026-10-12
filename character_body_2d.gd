extends CharacterBody2D


const SPEED = 300.0

var toilet_paper_collected = 0

func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * SPEED

	move_and_slide()


func _on_pickup_area_area_entered(area) -> void:
	if area.is_in_group("stuffs") and not $HeldToiletPaper.visible:
		area.queue_free()
		$HeldToiletPaper.visible = true
		
	if area.is_in_group("skibidi basket") and $HeldToiletPaper.visible:
		$HeldToiletPaper.visible = false
		toilet_paper_collected += 1
		$CanvasLayer/ToiletPaperDisplay.text = "Toilet Paper:" + str(toilet_paper_collected)
