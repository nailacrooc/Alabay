extends CanvasModulate

const MINUTES_PER_DAY = 1440
const MINUTES_PER_HOUR = 60
const INGAME_TO_REAL_MINUTE_DURATION = (2 * PI) / MINUTES_PER_DAY

signal time_tick(day:int, hour:int, minute:int)

var total_minutes
var day
var current_day_minutes
var hour
var minute

@export var gradient_texture: GradientTexture1D
@export var INGAME_SPEED = 4.0
@export var INITIAL_HOUR = 12:
	set(h):
		INITIAL_HOUR = h
		time = INGAME_TO_REAL_MINUTE_DURATION * MINUTES_PER_HOUR * INITIAL_HOUR

var time: float = 0.0
var past_minute: int = -1

func _ready() -> void:
	time = INGAME_TO_REAL_MINUTE_DURATION * MINUTES_PER_HOUR * INITIAL_HOUR

func _process(delta: float) -> void:
	time += delta * INGAME_TO_REAL_MINUTE_DURATION * INGAME_SPEED
	
	if gradient_texture and gradient_texture.gradient:
		var value = (sin(time - PI / 2.0) + 1.0) / 2.0
		self.color = gradient_texture.gradient.sample(value)
	
	_recalculate_time()

func _recalculate_time() -> void:
	total_minutes = int(time / INGAME_TO_REAL_MINUTE_DURATION)
	day = int(total_minutes / MINUTES_PER_DAY)
	current_day_minutes = total_minutes % MINUTES_PER_DAY

	hour = int(current_day_minutes / MINUTES_PER_HOUR)
	minute = int(current_day_minutes % MINUTES_PER_HOUR)
	
	if past_minute != minute:
		past_minute = minute
		time_tick.emit(day, hour, minute)

