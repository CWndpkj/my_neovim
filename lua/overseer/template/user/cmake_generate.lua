local cmake_tools = require "cmake-tools"
return {
  name = "CMakeGenerate",
  params = {
    build_type = { optional = true, type = "string", default = "Debug" },
  },
  builder = function(params)
    return {
      name = "CMakeGenerate",
      cmd = { "cmake" },
      args = {
        "--preset",
        cmake_tools.get_configure_preset(),
        table.concat(cmake_tools.get_generate_options(), " "),
        "-DCMAKE_BUILD_TYPE=" .. params.build_type,
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
