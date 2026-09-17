extends Node2D

const CELL := 64
const ORIGIN := Vector2(120, 120)
const COLS := 15
const ROWS := 8
const PATH := [Vector2i(0, 4), Vector2i(1, 4), Vector2i(2, 4), Vector2i(3, 4), Vector2i(3, 3), Vector2i(3, 2), Vector2i(4, 2), Vector2i(5, 2), Vector2i(6, 2), Vector2i(6, 3), Vector2i(6, 4), Vector2i(7, 4), Vector2i(8, 4), Vector2i(9, 4), Vector2i(10, 4), Vector2i(10, 5), Vector2i(11, 5), Vector2i(12, 5), Vector2i(13, 5), Vector2i(14, 5)]
const CYAN := Color("00ffff")
const PINK := Color("ff48b0")
const YELLOW := Color("ffe066")

var towers: Array[Vector2i] = []
var enemies: Array[Dictionary] = []
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
			enemies.append({"distance": 0.0, "hp": float(2 + wave), "max_hp": float(2 + wave)})
			spawn_remaining -= 1
			spawn_clock = 0.8
	for i in range(enemies.size() - 1, -1, -1):
		enemies[i].distance += delta * (1.3 + 0.08 * wave)
		if enemies[i].distance >= PATH.size() - 1:
			enemies.remove_at(i)
			health -= 1
			if health <= 0:
				game_over = true
				hint.text = "SYSTEM FAILURE // PRESS R TO RESTART"
	fire_clock -= delta
	if fire_clock <= 0.0:
		fire_clock = 0.55
		for tower in towers:
			var tower_pos := cell_center(tower)
			var target_index := -1
			var furthest := -1.0
			for i in range(enemies.size()):
				if tower_pos.distance_to(enemy_position(enemies[i])) <= 165.0 and enemies[i].distance > furthest:
					target_index = i
					furthest = enemies[i].distance
			if target_index >= 0:
				bolts.append({"from": tower_pos, "to": enemy_position(enemies[target_index]), "life": 0.12})
				enemies[target_index].hp -= 1.0
				if enemies[target_index].hp <= 0.0:
					enemies.remove_at(target_index)
					credits += 10
	for i in range(bolts.size() - 1, -1, -1):
		bolts[i].life -= delta
		if bolts[i].life <= 0.0:
			bolts.remove_at(i)
	update_hud()
	queue_redraw()

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.keycode == KEY_R:
		get_tree().reload_current_scene()
	elif event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and not game_over:
		var cell := Vector2i(floori((event.position.x - ORIGIN.x) / CELL), floori((event.position.y - ORIGIN.y) / CELL))
		if cell.x >= 0 and cell.x < COLS and cell.y >= 0 and cell.y < ROWS and not PATH.has(cell) and not towers.has(cell) and credits >= 50:
			towers.append(cell)
			credits -= 50
			update_hud()
			queue_redraw()

func cell_center(cell: Vector2i) -> Vector2:
	return ORIGIN + Vector2(cell) * CELL + Vector2.ONE * CELL * 0.5

func enemy_position(enemy: Dictionary) -> Vector2:
	var progress: float = enemy.distance
	var index := mini(floori(progress), PATH.size() - 2)
	return cell_center(PATH[index]).lerp(cell_center(PATH[index + 1]), progress - index)

func update_hud() -> void:
	hud.text = "CORE: %02d     DATA: %03d     WAVE: %02d" % [health, credits, wave]

func _draw() -> void:
	for x in range(COLS):
		for y in range(ROWS):
			var cell := Vector2i(x, y)
			var rect := Rect2(ORIGIN + Vector2(cell) * CELL + Vector2.ONE, Vector2.ONE * (CELL - 2))
			draw_rect(rect, Color("212b42") if PATH.has(cell) else Color("101c32"))
			draw_rect(rect, Color("38536b"), false, 1.0)
	for cell in towers:
		var p := cell_center(cell)
		draw_rect(Rect2(p - Vector2(18, 18), Vector2(36, 36)), CYAN)
		draw_rect(Rect2(p - Vector2(8, 8), Vector2(16, 16)), Color("101c32"))
	for enemy in enemies:
		var p := enemy_position(enemy)
		draw_circle(p, 16.0, PINK)
		draw_rect(Rect2(p + Vector2(-18, -25), Vector2(36.0 * enemy.hp / enemy.max_hp, 3)), YELLOW)
	for bolt in bolts:
		draw_line(bolt.from, bolt.to, YELLOW, 3.0)
	draw_rect(Rect2(ORIGIN + Vector2(14, 5) * CELL + Vector2(7, 7), Vector2(50, 50)), CYAN, false, 4.0)
