# 使用方式

把exe文件放到你的proto文件所在目录,双击执行,会生成两个文件：
```
    # EmmyLua 插件代码提示用，通常只用放到，EmmyLua所打开的文件夹即可
    ProtoIntelliSense.lua 
    # Proto文件中的所有枚举定义
    ProtoEnum.lua
```

# How to use
Place the exe file to your *.proto source folder, the double click run it, will got 2 lua file:
```lua
    ProtoIntelliSense.lua --For EmmyLua IntelliSense
    
    ProtoEnum.lua --# Proto's Enum define, 
    -- you can use it: 
    local ProtoEnum = require "ProtoEnum"
```

# Remake
proto nest message and enum will lose namespace
生成的文件会丢失嵌套的message和enum的命名空间

# Example
```proto
syntax = "proto3";

message Item
{
    int32 id = 1;//道具ID
    int32 count = 2;//道具数量
}

message Player
{
    enum State {
        Ok=0;
        Dead=1;
        Home=2;
    }

    message One
    {
        int64 id = 1;//some id
        string hello = 2;//hello

        enum State2 {
            Ok=0;
            Dead=1;
            Home=2;
        }
    }

    int64 uid = 1;//玩家唯一id
    string name = 2;//玩家名字
    float luckyrate = 3;//玩家幸运值
    bool ok = 4;
    repeated Item items = 5;//玩家道具列表
    map<int32, int32> values = 6;
}

enum Enum1 {
    A=0;
    B=1;
    C=2;
}

```

ProtoIntelliSense.lua
```lua
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
```

ProtoEnum.lua
```lua
---@class State
local State = {
    Ok = 0,
    Dead = 1,
    Home = 2,
}

---@class State2
local State2 = {
    Ok = 0,
    Dead = 1,
    Home = 2,
}

---@class Enum1
local Enum1 = {
    A = 0,
    B = 1,
    C = 2,
}



return {
    State=State,
    State2=State2,
    Enum1=Enum1,
}
```