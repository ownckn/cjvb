game.RunService.Stepped:Connect(function()
    for i, v in pairs(game.Players:GetPlayers()) do
        if not v.Character:FindFirstChild("Highlight") then
            Instance.new("Highlight", v.Character)
            BG = Instance.new("BillboardGui", v.Character)
            TL = Instance.new("TextLabel", BG)
            BG.AlwaysOnTop = true
            BG.Size = UDim2.new(0, 100, 0, 50)
            BG.StudsOffset = Vector3.new(0, 4, 0)
            TL.BackgroundTransparency = 1
            TL.Size = UDim2.new(0, 100, 0, 50)
        end
        v.Character.BillboardGui.TextLabel.Text = v.Name.."\nHealth: "..math.round(v.Character.Humanoid.Health).."\nDistance: "..math.round((v.Character.HumanoidRootPart.CFrame.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position).Magnitude)
        v.Character.BillboardGui.TextLabel.TextColor = v.TeamColor
        v.Character.BillboardGui.Enabled = EP
        v.Character.Highlight.Enabled = EP
    end
end)

game.RunService.Stepped:Connect(function()
    if LT or LK then
        for i, v in pairs(game.Players:GetPlayers()) do
            if string.find(v.Name, User) then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
                if LK then
                    game.ReplicatedStorage.meleeEvent:FireServer(v)
                end
            end
        end
    end
end)

game.RunService.Stepped:Connect(function()
    if Aura or All then
        for i, v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer and v.Character.Humanoid.Health ~= 0 and not v.Character:FindFirstChild("ForceField") then
                if All then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
                end
                game.ReplicatedStorage.meleeEvent:FireServer(v)
            end
        end
    end
end)

game.RunService.Stepped:Connect(function()
    if Aura or All then
        for i, v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer and v.Character.Humanoid.Health ~= 0 and not v.Character:FindFirstChild("ForceField") then
                if All then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
                end
                game.ReplicatedStorage.meleeEvent:FireServer(v)
            end
        end
    end
end)

function Seat()
    Value = All or LT or LK
    game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled("Seated", not Value)
end

game.RunService.Stepped:Connect(function()
    if Type == "FullName" then
        TL.Text = "game."..game.Players.LocalPlayer:GetMouse().Target:GetFullName()
    end
end)

game.RunService.RenderStepped:Connect(function(step)
    if Type == "FPS" then
        TL.Text = math.round(1/step)
    end
end)

local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/AWDX-DYVB/test/main/%E6%B2%B3%E6%B5%81%E6%9C%80%E9%87%8D%E8%A6%81%E7%9A%84%E6%BA%90%E7%A0%81.lua"))()
local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/ownckn/choose/main/%E9%9D%A2%E6%9D%BFUI.lua"))()

local window = DrRayLibrary:Load(identifyexecutor(), "Default")

local tab = DrRayLibrary.newTab("测试服空壳", "rbxassetid://15571104634")

tab.newLabel("这个只是展示-是那款游戏的脚本-没有任何用处")

tab.newLabel("")

tab.newLabel("以下是工作人员使用-普通玩家建议别用")

tab.newLabel("下面还有很多-请往下面滑")

tab.newButton("获取全名", "全名-可以获得你触碰到的物体的全名-在写代码中对于你有帮助-不是工作人员或-者就-是不会用的就不要使用了", function()
     Tool = Instance.new("Tool", game.Players.LocalPlayer.Backpack)
        Tool.RequiresHandle = false
        Tool.Activated:Connect(function()
            setclipboard("game."..game.Players.LocalPlayer:GetMouse().Target:GetFullName())
        end)
end)

tab.newButton("获得当前位置的坐标", "坐标-可以获得当前所在的这个位置的坐标-不是工作人员或-者就-是不会用的就不要使用了", function()
setclipboard("CFrame.new("..tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position)..")")
end)

tab.newButton("查看当前服务器日志", "日志-可以看到使用功能报错或者就是成功之类的东西-不是工作人员或-者就-是不会用的就不要使用了", function()
game.VirtualInputManager:SendKeyEvent(true, "F9", false, game)
end)

tab.newButton("Dex Explorer", "无敌模式-Dex-可以使用这个东西抓取到一些数据-而制作更好的代码-不是工作人员或-者就-是不会用的就不要使用了", function()
OrionLib:MakeNotification({
	        Name = "正在启动(Dex Explorer)",
            Content = "正 在 加 载 Dex - Explorer (启动中耐心等待)",
            Image = "rbxassetid://15571104634",
            Time = 8
        })
      	loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
end)

tab.newButton("Simple Spy", "Spy-可以抓取到更多数据-帮助你写好代码-不是工作人员或-者就-是不会用的就不要使用了", function()
OrionLib:MakeNotification({
	        Name = "正在启动(Simple Spy)",
            Content = "正 在 加 载 Simple - Spy (启动中耐心等待)",
            Image = "rbxassetid://15571104634",
            Time = 8
        })
      	loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RS/main/SimpleSpyMobile"))()
end)

tab.newLabel("")

tab.newDropdown("类型-没弄好-暂时用不了", "类型-我忘了这个是干啥用的-你们自己去研究吧-不是工作人员或-者就-是不会用的就不要使用了-有问题暂时用不了", {"FullName", "FPS"}, function(Value)
    Type = Value
end)

tab.newToggle("可见", "显示类型-我忘了这个是干啥用的-你们自己去研究吧-不是工作人员或-者就-是不会用的就不要使用了-有问题暂时用不了", false, function(Value)
   TL.Visible = Value
end)

local tab1 = DrRayLibrary.newTab("玩家-大厅", "rbxassetid://13169991903")

tab1.newLabel("下面还有很多-请往下面滑")

tab1.newSlider("修改速度", "修改速度-过后-你将变得特别快-有些地图恐怕会有拉回", 500, false, function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
end)

tab1.newSlider("跳跃高度", "修改跳跃力-过后-你将变得跳跃力特别高", 500, false, function(Value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
end)

tab1.newSlider("修改重力", "修改重力-过后-你将变得特别轻可以飘在空中", 500, false, function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
end)

tab1.newButton("飞行-汉化版", "飞行-可以让你在天空中一直遨游飞行-有些地图恐怕会有防检测", function()
    OrionLib:MakeNotification({
	        Name = "正在启动(飞行-汉化版)",
            Content = "正 在 加 载 飞 行 - 汉 化 版 (启动中耐心等待)",
            Image = "rbxassetid://15571104634",
            Time = 8
        })
      	loadstring(game:HttpGet("https://pastebin.com/raw/eUK3tbiM"))()
end)

tab1.newToggle("飞行踏空", "飞行踏空-持续点击跳跃键可以飞起来-长按跳跃键可以一直飞", false, function(Value)
  Jump = Value
        game.UserInputService.JumpRequest:Connect(function()
            if Jump then
                game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
            end
        end)
end)

tab1.newToggle("穿墙", "穿墙-可以穿透任何东西-无视任何障碍-有些地图恐怕会有拉回", false, function(Value)
  Noclip = Value
        Stepped = game.RunService.Stepped:Connect(function()
            if Noclip then
                for a, b in pairs(game.Workspace:GetChildren()) do
                    if b.Name == game.Players.LocalPlayer.Name then
                        for i, v in pairs(game.Workspace[game.Players.LocalPlayer.Name]:GetChildren()) do
                            if v:IsA("BasePart") then
                                v.CanCollide = false
                            end
                        end
                    end
                end
            else
                Stepped:Disconnect()
            end
        end)
end)

tab1.newToggle("显示玩家", "显示玩家-可以看到任何玩家被墙壁挡住的也能看见-可以让你更精确的定位玩家在哪里", false, function(Value)
  EP = Value
end)

tab1.newLabel("锁定杀戮-和-锁定传送")

tab1.newInput("用户名", "输入玩家用户名可以一直锁定那个玩家", function(Value)
    User = Value
end)

tab1.newToggle("锁定传送", "锁定传送-可以让你的人物一直跟随到那个玩家的身边-前提是必须在上面输入玩家的用户名才可以传送", false, function(Value)
  LT = Value
    Seat()
end)

tab1.newToggle("锁定杀戮", "锁定杀戮-可以一直追踪一个人-让他一直死亡-需要先在上面输入玩家用户名才可使用-只适配一小部分地图", false, function(Value)
  LK = Value
    Seat()
end)

tab1.newLabel("循环杀戮-和-光环杀戮")

tab1.newToggle("杀戮光环", "杀戮光环-可以靠近玩家过后迅速让他死亡-只适配一小部分地图", false, function(Value)
  Aura = Value
end)

tab1.newToggle("循环杀戮", "循环杀戮-可以在杀死一个玩家过后继续杀死下一个玩家-只适配一小部分地图", false, function(Value)
  All = Value
    Seat()
end)

tab1.newLabel("最终杀死全部玩家--仅支持一小部分地图")

tab1.newButton("杀死全部人 (新版一直杀)", "杀死全部人-可以在这个房间里面一直攻击全部人-让他们死亡-只支持一小部分地图-开了无法关闭", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/kXjfpFPh"))()
end)

local tab2 = DrRayLibrary.newTab("其他-大厅", "rbxassetid://13242472862")

tab2.newLabel("下面还有很多-请往下面滑")

tab2.newButton("跟随玩家", "这个坏了-还正在修复", function()
end)

tab2.newButton("建筑工具", "建筑工具-可以给你一把锤子和一把魔术棍-锤子可以删除一切-魔法棍可以复制东西", function()
    Hammer = Instance.new("HopperBin")
        Hammer.Name = "Hammer"
        Hammer.BinType = 4
        Hammer.Parent = game.Players.LocalPlayer.Backpack
        Clone = Instance.new("HopperBin")
        Clone.Name = "Clone"
        Clone.BinType = 3
        Clone.Parent = game.Players.LocalPlayer.Backpack
        Grab = Instance.new("HopperBin")
        Grab.Name = "Grab"
        Grab.BinType = 2
end)

tab2.newButton("点击传送", "点击传送-可以在你任意点的一个地方瞬间移动到达那个目的地", function()
    Tool = Instance.new("Tool")
        Tool.Name = "点击传送"
        Tool.RequiresHandle = false
        Tool.Parent = game.Players.LocalPlayer.Backpack
        Tool.Activated:Connect(function()
            Mouse = game.Players.LocalPlayer:GetMouse().Hit+Vector3.new(0, 2.5, 0)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Mouse.X, Mouse.Y, Mouse.Z)
        end)
end)

tab2.newButton("星河-高级版刷物品", "暂时用不了了-这个还在修复中", function()
end)

tab2.newButton("死亡笔记-河流汉化版", "死亡笔记-在笔记上写下-玩家名字可以让那个玩家迅速死亡-只适配一小部分地图", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/AWDX-DYVB/test/main/%E6%AD%BB%E4%BA%A1%E7%AC%94%E8%AE%B0.lua"))()
end)

tab2.newButton("无敌模式 (其他人可以看见)", "无敌模式-可以让你在游戏中免疫任何伤害-只支持一小部分地图-最近这个出了点问题", function()
loadstring(game:HttpGet("https://pastebin.com/raw/LdTVujTA"))()
end)

tab2.newButton("无敌的棒子 (瞬间秒杀)  (有些地图可使用)", "暂时用不了了-这个还在修复中", function()
end)

tab2.newButton("4K光影", "4K光影-可以让你的体验感变得更好-拍照也变得超好看-有一种很温暖的感觉", function()
loadstring(game:HttpGet("https://pastebin.com/raw/SQ2nYcre"))()
end)

tab2.newToggle("修改明亮", "修改明亮-可以让很黑的环境变得特别亮", false, function(Value)
  if Value then
		    game.Lighting.Ambient = Color3.new(1, 1, 1)
		else
		    game.Lighting.Ambient = Color3.new(0, 0, 0)
		end
end)

local tab3 = DrRayLibrary.newTab("音乐-大厅", "rbxassetid://13170405998")

tab3.newLabel("很抱歉-音乐盒子正在开发中-请耐心等待")

tab3.newButton("在你的身边(点击播放音乐)", "音乐还没有开发完成-暂时无法使用-请耐心等待", function()
end)

tab3.newButton("铃芽之旅中文版(点击播放音乐)", "音乐还没有开发完成-暂时无法使用-请耐心等待", function()
end)

tab3.newButton("铃芽之旅日文版(点击播放音乐)", "音乐还没有开发完成-暂时无法使用-请耐心等待", function()
end)

tab3.newButton("无人区玫瑰(点击播放音乐)", "音乐还没有开发完成-暂时无法使用-请耐心等待", function()
end)

local tab4 = DrRayLibrary.newTab("其他-脚本-大厅", "rbxassetid://15571104634")

tab4.newLabel("我只添加了(2)个脚本-可能以后我会添加更多的脚本")

tab4.newButton("纳西达-脚本中心", "纳西妲-脚本中心-我不知道怎么形容-你们自己研究吧", function()
OrionLib:MakeNotification({
	        Name = "正在启动(纳西妲-脚本中心)",
            Content = "正 在 加 载 纳 西 妲 - 脚 本 中 心 (启动中耐心等待)",
            Image = "rbxassetid://15571104634",
            Time = 8
        })
      	loadstring(game:HttpGet("https://pastebin.com/raw/De4aYHDY"))()
end)

tab4.newButton("无名字-透视玩家脚本-没汉化", "透视-可以显示玩家位置-或者透视墙壁或者是添加线条", function()
OrionLib:MakeNotification({
	        Name = "正在启动(无名字-透视玩家脚本)",
            Content = "正 在 加 载 无 名 字 - 透 视 玩 家 脚 (启动中耐心等待)",
            Image = "rbxassetid://15571104634",
            Time = 8
        })
      	loadstring(game:HttpGet("https://pastebin.com/raw/uw2P2fbY"))()
end)

local tab4 = DrRayLibrary.newTab("关于我们", "rbxassetid://15571104634")

tab4.newLabel("下面还有很多-请往下面滑")

tab4.newButton("飞行-汉化版", "飞行-可以让你在天空中一直遨游飞行-有些地图恐怕会有防检测", function()
    OrionLib:MakeNotification({
	        Name = "正在启动(飞行-汉化版)",
            Content = "正 在 加 载 飞 行 - 汉 化 版 (启动中耐心等待)",
            Image = "rbxassetid://15571104634",
            Time = 8
        })
      	loadstring(game:HttpGet("https://pastebin.com/raw/eUK3tbiM"))()
end)

tab4.newInput("移动速度", "修改速度-过后-你将变得特别快-有些地图恐怕会有拉回", function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
end)

tab4.newInput("跳跃高度", "修改跳跃力-过后-你将变得跳跃力特别高", function(Value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
end)

tab4.newInput("修改重力", "修改重力-过后-你将变得特别轻可以飘在空中", function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
end)

tab4.newButton("作者的留言", "欢 迎 你 使 用 河 流 roblox 你 对 他 的 支 持 就 是 我 们 的 动 力", function()
end)

tab4.newButton("河流QQ官方群", "587185906", function()
end)

tab4.newButton("河流QQ官方群(点击复制)", "点击即可复制河流QQ群号", function()
OrionLib:MakeNotification({
	        Name = "通知复制成功",
            Content = "可以在QQ里面的搜索搜索群号",
            Image = "rbxassetid://15571104634",
            Time = 8
        })
    setclipboard("587185906")
end)

tab4.newButton("河流工具箱-脚本", "工作人员专用", function()
OrionLib:MakeNotification({
	        Name = "正在启动(河流工具箱)",
            Content = "正 在 加 载 河 流 工 具 箱 (启动中耐心等待)",
            Image = "rbxassetid://15571104634",
            Time = 8
        })
      	loadstring(game:HttpGet("https://pastebin.com/raw/2frP15Mh"))()
end)