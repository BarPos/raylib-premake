project "raylib"
	kind "StaticLib"
architecture "x64"
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

filter "system:windows"
	defines{"_WIN32", "PLATFORM_DESKTOP", "_MSC_VER", "_CRT_SECURE_NO_WARNINGS"}
        links {"winmm", "kernel32", "opengl32", "gdi32"}

filter "system:linux"
	defines{"_GNU_SOURCE", "PLATFORM_DESKTOP"}
        links {"GL", "m", "dl", "rt", "X11"}

	filter "configurations:Debug"
		symbols "on"

	filter "configurations:Release"
		optimize "on"
