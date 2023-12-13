local GUI = loadstring(game:HttpGet("https://github.com/ownckn/choose/raw/main/%E9%80%89%E6%8B%A9UI.lua"))()
local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/f2vR5dJd"))()

local UI = GUI:CreateWindow("河流工作室(河脚本)(测试服选择)","测试版")

local jvjvjv = UI:addPage("河流-显示公告",1,false,6)

jvjvjv:addButton("河流工作室-返回-(河流密钥系统)",function()
    loadstring(game:HttpGet(string.char(104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,65,87,68,88,45,68,89,86,66,47,116,101,115,116,47,109,97,105,110,47,37,69,54,37,66,50,37,66,51,37,69,54,37,66,53,37,56,49,45,37,69,53,37,65,70,37,56,54,37,69,57,37,57,50,37,65,53,45,37,69,55,37,57,57,37,66,68,37,69,53,37,57,48,37,56,68,37,69,53,37,56,68,37,57,53,45,37,69,54,37,66,65,37,57,48,37,69,55,37,65,48,37,56,49,46,108,117,97)))()
end)

jvjvjv:addLabel(identifyexecutor(),game.Players.LocalPlayer.Character.Name)
jvjvjv:addLabel("河流工作室开发-测试服","")
jvjvjv:addLabel("在这里我们会提前上传新功能测试","")
jvjvjv:addLabel("更新的时候我们会在群里面通知-到时候你们可以去查看","")

jvjvjv:addButton("河流QQ官方群(点击复制)",function()
    OrionLib:MakeNotification({
	        Name = "通知复制成功",
            Content = "可以在QQ里面的搜索搜索群号",
            Image = "rbxassetid://15571104634",
            Time = 8
        })
    setclipboard("587185906")
end)

local bkni = UI:addPage("测试版-刀羽球",2,false,6)
bkni:addLabel(identifyexecutor(),game.Players.LocalPlayer.Character.Name)
bkni:addLabel("还没有-测试服-刀羽球-新功能","还没有上架测试服的-刀羽球")

bkni:addButton("点击进入测试服-刀羽球",function()
    OrionLib:MakeNotification({
	        Name = "抱歉-还没有上架",
            Content = "测试服的-刀羽球-还没有上架-可以去玩儿正式服",
            Image = "rbxassetid://15571104634",
            Time = 8
        })
end)

bkni:addLabel("刀羽球-测试服还没有更新-暂时没上架","")


local Home = UI:addPage("测试版-BOORS",2,false,6)
Home:addLabel(identifyexecutor(),game.Players.LocalPlayer.Character.Name)
Home:addLabel("还没有-测试服-DOORS-新功能","还没有上架测试服的-DOORS")

Home:addButton("点击进入测试服-BOORS",function()
    OrionLib:MakeNotification({
	        Name = "抱歉-还没有上架",
            Content = "测试服的-DOORS-还没有上架-可以去玩儿正式服",
            Image = "rbxassetid://15571104634",
            Time = 8
        })
end)

Home:addLabel("DOORS-测试服还没有更新-暂时没上架","")

local bkni = UI:addPage("测试版-监狱人生",2,false,6)
bkni:addLabel(identifyexecutor(),game.Players.LocalPlayer.Character.Name)
bkni:addLabel("还没有-测试服-监狱人生-新功能","还没有上架测试服的-监狱人生")

bkni:addButton("点击进入测试服-监狱人生",function()
    OrionLib:MakeNotification({
	        Name = "抱歉-还没有上架",
            Content = "测试服的-监狱人生-还没有上架-可以去玩儿正式服",
            Image = "rbxassetid://15571104634",
            Time = 8
        })
end)

Home:addLabel("监狱人生-测试服还没有更新-暂时没上架","")

local hjbi = UI:addPage("测试版-伐木大亨2",2,false,6)
hjbi:addLabel(identifyexecutor(),game.Players.LocalPlayer.Character.Name)
hjbi:addLabel("还没有-测试服-伐木大亨2-新功能","还没有上架测试服的-伐木大亨2")

hjbi:addButton("点击进入测试服-伐木大亨2",function()
    OrionLib:MakeNotification({
	        Name = "抱歉-还没有上架",
            Content = "测试服的-伐木大亨2-还没有上架-可以去玩儿正式服",
            Image = "rbxassetid://15571104634",
            Time = 8
        })
end)

Home:addLabel("伐木大亨2-测试服还没有更新-暂时没上架","")

local hivjv = UI:addPage("测试版-火箭发射模拟器",2,false,6)
hivjv:addLabel(identifyexecutor(),game.Players.LocalPlayer.Character.Name)
hivjv:addLabel("已有-测试服-火箭发射模拟器-新功能","上架了-新功能可以点击进入游玩")

hivjv:addButton("点击进入测试服-火箭发射模拟器",function()
    OrionLib:MakeNotification({
	        Name = "正在启动(测试版)(火箭发射模拟器)",
            Content = "正在启动中-正在加载-请耐心等待",
            Image = "rbxassetid://15571104634",
            Time = 8
        })
end)

hivjv:addLabel("未上架正式服-可以玩","")

