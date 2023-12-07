local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/AWDX-DYVB/test/main/%E6%B2%B3%E6%B5%81%E6%9C%80%E9%87%8D%E8%A6%81%E7%9A%84%E6%BA%90%E7%A0%81.lua"))()

local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

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