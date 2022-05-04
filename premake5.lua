project "Cubism"
	kind "StaticLib"
	language "C"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
	{
		"src/Rendering/OpenGL/*.cpp",
		"src/Rendering/OpenGL/*.hpp",
		"src/Rendering/*.hpp",
		"src/Rendering/*.cpp",
		"src/Effect/**.cpp",
		"src/Effect/**.hpp",
		"src/Id/**.cpp",
		"src/Id/**.hpp",
		"src/Math/**.cpp",
		"src/Math/**.hpp",
		"src/Model/**.cpp",
		"src/Model/**.hpp",
		"src/Motion/**.cpp",
		"src/Motion/**.hpp",
		"src/Physics/**.cpp",
		"src/Physics/**.hpp",
		"src/Type/**.cpp",
		"src/Type/**.hpp",
		"src/Utils/**.cpp",
		"src/Utils/**.hpp",
		"src/*.hpp",
		"src/*.cpp"
	}
	
	
	includedirs
	{
		"src",
		"../../../libs/CubismCore/Core/include",
		"../../../%{IncludeDir.glew}"
	}
    filter "system:linux"
		pic "On"

    filter "system:windows"
		systemversion "latest"
		libdirs 
		{ 
			"../../../libs/CubismCore/Core/lib/windows/x86_64/142" 
		}
		defines
		{
			"CSM_TARGET_WIN_GL",
			"WIN32",
			"_WINDOWS",
			"GLEW_STATIC"
		}

		
    filter "configurations:Debug"
		runtime "Debug"
		symbols "on"
		links
		{
			"Live2DCubismCore_MTd",
			"glew"
		}
		defines
		{
			"DEBUG",
		}

	filter "configurations:Release"
		optimize "on"
		runtime "Release"
		links
		{
			"Live2DCubismCore_MT",
			"glew"
		}
		defines
		{
			"NDEBUG",
		}

	filter "configurations:Final"
		runtime "Release"
		optimize "on"
        symbols "off"
		links
		{
			"Live2DCubismCore_MT",
			"glew"
		}
		defines
		{
			"NDEBUG",
		}
		