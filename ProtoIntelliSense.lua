---@class Item
---@field public id integer @道具ID
---@field public count integer @道具数量
local Item = {}
print(Item)

---@class One
---@field public id integer @some id
---@field public hello string @hello
local One = {}
print(One)

---@class Player
---@field public uid integer @玩家唯一id
---@field public name string @玩家名字
---@field public luckyrate number @玩家幸运值
---@field public ok boolean
---@field public items Item[] @玩家道具列表
---@field public values table<integer, integer>
local Player = {}
print(Player)

