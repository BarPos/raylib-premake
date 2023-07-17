project "raylib"
	kind "StaticLib"
	language "C"

  defines{"GRAPHICS_API_OPENGL_33"}

  targetdir ("%{wks.location}/build/" .. outputdir .. "/%{prj.name}")
	debugdir ("%{wks.location}/build/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/build/tmp/" .. outputdir .. "/%{prj.name}")

	includedirs
	{
		"src/",
    "src/external/glfw/include"
	}

  files
  {
    "src/*.h",
    "src/*.c"
  }

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
