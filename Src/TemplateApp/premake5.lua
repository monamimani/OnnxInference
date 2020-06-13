

  project(path.getbasename(os.getcwd()))
    kind "ConsoleApp"
    location(os.getcwd())
    
    files {
      "%{prj.name}/**.h",
      "%{prj.name}/**.cpp",
    }

    includedirs {
      "%{wks.location}/%{prj.name}",
      -- "%{wks.location}/Core",
    }

    links {
      -- "Core",
    }