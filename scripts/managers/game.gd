extends Node2D

const CELL := 64
const ORIGIN := Vector2(120, 120)
const COLS := 15
const ROWS := 8
const PATH := [Vector2i(0, 4), Vector2i(1, 4), Vector2i(2, 4), Vector2i(3, 4), Vector2i(3, 3), Vector2i(3, 2), Vector2i(4, 2), Vector2i(5, 2), Vector2i(6, 2), Vector2i(6, 3), Vector2i(6, 4), Vector2i(7, 4), Vector2i(8, 4), Vector2i(9, 4), Vector2i(10, 4), Vector2i(10, 5), Vector2i(11, 5), Vector2i(12, 5), Vector2i(13, 5), Vector2i(14, 5)]
const TOWER_SCENE := preload("res://scenes/towers/tower.tscn")
const SWARMER_SCENE := preload("res://scenes/enemies/swarmer.tscn")
const CYAN := Color("00ffff")
const PINK := Color("ff48b0")
const YELLOW := Color("ffe066")

var towers: Array[Vector2i] = []
var enemies: Array[Swarmer] = []
var bolts: Array[Dictionary] = []
var credits := 100
var health := 10
var wave := 0
var spawn_remaining := 0
var spawn_clock := 0.0
var wave_clock := 1.0
var fire_clock := 0.0
var game_over := false
var hud: Label
var hint: Label

func _ready() -> void:
	var title := Label.new()
	title.text = "KERNEL KRASH // DEFEND THE CORE"
	title.position = Vector2(120, 26)
	title.add_theme_font_size_override("font_size", 30)
	title.add_theme_color_override("font_color", CYAN)
	add_child(title)
	hud = Label.new()
	hud.position = Vector2(120, 76)
	hud.add_theme_font_size_override("font_size", 20)
	add_child(hud)
	hint = Label.new()
	hint.position = Vector2(120, 650)
	hint.add_theme_font_size_override("font_size", 18)
	hint.text = "CLICK AN EMPTY TILE: PLACE FIREWALL (50 DATA)    •    R: RESTART"
	add_child(hint)
	update_hud()
	queue_redraw()

func _process(delta: float) -> void:
	if game_over:
		return

	wave_clock -= delta
	if wave_clock <= 0.0 and spawn_remaining == 0 and enemies.is_empty():
		wave += 1
		spawn_remaining = 3 + wave * 2
		spawn_clock = 0.0
		wave_clock = 4.0

	if spawn_remaining > 0:
		spawn_clock -= delta
		if spawn_clock <= 0.0:
			spawn_enemy()
			spawn_remaining -= 1
			spawn_clock = 0.8

	fire_clock -= delta
	if fire_clock <= 0.0:
		fire_clock = 0.55
		for tower in towers:
			var tower_pos := cell_center(tower)
			var target := find_best_target(tower_pos)
			if target:
				bolts.append({"from": tower_pos, "to": target.position, "life": 0.12})
				target.take_damage(1.0)

	for i in range(bolts.size() - 1, -1, -1):
		bolts[i].life -= delta
		if bolts[i].life <= 0.0:
			bolts.remove_at(i)

	update_hud()
	queue_redraw()

func spawn_enemy() -> void:
	var s = SWARMER_SCENE.instantiate() as Swarmer
	var route_points: Array[Vector2] = []
	for p in PATH:
		route_points.append(cell_center(p))

	add_child(s)
	s.configure(route_points, float(2 + wave), 1.3 + 0.08 * wave)
	s.reached_core.connect(_on_enemy_reached_core)
	s.defeated.connect(_on_enemy_defeated)
	enemies.append(s)

func find_best_target(tower_pos: Vector2) -> Swarmer:
	var best: Swarmer = null
	var furthest := -1.0
	for e in enemies:
		if is_instance_valid(e) and not e.finished and not e.is_queued_for_deletion():
			var dist = tower_pos.distance_to(e.position)
			if dist <= 165.0:
				if e.progress > furthest:
					furthest = e.progress
					best = e
	return best

func _on_enemy_reached_core(enemy: Swarmer) -> void:
	if game_over: return
	enemies.erase(enemy)
	health = max(health - 1, 0)
	update_hud()
	if health <= 0:
		game_over = true
		hint.text = "SYSTEM FAILURE // PRESS R TO RESTART"
		for e in enemies:
			if is_instance_valid(e):
				e.set_process(false)

func _on_enemy_defeated(enemy: Swarmer) -> void:
	if game_over: return
	enemies.erase(enemy)
	credits += 10
	update_hud()

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.keycode == KEY_R:
		get_tree().reload_current_scene()
	elif event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and not game_over:
		var cell := Vector2i(floori((event.position.x - ORIGIN.x) / CELL), floori((event.position.y - ORIGIN.y) / CELL))
		if cell.x >= 0 and cell.x < COLS and cell.y >= 0 and cell.y < ROWS and not PATH.has(cell) and not towers.has(cell) and credits >= 50:
			towers.append(cell)
			var tower_node = TOWER_SCENE.instantiate()
			tower_node.position = cell_center(cell)
			add_child(tower_node)
			credits -= 50
			update_hud()
			queue_redraw()

func cell_center(cell: Vector2i) -> Vector2:
	return ORIGIN + Vector2(cell) * CELL + Vector2.ONE * CELL * 0.5

func update_hud() -> void:
	hud.text = "CORE: %02d     DATA: %03d     WAVE: %02d" % [health, credits, wave]

func _draw() -> void:
	for x in range(COLS):
		for y in range(ROWS):
			var cell := Vector2i(x, y)
			var rect := Rect2(ORIGIN + Vector2(cell) * CELL + Vector2.ONE, Vector2.ONE * (CELL - 2))
			draw_rect(rect, Color("212b42") if PATH.has(cell) else Color("101c32"))
			draw_rect(rect, Color("38536b"), false, 1.0)
	for bolt in bolts:
		draw_line(bolt.from, bolt.to, YELLOW, 3.0)
	draw_rect(Rect2(ORIGIN + Vector2(14, 5) * CELL + Vector2(7, 7), Vector2(50, 50)), CYAN, false, 4.0)
