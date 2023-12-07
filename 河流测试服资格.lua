local LBLG = Instance.new("ScreenGui", getParent)
local LBL = Instance.new("TextLabel", getParent)

LBLG.Name = "LBLG"
LBLG.Parent = game.CoreGui
LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LBLG.Enabled = true
LBL.Name = "LBL"
LBL.Parent = LBLG
LBL.BackgroundColor3 = Color3.new(1, 1, 1)
LBL.BackgroundTransparency = 1
LBL.BorderColor3 = Color3.new(0, 0, 0)
LBL.Position = UDim2.new(0.75,0,0.010,0)
LBL.Size = UDim2.new(0, 133, 0, 30)
LBL.Font = Enum.Font.GothamSemibold
LBL.Text = "TextLabel"
LBL.TextColor3 = Color3.new(1, 1, 1)
LBL.TextScaled = true
LBL.TextSize = 14
LBL.TextWrapped = true
LBL.Visible = true

local FpsLabel = LBL
local Heartbeat = game:GetService("RunService").Heartbeat
local LastIteration, Start
local FrameUpdateTable = { }

local function HeartbeatUpdate()
	LastIteration = tick()
	for Index = #FrameUpdateTable, 1, -1 do
		FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
	end
	FrameUpdateTable[1] = LastIteration
	local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
	CurrentFPS = CurrentFPS - CurrentFPS % 1
	FpsLabel.Text = ("北京时间:"..os.date("%H").."时"..os.date("%M").."分")
end
Start = tick()
Heartbeat:Connect(HeartbeatUpdate)

local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/AWDX-DYVB/test/main/%E6%B2%B3%E6%B5%81%E6%9C%80%E9%87%8D%E8%A6%81%E7%9A%84%E6%BA%90%E7%A0%81.lua"))()

local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

OrionLib:MakeNotification({
  Name = "正在启动河流测试服",
  Content = "脚本启动成功正在加载中-请耐心等待(正在启动)",
  Image = "rbxassetid://15361603644",
  Time = 6
})
wait(3)

local TweenService = game.TweenService
local LoadFrame = Instance.new("Frame")
local Barload = Instance.new("Frame")
local BarloadCorner = Instance.new("UICorner")
local LoadText = Instance.new("TextLabel")
local LoadTitle = Instance.new("TextLabel")

LoadFrame.Name = "LoadFrame"
LoadFrame.Parent = Instance.new("ScreenGui", game.CoreGui)
LoadFrame.AnchorPoint = Vector2.new(0.5, 0.5)
LoadFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
LoadFrame.BorderSizePixel = 0
LoadFrame.ClipsDescendants = true
LoadFrame.Position = UDim2.new(0.499739647, 0, 0.499451756, 0)
LoadFrame.Size = UDim2.new(0, 0, 0, 0)

Barload.Name = "Barload"
Barload.Parent = LoadFrame
Barload.BackgroundColor3 = Color3.fromRGB(44, 120, 224)
Barload.Position = UDim2.new(0.0436137058, 0, 0.776658118, 0)
Barload.Size = UDim2.new(0, 0, 0, 2)
Barload.BackgroundTransparency = 1

BarloadCorner.Name = "BarloadCorner"
BarloadCorner.Parent = Barload

LoadText.Name = "LoadText"
LoadText.Parent = LoadFrame
LoadText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoadText.BackgroundTransparency = 1.000
LoadText.Position = UDim2.new(0.186915889, 0, 0.261682242, 0)
LoadText.Size = UDim2.new(0, 200, 0, 50)
LoadText.Font = Enum.Font.Gotham
LoadText.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadText.TextSize = 18.000
LoadText.TextTransparency = 1
LoadText.Text = "正在检测加载..."

LoadTitle.Name = "LoadTitle"
LoadTitle.Parent = LoadFrame
LoadTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoadTitle.BackgroundTransparency = 1.000
LoadTitle.Position = UDim2.new(0.0432743616, 0, 0.1125011, 0)
LoadTitle.Size = UDim2.new(0, 200, 0, 23)
LoadTitle.Font = Enum.Font.GothamSemibold
LoadTitle.Text = "河流工作室(河流测试服)"
LoadTitle.TextColor3 = Color3.fromRGB(68, 68, 68)
LoadTitle.TextSize = 12.000
LoadTitle.TextXAlignment = Enum.TextXAlignment.Left
LoadTitle.TextTransparency = 1

LoadFrame:TweenSize(UDim2.new(0, 321,0, 107), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)

wait(.6)

TweenService:Create(
Barload,
TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{BackgroundTransparency = 0}
):Play()
TweenService:Create(
LoadText,
TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{TextTransparency = 0}
):Play()
TweenService:Create(
LoadTitle,
TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{TextTransparency = 0}
):Play()

wait(.6)

Barload:TweenSize(UDim2.new(0, 50,0, 2), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
LoadText.Text = game.Players.LocalPlayer.Character.Name

wait(1)

Barload:TweenSize(UDim2.new(0, 100,0, 2), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
LoadText.Text = "正在读取信息"

wait(.6)

Barload:TweenSize(UDim2.new(0, 150,0, 2), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
LoadText.Text = identifyexecutor()

wait(.6)

Barload:TweenSize(UDim2.new(0, 200,0, 2), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
LoadText.Text = "信息验证通过"

wait(.6)

Barload:TweenSize(UDim2.new(0, 292,0, 2), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
LoadText.Text = "加载完成"

wait(3)


TweenService:Create(
Barload,
TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{BackgroundTransparency = 1}
):Play()
TweenService:Create(
LoadText,
TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{TextTransparency = 1}
):Play()
TweenService:Create(
LoadTitle,
TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{TextTransparency = 1}
):Play()

wait(.6)

LoadFrame:TweenSize(UDim2.new(0, 0,0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)

local Window = Rayfield:CreateWindow({
	Name = "🌟🌟🌟",
	LoadingTitle = "🌟🌟🌟",
	LoadingSubtitle = "🌟🌟🌟",
	KeySystem = true, -- Set this to true to use our key system
	KeySettings = {
		Title = "河流请输入测试服资格密钥",
		Subtitle = "还没制作完成测试中",
		Note = "测试服提前上传-这边还在制作中--将在12月25号上线--新版本可以提前使用到新功能--就这样吧-请大家耐心等待上线",
		FileName = "key",
		SaveKey = false,
		GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		Key = "DXQ"
	}
})
