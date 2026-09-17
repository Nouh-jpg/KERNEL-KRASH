class_name Swarmer
extends Node2D

signal reached_core(enemy: Swarmer)
signal defeated(enemy: Swarmer)

const PINK := Color("ff48b0")
const YELLOW := Color("ffe066")

var route: Array[Vector2] = []
var progress := 0.0
var speed := 1.3
var health := 3.0
var max_health := 3.0
var finished := false

func configure(points: Array[Vector2], hit_points: float, tiles_per_second: float) -> void:
	route = points.duplicate()
	max_health = hit_points
	health = hit_points
	speed = tiles_per_second
	if not route.is_empty():
		position = route[0]
	queue_redraw()

func _process(delta: float) -> void:
	if finished or route.size() < 2:
		return
	progress += speed * delta
	if progress >= route.size() - 1:
		finished = true
		position = route[route.size() - 1]
		reached_core.emit(self)
		queue_free()
		return
	var index := floori(progress)
	position = route[index].lerp(route[index + 1], progress - index)

func take_damage(amount: float) -> void:
	if finished:
		return
	health = maxf(health - amount, 0.0)
	queue_redraw()
	if health <= 0.0:
		finished = true
		defeated.emit(self)
		queue_free()

func _draw() -> void:
	draw_circle(Vector2.ZERO, 16.0, PINK)
	draw_rect(Rect2(Vector2(-18, -25), Vector2(36.0 * health / max_health, 3)), YELLOW)
