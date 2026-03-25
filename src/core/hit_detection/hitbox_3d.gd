class_name Hitbox3D
extends Area3D

@warning_ignore("unused_signal")
signal struck(id: int, hit_info: HitInfo)

@export var debug: bool = false
@export var root: Node3D

var active: bool = false
var id: int
var current_hit_info: HitInfo

@onready var colshape: CollisionShape3D = $CollisionShape3D
@onready var indicator: MeshInstance3D = $Indicator


func _ready() -> void:
	id = randi()
	area_entered.connect(_on_area_entered)


func setup(hit_info: HitInfo) -> void:
	current_hit_info = hit_info


func activate() -> void:
	active = true
	monitorable = true
	colshape.disabled = false
	indicator.visible = true if debug else false


func deactivate() -> void:
	active = false
	monitorable = false
	colshape.disabled = true
	indicator.visible = false


@warning_ignore("unused_parameter")
func _on_area_entered(area: Area3D) -> void:
	pass
