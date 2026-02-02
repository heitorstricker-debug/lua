local MapBuilder = {}

local OUTFITS = {
  { name = "Glam Night", primary = Color3.fromRGB(186, 68, 255), accent = Color3.fromRGB(255, 215, 0) },
  { name = "Street Pop", primary = Color3.fromRGB(72, 158, 255), accent = Color3.fromRGB(255, 111, 60) },
  { name = "Vintage Chic", primary = Color3.fromRGB(179, 126, 94), accent = Color3.fromRGB(240, 220, 180) },
  { name = "Neon Party", primary = Color3.fromRGB(255, 77, 255), accent = Color3.fromRGB(0, 255, 210) },
  { name = "Festival Glow", primary = Color3.fromRGB(255, 176, 59), accent = Color3.fromRGB(255, 255, 255) },
  { name = "Royal Runway", primary = Color3.fromRGB(70, 88, 255), accent = Color3.fromRGB(255, 219, 99) },
  { name = "Soft Pastel", primary = Color3.fromRGB(254, 171, 214), accent = Color3.fromRGB(191, 255, 242) },
  { name = "Denim Day", primary = Color3.fromRGB(64, 120, 198), accent = Color3.fromRGB(255, 255, 255) },
  { name = "Monochrome", primary = Color3.fromRGB(60, 60, 60), accent = Color3.fromRGB(230, 230, 230) },
  { name = "Desert Bloom", primary = Color3.fromRGB(232, 155, 91), accent = Color3.fromRGB(214, 94, 109) },
  { name = "Galaxy Glam", primary = Color3.fromRGB(58, 42, 120), accent = Color3.fromRGB(141, 237, 255) },
  { name = "Tropical Splash", primary = Color3.fromRGB(43, 215, 168), accent = Color3.fromRGB(255, 83, 83) },
  { name = "Winter Luxe", primary = Color3.fromRGB(186, 232, 255), accent = Color3.fromRGB(110, 164, 217) },
  { name = "Retro Diner", primary = Color3.fromRGB(255, 115, 132), accent = Color3.fromRGB(255, 241, 173) },
  { name = "Cyber Pulse", primary = Color3.fromRGB(80, 255, 160), accent = Color3.fromRGB(35, 35, 35) },
  { name = "Garden Party", primary = Color3.fromRGB(122, 199, 126), accent = Color3.fromRGB(255, 231, 170) },
  { name = "Rose Gold", primary = Color3.fromRGB(245, 189, 170), accent = Color3.fromRGB(206, 124, 114) },
  { name = "Urban Luxe", primary = Color3.fromRGB(96, 108, 129), accent = Color3.fromRGB(198, 198, 204) },
  { name = "Candy Pop", primary = Color3.fromRGB(255, 128, 216), accent = Color3.fromRGB(255, 233, 153) },
  { name = "Emerald Night", primary = Color3.fromRGB(40, 120, 95), accent = Color3.fromRGB(214, 242, 209) },
}

local MATERIALS = {
  floor = Enum.Material.Marble,
  runway = Enum.Material.SmoothPlastic,
  neon = Enum.Material.Neon,
  metallic = Enum.Material.Metal,
  velvet = Enum.Material.Fabric,
}

local function createPart(parent, size, cframe, color, material, transparency)
  local part = Instance.new("Part")
  part.Size = size
  part.CFrame = cframe
  part.Anchored = true
  part.TopSurface = Enum.SurfaceType.Smooth
  part.BottomSurface = Enum.SurfaceType.Smooth
  part.Material = material or Enum.Material.SmoothPlastic
  part.Color = color
  part.Transparency = transparency or 0
  part.Parent = parent
  return part
end

local function createLabel(parent, text)
  local billboard = Instance.new("BillboardGui")
  billboard.Size = UDim2.new(0, 180, 0, 40)
  billboard.StudsOffset = Vector3.new(0, 4, 0)
  billboard.AlwaysOnTop = true

  local label = Instance.new("TextLabel")
  label.Size = UDim2.fromScale(1, 1)
  label.BackgroundTransparency = 1
  label.Text = text
  label.TextScaled = true
  label.Font = Enum.Font.GothamBold
  label.TextColor3 = Color3.fromRGB(255, 255, 255)
  label.TextStrokeTransparency = 0.3
  label.Parent = billboard

  billboard.Parent = parent
end

local function buildMannequin(parent, position, outfit)
  local mannequin = Instance.new("Model")
  mannequin.Name = outfit.name
  mannequin.Parent = parent

  local base = createPart(
    mannequin,
    Vector3.new(3, 0.5, 3),
    CFrame.new(position),
    outfit.accent,
    MATERIALS.neon
  )
  base.Name = "DisplayBase"

  local torso = createPart(
    mannequin,
    Vector3.new(2.6, 3.2, 1.2),
    CFrame.new(position + Vector3.new(0, 2.1, 0)),
    outfit.primary,
    MATERIALS.velvet
  )
  torso.Name = "OutfitBody"

  local accent = createPart(
    mannequin,
    Vector3.new(2.8, 1.2, 1.3),
    CFrame.new(position + Vector3.new(0, 0.9, 0)),
    outfit.accent,
    MATERIALS.runway
  )
  accent.Name = "OutfitSkirt"

  local sash = createPart(
    mannequin,
    Vector3.new(2.7, 0.4, 1.25),
    CFrame.new(position + Vector3.new(0, 2.4, 0)),
    outfit.accent,
    MATERIALS.neon
  )
  sash.Name = "OutfitSash"

  local spotlight = Instance.new("SpotLight")
  spotlight.Color = outfit.accent
  spotlight.Angle = 60
  spotlight.Brightness = 6
  spotlight.Range = 20
  spotlight.Parent = base

  createLabel(torso, outfit.name)

  mannequin.PrimaryPart = base
end

local function buildRunway(parent, origin)
  local runway = Instance.new("Model")
  runway.Name = "Runway"
  runway.Parent = parent

  createPart(
    runway,
    Vector3.new(80, 1, 26),
    CFrame.new(origin),
    Color3.fromRGB(238, 238, 238),
    MATERIALS.floor
  )

  createPart(
    runway,
    Vector3.new(80, 1, 4),
    CFrame.new(origin + Vector3.new(0, 0.6, -11)),
    Color3.fromRGB(255, 255, 255),
    MATERIALS.neon
  )

  createPart(
    runway,
    Vector3.new(80, 1, 4),
    CFrame.new(origin + Vector3.new(0, 0.6, 11)),
    Color3.fromRGB(255, 255, 255),
    MATERIALS.neon
  )

  for i = -3, 3 do
    local stripe = createPart(
      runway,
      Vector3.new(8, 0.2, 2),
      CFrame.new(origin + Vector3.new(i * 12, 0.7, 0)),
      Color3.fromRGB(255, 221, 187),
      MATERIALS.runway
    )
    stripe.Name = "CenterStripe"
  end
end

local function buildStageLights(parent, origin)
  local lightRig = Instance.new("Model")
  lightRig.Name = "StageLights"
  lightRig.Parent = parent

  for i = -3, 3 do
    local pole = createPart(
      lightRig,
      Vector3.new(0.4, 14, 0.4),
      CFrame.new(origin + Vector3.new(i * 12, 7, -14)),
      Color3.fromRGB(45, 45, 55),
      MATERIALS.metallic
    )
    pole.Name = "LightPole"

    local head = createPart(
      lightRig,
      Vector3.new(2.4, 1, 2.4),
      CFrame.new(origin + Vector3.new(i * 12, 13.2, -14)),
      Color3.fromRGB(70, 70, 90),
      MATERIALS.metallic
    )
    head.Name = "LightHead"

    local beam = createPart(
      lightRig,
      Vector3.new(6, 10, 6),
      CFrame.new(origin + Vector3.new(i * 12, 7, -6)),
      Color3.fromRGB(255, 245, 210),
      MATERIALS.neon,
      0.6
    )
    beam.Name = "LightBeam"
  end
end

local function buildBackdrop(parent, origin)
  local wall = createPart(
    parent,
    Vector3.new(80, 22, 1),
    CFrame.new(origin + Vector3.new(0, 11, -16)),
    Color3.fromRGB(35, 35, 45),
    MATERIALS.runway
  )
  wall.Name = "Backdrop"

  local logo = Instance.new("SurfaceGui")
  logo.CanvasSize = Vector2.new(800, 400)
  logo.Face = Enum.NormalId.Front
  logo.Parent = wall

  local text = Instance.new("TextLabel")
  text.Size = UDim2.fromScale(1, 1)
  text.BackgroundTransparency = 1
  text.Text = "Dress to Impress | Runway"
  text.TextScaled = true
  text.Font = Enum.Font.GothamBlack
  text.TextColor3 = Color3.fromRGB(255, 255, 255)
  text.TextStrokeTransparency = 0.3
  text.Parent = logo
end

local function buildPhotoBooths(parent, origin)
  local booths = Instance.new("Model")
  booths.Name = "PhotoBooths"
  booths.Parent = parent

  for i = 1, 3 do
    local boothOrigin = origin + Vector3.new(-30 + (i - 1) * 30, 0, 28)
    local booth = Instance.new("Model")
    booth.Name = ("Booth%d"):format(i)
    booth.Parent = booths

    createPart(
      booth,
      Vector3.new(10, 8, 10),
      CFrame.new(boothOrigin + Vector3.new(0, 4, 0)),
      Color3.fromRGB(28, 28, 40),
      MATERIALS.runway
    )

    createPart(
      booth,
      Vector3.new(9, 7, 0.4),
      CFrame.new(boothOrigin + Vector3.new(0, 4, -4.8)),
      Color3.fromRGB(80, 180, 255),
      MATERIALS.neon,
      0.2
    )

    local boothLabel = createPart(
      booth,
      Vector3.new(6, 1.5, 0.2),
      CFrame.new(boothOrigin + Vector3.new(0, 7.5, 5)),
      Color3.fromRGB(255, 255, 255),
      MATERIALS.neon
    )
    boothLabel.Name = "BoothSign"

    local surface = Instance.new("SurfaceGui")
    surface.CanvasSize = Vector2.new(400, 100)
    surface.Face = Enum.NormalId.Front
    surface.Parent = boothLabel

    local text = Instance.new("TextLabel")
    text.Size = UDim2.fromScale(1, 1)
    text.BackgroundTransparency = 1
    text.Text = "Photo Booth"
    text.TextScaled = true
    text.Font = Enum.Font.GothamBold
    text.TextColor3 = Color3.fromRGB(20, 20, 30)
    text.Parent = surface
  end
end

local function buildVIPLounge(parent, origin)
  local lounge = Instance.new("Model")
  lounge.Name = "VIPLounge"
  lounge.Parent = parent

  createPart(
    lounge,
    Vector3.new(24, 1, 16),
    CFrame.new(origin + Vector3.new(32, 0.5, 18)),
    Color3.fromRGB(27, 27, 36),
    MATERIALS.floor
  )

  createPart(
    lounge,
    Vector3.new(22, 5, 0.5),
    CFrame.new(origin + Vector3.new(32, 3, 10)),
    Color3.fromRGB(45, 45, 60),
    MATERIALS.runway
  )

  createPart(
    lounge,
    Vector3.new(8, 2, 4),
    CFrame.new(origin + Vector3.new(24, 1.5, 20)),
    Color3.fromRGB(74, 85, 120),
    MATERIALS.velvet
  )

  createPart(
    lounge,
    Vector3.new(8, 2, 4),
    CFrame.new(origin + Vector3.new(40, 1.5, 20)),
    Color3.fromRGB(120, 80, 120),
    MATERIALS.velvet
  )
end

local function buildLighting()
  local lighting = game:GetService("Lighting")
  lighting.ClockTime = 20.2
  lighting.Ambient = Color3.fromRGB(65, 70, 90)
  lighting.Brightness = 3.5
  lighting.EnvironmentDiffuseScale = 0.75
  lighting.EnvironmentSpecularScale = 1
  lighting.ColorShift_Top = Color3.fromRGB(40, 35, 65)
  lighting.ColorShift_Bottom = Color3.fromRGB(10, 10, 20)
end

function MapBuilder.build()
  buildLighting()

  local workspaceFolder = Instance.new("Folder")
  workspaceFolder.Name = "DressToImpressMap"
  workspaceFolder.Parent = workspace

  buildRunway(workspaceFolder, Vector3.new(0, 0.5, 0))
  buildBackdrop(workspaceFolder, Vector3.new(0, 0, 0))
  buildStageLights(workspaceFolder, Vector3.new(0, 0, 0))
  buildPhotoBooths(workspaceFolder, Vector3.new(0, 0, 0))
  buildVIPLounge(workspaceFolder, Vector3.new(0, 0, 0))

  local gridStart = Vector3.new(-32, 0.5, 24)
  local index = 0

  for row = 1, 5 do
    for col = 1, 4 do
      index += 1
      local outfit = OUTFITS[index]
      if outfit then
        local offset = Vector3.new((col - 1) * 18, 0, (row - 1) * 12)
        buildMannequin(workspaceFolder, gridStart + offset, outfit)
      end
    end
  end

  return workspaceFolder
end

return MapBuilder
