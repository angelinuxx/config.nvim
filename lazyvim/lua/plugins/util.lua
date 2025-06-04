return {
  -- Act as a sudo user
  {
    "lambdalisue/suda.vim",
    cmd = { "SudaRead", "SudaWrite" },
  },
  -- Present markdown files
  {
    "tjdevries/present.nvim",
    cmd = { "PresentStart" },
  },
  {
    "ahmedkhalf/project.nvim",
    enabled = false,
  },
}
