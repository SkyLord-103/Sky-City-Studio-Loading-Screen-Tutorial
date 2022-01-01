--------------------------------------------------------------------------
--||  Loading everything in the game
--------------------------------------------------------------------------

--/ All of the variables for the gui objects
local loadingGUI = script.LoadingGui
local gui = loadingGUI.Frame
local loadingBarFrame = gui.LoadingBar
local loadingBar = loadingBarFrame.Bar
local loadingText = gui.LoadingText

loadingGUI.Parent = script.Parent --/ Setting the gui's Parent to the player's PlayerGui
game.ReplicatedFirst:RemoveDefaultLoadingScreen() --/ Removing roblox's default loading screen
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false) --/ Making the core gui's like leaderboard, topbar, etc. invisible 

local gameObjects = game:GetDescendants() --/ Getting every descendant of game
local totalObjects = #gameObjects:GetDescendants() --/ Getting how many descendants there are in game

for index, descendant in pairs(gameObjects:GetDescendants()) do	--/ loop through the descendants
	loadingBar.Size = UDim2.new(index/totalObjects, 0, 1, 0) --/ Setting the loadingBar's size to a percent of how much is loaded
	loadingText.Text = "Loading... "..string.format("%0.2f", (index/totalObjects) * 100).."%" --/ Setting/Formating the loadingText's text to something like this "Loading... 43.83%" 
	game:GetService("ContentProvider"):PreloadAsync({descendant}) --/ Loading said descendant
end

game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true) --/ Setting the coregui's back to visible

--/ Using the Debris service to wait 0.6s after the loading is done, to destroy the gui and script
game.Debris:AddItem(loadingGUI, 0.6)
game.Debris:AddItem(script, 0.6)


--------------------------------------------------------------------------
--|| Specific loading
--------------------------------------------------------------------------

--/ All of the variables for the gui objects
local loadingGUI = script.LoadingGui
local gui = loadingGUI.Frame
local loadingBarFrame = gui.LoadingBar
local loadingBar = loadingBarFrame.Bar
local loadingText = gui.LoadingText

loadingGUI.Parent = script.Parent --/ Setting the gui's Parent to the player's PlayerGui
game.ReplicatedFirst:RemoveDefaultLoadingScreen() --/ Removing roblox's default loading screen
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false) --/ Making the core gui's like leaderboard, topbar, etc. invisible  

local gameObjects = {game:GetService("ReplicatedStorage"), game:GetService("Workspace")}

for _, obj in pairs(gameObjects) do
	local totalObjects = #obj:GetDescendants() --/ Getting how many descendants there are in the obj
	for index, descendant in pairs(obj:GetDescendants()) do		--/ loop through the descendants
		loadingBar.Size = UDim2.new(index/totalObjects, 0, 1, 0) --/ Setting the loadingBar's size to a percent of how much is loaded
		loadingText.Text = "Loading... "..string.format("%0.2f", (index/totalObjects) * 100).."%" --/ Setting/Formating the loadingText's text to something like this "Loading... 43.83%" 
		game:GetService("ContentProvider"):PreloadAsync({descendant}) --/ Loading said descendant
	end
end

game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true) --/ Setting the coregui's back to visible

--/ Using the Debris service to wait 0.6s after the loading is done, to destroy the gui and script
game.Debris:AddItem(loadingGUI, 0.6)
game.Debris:AddItem(script, 0.6)
