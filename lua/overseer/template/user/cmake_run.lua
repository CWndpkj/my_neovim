local cmake_tools = require "cmake-tools"
local overseer = require "overseer"
return {
  name = "CMakeRun",
  params = {
    args = { optional = true, type = "list", delimiter = " ", default = {} },
  },
  builder = function(params)
    return {
      name = "CMakeRun",
      cmd = { "cmake" },
      args = {
        "--build",
        cmake_tools.get_build_directory()["filename"],
        "--target",
        cmake_tools.get_build_target(),
        "&&",
        cmake_tools.get_launch_target_path(),
      },
      cwd = cmake_tools.get_build_directory()["filename"],
      components = {
        "default",
      },
    }
  end,
  condition = {
    callback = function() return cmake_tools.is_cmake_project() end,
  },
}
