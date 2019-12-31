--API Definitions--
net = require("network")
com = require("component")
serial = require("serialization")
event = require("event")
coroutine = require("coroutine")

--Component Definitions--
ender = com.ender_chest
trans = com.transposer

--Localizations--
local client

--Trades--
local Trades = {
  
}

--Functions--

function tcpConnect (_, _, chn, rmAd, prt) --Handles TCP connection intialization
  client = {channel = chn, address = rmAd, port = prt}
  print("Connection to " .. host.address .. ":" .. host.port .. " on channel " .. host.channel)
  net.tcp.send(client.channel, "USR?")
  event.listen("tcp","message", client.channel, tcpHandler)
end

function tcpHandler (_, _, chn, dat, rmAd, prt)
  if dat == "Rq_Trades" then
    serial.serialize(Trades)
    net.tcp.send(
  end
end

--Main--
event.listen("tcp","connection", tcpConnect())
net.tcp.listen(300)

while true do



end
