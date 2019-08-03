

-- Id      : Rainbow  
-- Date    : 2016-02-08
-- File    : Rainbow.lua
-- Firmware: nodemcu_float_0.9.6-dev_20150704
-- Created : Claus Kuehnel

LED_PIN    = 1
TIME       = 40  -- 0.500 second,  2 Hz

i = 0

green = {0, 31, 63, 95, 127, 127, 127, 127, 127, 127, 127, 127, 127, 95, 63, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0}
red   = {127, 127, 127, 127, 127, 183, 63, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 31, 63, 95, 127, 127, 127, 127, 127}
blue  = {0, 0, 0, 0, 0, 0, 0, 0, 0, 31, 63, 95, 127, 127, 127, 127, 127, 127, 127, 127, 127, 95, 63, 31, 0}

print(table.getn(green))


function show()
  i = (i % table.getn(green))+1
  print(i, red[i], green[i], blue[i])
  COLOR = string.char(red[i],  green[i],  blue[i]):rep(72)
  ws2812.write(LED_PIN, COLOR)
end


tmr.alarm(SEQTIMERID, TIME, 1, function() show() end )

print("One WS2812 connected to D1 will changes its color repeatedly")
print("Stop this by tmr.stop(SEQTIMERID)")
show()
