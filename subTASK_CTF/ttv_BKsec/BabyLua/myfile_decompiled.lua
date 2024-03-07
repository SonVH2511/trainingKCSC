local flag = {}

function flag.check(inp, key)
  local result = 0
  local arr = {22,101, 133, 137, 79, 75, 166, 157, 189, 57, 172, 155, 144, 91, 137, 222,
              52, 144, 211, 101, 114, 116, 121, 76, 154, 168, 83, 94}
  local encoded = {}
  for i = 1, #inp do
    local byte = inp:byte(i) ~ key:byte((i - 1) % #key + 1)
    if 1 < i then
      byte = byte + inp:byte(i - 1)
    end
    encoded[i] = byte
  end
  for i = 1, math.min(#encoded, #arr) do
    if encoded[i] == arr[i] then
      result = result + 1
    end
  end
  return result == 28 and #encoded == #arr
end

return flag
