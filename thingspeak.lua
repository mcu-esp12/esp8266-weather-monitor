print("Send data to the thingspeak.com")
conn=net.createConnection(net.TCP, 0) 
conn:on("receive", function(conn, payload) print(payload) end)
-- api.thingspeak.com 184.106.153.149
conn:connect(80,'184.106.153.149') 
conn:send("GET /update?key=%ключ_канала%&field1="..t.."&field2="..h.."&field3="..p.." HTTP/1.1\r\n") 
conn:send("Host: api.thingspeak.com\r\n") 
conn:send("Accept: */*\r\n") 
conn:send("User-Agent: Mozilla/4.0 (compatible; esp8266 Lua; Windows NT 5.1)\r\n")
conn:send("\r\n")
conn:on("sent",function(conn)
                      print("Data has been sent")
                      conn:close()
                  end)
conn:on("disconnection", function(conn)
                      print("Connection closed")
end)
-- Don't forget to release it after use
collectgarbage()
