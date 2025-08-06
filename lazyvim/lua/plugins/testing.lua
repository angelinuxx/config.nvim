return {
  { "nvim-neotest/neotest-plenary" },
  { "V13Axel/neotest-pest" },
  {
    -- Add neotest-pest plugin for running PHP tests.
    -- A package is also available for PHPUnit if needed.
    "nvim-neotest/neotest",
    opts = { adapters = { "neotest-pest", "neotest-plenary" } },
  },
}
