Guis = {}
ParentGui = function(Gui, Parent)
    Gui.Name = HttpService:GenerateGUID(false):gsub('-', ''):sub(1, math.random(25, 30))

    if ((not is_sirhurt_closure) and (syn and syn.protect_gui)) then
        syn.protect_gui(Gui);
        Gui.Parent = Parent or CoreGui
    elseif (CoreGui:FindFirstChild("RobloxGui")) then
        Gui.Parent = Parent or CoreGui.RobloxGui
    else
        Gui.Parent = Parent or CoreGui
    end
    Guis[#Guis + 1] = Gui
    return Gui
end
UI = game:GetObjects("rbxassetid://6167929302")[1]:Clone()

local CommandBarPrefix = isfolder and (GetConfig().CommandBarPrefix and Enum.KeyCode[GetConfig().CommandBarPrefix] or Enum.KeyCode.Semicolon) or Enum.KeyCode.Semicolon

local CommandBar = UI.CommandBar
local Commands = UI.Commands
local ChatLogs = UI.ChatLogs
local GlobalChatLogs = UI.ChatLogs:Clone()
local HttpLogs = UI.ChatLogs:Clone();
local Notification = UI.Notification
local Command = UI.Command
local ChatLogMessage = UI.Message
local GlobalChatLogMessage = UI.Message:Clone()
local NotificationBar = UI.NotificationBar
local Stats = UI.Notification:Clone();
local StatsBar = UI.NotificationBar:Clone();

local RobloxChat = PlayerGui:FindFirstChild("Chat")
if (RobloxChat) then
    local RobloxChatFrame = RobloxChat:WaitForChild("Frame", .1)
    if RobloxChatFrame then
        RobloxChatChannelParentFrame = RobloxChatFrame:WaitForChild("ChatChannelParentFrame", .1)
        RobloxChatBarFrame = RobloxChatFrame:WaitForChild("ChatBarParentFrame", .1)
        if RobloxChatChannelParentFrame then
            RobloxFrameMessageLogDisplay = RobloxChatChannelParentFrame:WaitForChild("Frame_MessageLogDisplay", .1)
            if RobloxFrameMessageLogDisplay then
                RobloxScroller = RobloxFrameMessageLogDisplay:WaitForChild("Scroller", .1)
            end
        end
    end
end

local CommandBarOpen = false
local CommandBarTransparencyClone = CommandBar:Clone()
local ChatLogsTransparencyClone = ChatLogs:Clone()
local GlobalChatLogsTransparencyClone = GlobalChatLogs:Clone()
local HttpLogsTransparencyClone = HttpLogs:Clone()
local CommandsTransparencyClone
local PredictionText = ""

local UIParent = CommandBar.Parent
GlobalChatLogs.Parent = UIParent
GlobalChatLogMessage.Parent = UIParent
GlobalChatLogs.Name = "GlobalChatLogs"
GlobalChatLogMessage.Name = "GlobalChatLogMessage"

HttpLogs.Parent = UIParent
HttpLogs.Name = "HttpLogs"
HttpLogs.Size = UDim2.new(0, 421, 0, 260);
HttpLogs.Search.PlaceholderText = "Search"

local Frame2
if (RobloxChatBarFrame) then
    local Frame1 = RobloxChatBarFrame:WaitForChild('Frame', .1)
    if Frame1 then
        local BoxFrame = Frame1:WaitForChild('BoxFrame', .1)
        if BoxFrame then
            Frame2 = BoxFrame:WaitForChild('Frame', .1)
            if Frame2 then
                local TextLabel = Frame2:WaitForChild('TextLabel', .1)
                ChatBar = Frame2:WaitForChild('ChatBar', .1)
                if TextLabel and ChatBar then
                    PredictionClone = TextLabel:Clone();
                    PredictionClone.Text = ""
                    PredictionClone.TextTransparency = 0.3
                    PredictionClone.Name = "Predict"
                end
            end
        end
    end
end

-- position CommandBar
CommandBar.Position = UDim2.new(0.5, -100, 1, 5)