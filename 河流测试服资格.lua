local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/AWDX-DYVB/test/main/%E6%B2%B3%E6%B5%81%E6%9C%80%E9%87%8D%E8%A6%81%E7%9A%84%E6%BA%90%E7%A0%81.lua"))()

function AddKey(Settings)
	local TweenService = game.TweenService
	local RayfieldFolder = "Rayfield"
	local ConfigurationExtension = ".rfld"
	local Passthrough = false

	if Settings.KeySystem then
		if not Settings.KeySettings then
			Passthrough = true
			return
		end

		if not isfolder(RayfieldFolder.."/Key System") then
			makefolder(RayfieldFolder.."/Key System")
		end

		if typeof(Settings.KeySettings.Key) == "string" then Settings.KeySettings.Key = {Settings.KeySettings.Key} end

		if Settings.KeySettings.GrabKeyFromSite then
			for i, Key in ipairs(Settings.KeySettings.Key) do
				local Success, Response = pcall(function()
					Settings.KeySettings.Key[i] = tostring(game:HttpGet(Key):gsub("[\n\r]", " "))
					Settings.KeySettings.Key[i] = string.gsub(Settings.KeySettings.Key[i], " ", "")
				end)
				if not Success then
					print("Rayfield | "..Key.." Error " ..tostring(Response))
				end
			end
		end

		if not Settings.KeySettings.FileName then
			Settings.KeySettings.FileName = "No file name specified"
		end

		if isfile(RayfieldFolder.."/Key System".."/"..Settings.KeySettings.FileName..ConfigurationExtension) then
			for _, MKey in ipairs(Settings.KeySettings.Key) do
				if string.find(readfile(RayfieldFolder.."/Key System".."/"..Settings.KeySettings.FileName..ConfigurationExtension), MKey) then
					Passthrough = true
				end
			end
		end

		if not Passthrough then
			local AttemptsRemaining = 3
			local KeyUI = game:GetObjects("rbxassetid://11380036235")[1]
			local PlayerKey = Settings.KeySettings.Key[game.Players.LocalPlayer.Name]

			if gethui then
				KeyUI.Parent = gethui()
			elseif syn.protect_gui then
				syn.protect_gui(Rayfield)
				KeyUI.Parent = CoreGui
			else
				KeyUI.Parent = CoreGui
			end

			if gethui then
				for _, Interface in ipairs(gethui():GetChildren()) do
					if Interface.Name == KeyUI.Name and Interface ~= KeyUI then
						Interface.Enabled = false
						Interface.Name = "KeyUI-Old"
					end
				end
			else
				for _, Interface in ipairs(CoreGui:GetChildren()) do
					if Interface.Name == KeyUI.Name and Interface ~= KeyUI then
						Interface.Enabled = false
						Interface.Name = "KeyUI-Old"
					end
				end
			end

			local KeyMain = KeyUI.Main
			KeyMain.KeyNote.Text = "请在下方输入密钥"
			KeyMain.NoteTitle.Text = "测试服资格内容"
			KeyMain.Input.InputBox.PlaceholderText = "请输入密钥"
			KeyMain.Title.Text = Settings.KeySettings.Title or Settings.Name
			KeyMain.Subtitle.Text = Settings.KeySettings.Subtitle or "Key System"
			KeyMain.NoteMessage.Text = Settings.KeySettings.Note or "No instructions"

			KeyMain.Size = UDim2.new(0, 467, 0, 175)
			KeyMain.BackgroundTransparency = 1
			KeyMain.Shadow.Image.ImageTransparency = 1
			KeyMain.Title.TextTransparency = 1
			KeyMain.Subtitle.TextTransparency = 1
			KeyMain.KeyNote.TextTransparency = 1
			KeyMain.Input.BackgroundTransparency = 1
			KeyMain.Input.UIStroke.Transparency = 1
			KeyMain.Input.InputBox.TextTransparency = 1
			KeyMain.NoteTitle.TextTransparency = 1
			KeyMain.NoteMessage.TextTransparency = 1
			KeyMain.Hide.ImageTransparency = 1

			TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 500, 0, 187)}):Play()
			TweenService:Create(KeyMain.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 0.5}):Play()
			wait(0.05)
			TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			wait(0.05)
			TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			wait(0.05)
			TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			wait(0.15)
			TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 0.3}):Play()


			KeyUI.Main.Input.InputBox.FocusLost:Connect(function()
				if #KeyUI.Main.Input.InputBox.Text == 0 then
				    OrionLib:MakeNotification({
				        Name = "你没有输入测试资格密钥-不能留空",
			    	    Content = "请再次输入尝试吧",
		    		    Image = "rbxassetid://15571104634",
	    			    Time = 8
				    })
				    return
				end
				if not PlayerKey then
				    OrionLib:MakeNotification({
				        Name = "很抱歉-你没有测试这个",
			    	    Content = "需要测试资格的-去找作者购买\n也可以等到不定时发放测试资格\nQQ群号:765769086",
		    		    Image = "rbxassetid://15571104634",
	    			    Time = 8
				    })
				    return
				end
				local KeyFound = false
				local FoundKey = ''
				if string.find(KeyMain.Input.InputBox.Text, PlayerKey) then
					KeyFound = true
					FoundKey = MKey
				end
				if KeyFound then 
					TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
					TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 467, 0, 175)}):Play()
					TweenService:Create(KeyMain.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
					TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
					TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
					OrionLib:MakeNotification({
				        Name = "你已添加了测试资格用户",
			    	    Content = "测试资格验证成功-正在启动脚本中-请耐心等待",
		    		    Image = "rbxassetid://15571104634",
	    			    Time = 8
				    })
					wait(0.51)
					Passthrough = true
					if Settings.KeySettings.SaveKey then
						if writefile then
							writefile(RayfieldFolder.."/Key System".."/"..Settings.KeySettings.FileName..ConfigurationExtension, FoundKey)
						end
					end
				else
					if AttemptsRemaining == 0 then
						TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
						TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 467, 0, 175)}):Play()
						TweenService:Create(KeyMain.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
						TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
						TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
						TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
						OrionLib:MakeNotification({
				            Name = "资格密钥输入机会已用完",
			        	    Content = "退出游戏-重新进入即可-刷新机会-10秒后踢出游戏",
		    		        Image = "rbxassetid://15571104634",
	    			        Time = 8
				        })
						wait(10)
						game.Players.LocalPlayer:Kick("检测到你有测试资格-你的测试资格密钥输入错误-可以去找作者-找回你的资格密钥-作者QQ:3082094144")
					end
					KeyMain.Input.InputBox.Text = ""
					AttemptsRemaining = AttemptsRemaining - 1
					TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 467, 0, 175)}):Play()
					TweenService:Create(KeyMain, TweenInfo.new(0.4, Enum.EasingStyle.Elastic), {Position = UDim2.new(0.495,0,0.5,0)}):Play()
					wait(0.1)
					TweenService:Create(KeyMain, TweenInfo.new(0.4, Enum.EasingStyle.Elastic), {Position = UDim2.new(0.505,0,0.5,0)}):Play()
					wait(0.1)
					TweenService:Create(KeyMain, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Position = UDim2.new(0.5,0,0.5,0)}):Play()
					TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 500, 0, 187)}):Play()
					OrionLib:MakeNotification({
				        Name = "你已添加了测试资格用户",
			    	    Content = "资格密钥-输入错误-请重新尝试\n输入次数-还有"..AttemptsRemaining.."机会",
		    		    Image = "rbxassetid://15571104634",
	    			    Time = 8
				    })
				end
			end)

			KeyMain.Hide.MouseButton1Click:Connect(function()
				TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
				TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 467, 0, 175)}):Play()
				TweenService:Create(KeyMain.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
				TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
				TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
				TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
				wait(0.51)
				KeyUI:Destroy()
			end)
		else
			Passthrough = true
		end
	end
	if Settings.KeySystem then
		repeat wait() until Passthrough
	end
end

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
LBL.Position = UDim2.new(0.15,0,0.010,0)
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

OrionLib:MakeNotification({
  Name = "正在启动河流测试服",
  Content = "脚本启动成功正在加载中-请耐心等待(正在启动)",
  Image = "rbxassetid://15571104634",
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

AddKey({
	KeySystem = true,
	KeySettings = {
		Title = "河流请输入-测试服-资格密钥",
		Subtitle = "购买资格的人可以现在使用-被选中资格的人要等到25号",
		Note = "测试服已上线了-只对购买的人开放",
		FileName = "key",
		SaveKey = false,
		GrabKeyFromSite = false,
		Key = {
		    ["nahida_cn"] = "lolbro",
		    ["bgyLenfkrb"] = "1592",
		}
	}
})

loadstring(game:HttpGet("https://github.com/ownckn/cjvb/raw/main/%E6%8A%B1%E6%AD%89"))()
