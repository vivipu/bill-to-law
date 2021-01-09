extends KinematicBody2D
onready var score = 3
onready var community_finished = false
onready var hopper_unlock = false
onready var hopper_finished = false
onready var committee_unlock = false
onready var committee_won = false
onready var committee_lost = false
onready var floor_unlock = false
onready var floor_won = false
onready var floor_lost = false
onready var president_unlock = false
onready var president_won = false
onready var president_lost = false
func _ready():
	pass # Replace with function body.
var movespeed = 200
onready var ProblemPopup = get_node("CanvasLayer/ProblemPopup")
onready var comm_finished_sprite = get_node("CanvasLayer/CommunityFinished")
onready var HopperPopup = get_node("CanvasLayer/HopperPopup")
onready var hopp_finished_sprite = get_node("CanvasLayer/HopperFinished")
onready var CommitteePopup = get_node("CanvasLayer/CommitteePopup")
onready var CommitteePopup2 = get_node("CanvasLayer/CommitteePopup2")
onready var CommitteeLostPopup = get_node("CanvasLayer/CommitteeLostPopup")
onready var CommitteeWonPopup = get_node("CanvasLayer/CommitteeWonPopup")
onready var FloorHouse = get_node("CanvasLayer/FloorHouse")
onready var HouseLost = get_node("CanvasLayer/HouseLost")
onready var SenatePopup = get_node("CanvasLayer/SenatePopup")
onready var SenateLost = get_node("CanvasLayer/SenateLost")
onready var SenateWon = get_node("CanvasLayer/SenateWon")
func _physics_process(delta):
	var motion = Vector2()
	if Input.is_action_pressed("up"):	
		motion.y -= 1
		$AnimatedSprite.play("default")
	if Input.is_action_pressed("down"):
		motion.y += 1
		$AnimatedSprite.play("default")
	if Input.is_action_pressed("right"):
		motion.x += 1
		$AnimatedSprite.play("default")
	if Input.is_action_pressed("left"):
		motion.x -= 1
		$AnimatedSprite.play("default")
	if Input.is_action_just_released("down") or Input.is_action_just_released("left") or Input.is_action_just_released("right") or Input.is_action_just_released("up"):
		$AnimatedSprite.stop()
	motion = motion.normalized()
	motion = move_and_slide(motion * movespeed)
func _on_Area2D_body_entered(body):
	if "Community" in body.name:
		if community_finished == false:
			ProblemPopup.popup()
	if "Hopper" in body.name:
		if hopper_unlock == true and hopper_finished == false:
			HopperPopup.popup()
	if "Committee" in body.name:
		if committee_unlock == true and committee_won == false and committee_lost == false:
			CommitteePopup.popup()
	if "Floor" in body.name:
		if floor_unlock == true and floor_won == false and floor_lost == false:
			FloorHouse.popup()
	if "President" in body.name:
		if president_unlock == true and president_won == false and president_lost == false:
			pass
func _on_OK_pressed():
	ProblemPopup.hide()
	community_finished = true
	hopper_unlock = true
	comm_finished_sprite.show()
func _on_Entered_pressed():
	HopperPopup.hide()
	hopper_finished = true
	committee_unlock = true
	hopp_finished_sprite.show()
func _on_B_pressed():
	CommitteePopup.hide()
	CommitteePopup2.popup()
func _on_A_pressed():
	CommitteePopup.hide()
	CommitteeLostPopup.popup()	
func _on_Ok2_pressed():
	CommitteeLostPopup.hide()
	$CanvasLayer/CommitteeLost.show()
	$CanvasLayer/GoBack.show()
	committee_lost = true
func _on_GoBack_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")
func _on_C_pressed():
	CommitteePopup.hide()
	CommitteeLostPopup.popup()
func _on_Ok3_pressed():
	CommitteeWonPopup.hide()
	$CanvasLayer/CommitteeWon.show()
	$CanvasLayer/HopperFinished.show()
	$CanvasLayer/CommunityFinished.show()
	committee_won = true
	floor_unlock = true
func _on_A2_pressed():
	CommitteePopup2.hide()
	CommitteeLostPopup.popup()
func _on_B2_pressed():
	CommitteePopup2.hide()
	CommitteeLostPopup.popup()
func _on_C2_pressed():
	CommitteePopup2.hide()
	CommitteeWonPopup.popup()
	$CanvasLayer/HopperFinished.hide()
	$CanvasLayer/CommunityFinished.hide()
func _on_B3_pressed():
	FloorHouse.hide()
	HouseLost.popup()
func _on_Ok4_pressed():
	HouseLost.hide()
	$CanvasLayer/FloorLost.show()
	floor_lost = true
	$CanvasLayer/GoBack.show()
func _on_C3_pressed():
	FloorHouse.hide()
	HouseLost.popup()
func _on_A3_pressed():
	FloorHouse.hide()
	SenatePopup.popup()
func _on_Ok5_pressed():
	SenateLost.hide()
	$CanvasLayer/FloorLost.show()
	floor_lost = true
	$CanvasLayer/GoBack.show()
func _on_Ok6_pressed():
	SenateWon.hide()
	$CanvasLayer/FloorWon.show()
	floor_won = true
	president_unlock = true
func _on_A4_pressed():
	SenatePopup.hide()
	SenateLost.popup()
func _on_B4_pressed():
	SenatePopup.hide()
	SenateLost.popup()
func _on_C4_pressed():
	SenatePopup.hide()
	SenateWon.popup()
