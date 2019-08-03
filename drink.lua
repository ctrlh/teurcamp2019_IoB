-- Id      : Drink
-- Created : Dalin McClellan 

LED_PIN    = 1
FIRE_TIME       = 65

brt = 1
dir = 1
rnd = 0
pxoff = 0
i = 0
d = 0
wincount = 0

function show()
  d = math.random(500)
  if d == 1 then
    wincount = 30
  end
  if wincount > 0 then
    --You win! Drink!
    i = (i + 18*3) % (72 * 3)

	RED = string.char(0,255,0):rep(18)
	GREEN = string.char(255,0,0):rep(18)
	BLUE = string.char(0,0,255):rep(18)
	BLACK = string.char(0,0,0):rep(18)

	LONG = (RED..GREEN..BLUE..BLACK..RED..GREEN..BLUE..BLACK)

	COLOR = string.sub(LONG, i+1, i+(72*3)+1)

	ws2812.write(LED_PIN, COLOR)
	wincount = wincount - 1
  else
	  --Normal pattern
	  rnd = math.random(50)

	  if brt >= 15 then
		dir = -1
	  elseif brt <= 0 then
		dir = 1
	  elseif rnd <= 1 then
		dir = dir * -1
	  end

	  brt = math.floor( brt + dir )

		pxoff = 15 - brt

		HI = string.char(0,0,0):rep(pxoff)
		LIGHT = string.char(255,255,255):rep(3)
		LO = string.char(0,0,0):rep(15-pxoff)

		COLOR = (HI..LIGHT..LO..LO..LIGHT..HI):rep(2)

		ws2812.write(LED_PIN, COLOR)
  end
end


tmr.alarm(SEQTIMERID, FIRE_TIME, 1, function() show() end )

show()
