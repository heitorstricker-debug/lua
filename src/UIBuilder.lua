local UIBuilder = {}

local function createButton(parent, text, position, accentColor)
  local button = Instance.new("TextButton")
  button.Size = UDim2.fromOffset(200, 46)
  button.Position = position
  button.BackgroundColor3 = accentColor or Color3.fromRGB(38, 38, 48)
  button.BorderSizePixel = 0
  button.Text = text
  button.TextColor3 = Color3.fromRGB(255, 255, 255)
  button.TextScaled = true
  button.Font = Enum.Font.GothamBold
  button.Parent = parent

  local corner = Instance.new("UICorner")
  corner.CornerRadius = UDim.new(0, 10)
  corner.Parent = button

  return button
end

local function createDivider(parent, position)
  local divider = Instance.new("Frame")
  divider.Size = UDim2.new(1, -32, 0, 2)
  divider.Position = position
  divider.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
  divider.BorderSizePixel = 0
  divider.Parent = parent
  return divider
end

function UIBuilder.build()
  local starterGui = game:GetService("StarterGui")
  local screenGui = Instance.new("ScreenGui")
  screenGui.Name = "DressToImpressUI"
  screenGui.ResetOnSpawn = false
  screenGui.Parent = starterGui

  local frame = Instance.new("Frame")
  frame.Name = "MainPanel"
  frame.Size = UDim2.fromOffset(360, 280)
  frame.Position = UDim2.new(0, 24, 0.5, -140)
  frame.BackgroundColor3 = Color3.fromRGB(24, 24, 34)
  frame.BorderSizePixel = 0
  frame.Parent = screenGui

  local corner = Instance.new("UICorner")
  corner.CornerRadius = UDim.new(0, 16)
  corner.Parent = frame

  local title = Instance.new("TextLabel")
  title.Size = UDim2.new(1, -32, 0, 52)
  title.Position = UDim2.new(0, 16, 0, 12)
  title.BackgroundTransparency = 1
  title.Text = "Dress to Impress"
  title.TextScaled = true
  title.Font = Enum.Font.GothamBlack
  title.TextColor3 = Color3.fromRGB(255, 255, 255)
  title.Parent = frame

  local highlight = Instance.new("Frame")
  highlight.Size = UDim2.new(1, -32, 0, 6)
  highlight.Position = UDim2.new(0, 16, 0, 64)
  highlight.BackgroundColor3 = Color3.fromRGB(255, 188, 135)
  highlight.BorderSizePixel = 0
  highlight.Parent = frame

  local subtitle = Instance.new("TextLabel")
  subtitle.Size = UDim2.new(1, -32, 0, 40)
  subtitle.Position = UDim2.new(0, 16, 0, 74)
  subtitle.BackgroundTransparency = 1
  subtitle.Text = "Selecione seu look para o desfile"
  subtitle.TextScaled = true
  subtitle.Font = Enum.Font.GothamMedium
  subtitle.TextColor3 = Color3.fromRGB(174, 174, 200)
  subtitle.Parent = frame

  createDivider(frame, UDim2.new(0, 16, 0, 120))

  local lookButton = createButton(frame, "Trocar Look", UDim2.new(0, 16, 0, 136), Color3.fromRGB(90, 110, 190))
  local runwayButton = createButton(
    frame,
    "Entrar na Passarela",
    UDim2.new(0, 16, 0, 192),
    Color3.fromRGB(200, 120, 185)
  )
  local rulesButton = createButton(frame, "Ver Regras", UDim2.new(0, 16, 0, 248), Color3.fromRGB(80, 160, 140))

  lookButton.Name = "SwapOutfitButton"
  runwayButton.Name = "JoinRunwayButton"
  rulesButton.Name = "RulesButton"

  local hint = Instance.new("TextLabel")
  hint.Size = UDim2.new(1, -32, 0, 30)
  hint.Position = UDim2.new(0, 16, 1, -40)
  hint.BackgroundTransparency = 1
  hint.Text = "Dica: explore os estandes e o lounge VIP!"
  hint.TextScaled = true
  hint.Font = Enum.Font.GothamMedium
  hint.TextColor3 = Color3.fromRGB(140, 140, 170)
  hint.Parent = frame

  return screenGui
end

return UIBuilder
