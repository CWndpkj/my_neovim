local cmake_tools = require "cmake-tools"
return {
  name = "CMakeBuild",
  builder = function()
    return {
      name = "CMakeBuild",
      cmd = { "cmake" },
      args = {
        "--build",
        cmake_tools.get_build_directory()["filename"],
        "--target",
        cmake_tools.get_build_target(),
      },
      cwd = vim.fn.getcwd(),
      components = {
        "default",
      },
      ["on_output_quickfix"] = true,
    }
  end,
  condition = {
    callback = function() return cmake_tools.is_cmake_project() end,
  },
}
