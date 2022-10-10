if not game:IsLoaded() then
    game.Loaded:Wait()
end

local getgenv = getgenv
local url = getgenv().url
if not url then
    repeat
        task.wait(10)
    until url
    url = getgenv().url
end

local local_player = game:GetService("Players").LocalPlayer
local data = {
    ["content"] = "👍 " .. local_player.Name,
}

local newdata = game:GetService("HttpService"):JSONEncode(data)
local headers = {
    ["content-type"] = "application/json"
}

request = http_request or request or HttpPost or syn.request
local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
while wait(10) do
    request(abcdef)
end