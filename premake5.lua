-- https://github.com/premake/premake-core/wiki/Project-API
-- https://github.com/premake/premake-core/wiki/Lua-Library-Additions

require "export-compile-commands"

  SourceDir = "Src/";
  ExternalsDir = "Externals/";

workspace "TemplatePremake5Project"

-- We set the location of the files Premake will generate
  --location("Projects/" .. _ACTION)
  location(SourceDir)

  language "C++"
  cppdialect "C++latest"
  warnings "Extra"
  staticruntime "Off"
  characterset "ASCII"

  targetdir ("_Bin/%{cfg.architecture}-%{cfg.buildcfg}/")
  objdir ("_BinIntermediates/%{cfg.architecture}-%{cfg.buildcfg}/%{prj.name}/")

  architecture "x64"
  configurations { "Debug", "Release", "Shipping" }
  -- We use filters to set options, a new feature of Premake5.
  -- We now only set settings for the Debug configuration
  filter { "configurations:Debug" }
    symbols "On"
    defines { "_DEBUG"}

  -- We now only set settings for Release
  filter { "configurations:Release" }
    optimize "Debug"
    symbols "On"
    defines { "NDEBUG"}

  filter { "configurations:Shipping" }
    optimize "Full"
    symbols "Off"
    defines { "NDEBUG"}

  filter { "system:windows" }
    systemversion "latest"

  -- Reset the filter for other settings
  filter { }

  startproject "TemplatePremake5Project"

  printf("premake5.lua files found:")
  local premake5Files = os.matchfiles( SourceDir .. "**/premake5.lua") 
  -- printf("%s", table.tostring(premake5Files))
  for key, filePath in pairs(premake5Files) do
    printf("[%s]: %s", key, filePath)
    include(filePath)
  end
