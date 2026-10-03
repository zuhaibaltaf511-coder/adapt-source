local url = "https://raw.githubusercontent.com/zuhaibaltaf511-coder/adapt-source/main/XenV5.lua"
local expectedBytes = 1401401
local source

local ok, body = pcall(function()
    return game:HttpGet(url)
end)
if ok and type(body) == "string" and #body == expectedBytes then
    source = body
else
    local requestFn = (syn and syn.request) or http_request or request
    assert(type(requestFn) == "function", "[XenV5] HttpGet failed or was truncated and no request API is available: " .. tostring(body))
    local response = requestFn({ Url = url, Method = "GET" })
    assert(type(response) == "table", "[XenV5] HTTP request returned no response")
    assert(response.StatusCode == nil or tonumber(response.StatusCode) == 200, "[XenV5] HTTP status: " .. tostring(response.StatusCode))
    assert(type(response.Body) == "string", "[XenV5] HTTP response body is missing")
    source = response.Body
end

assert(#source == expectedBytes, ("[XenV5] Incomplete download: expected %d bytes, got %d"):format(expectedBytes, #source))
assert(type(loadstring) == "function", "[XenV5] Delta does not expose loadstring")
local chunk, compileError = loadstring(source)
assert(type(chunk) == "function", "[XenV5] Compile error: " .. tostring(compileError))
local ran, runtimeError = pcall(chunk)
assert(ran, "[XenV5] Runtime error: " .. tostring(runtimeError))