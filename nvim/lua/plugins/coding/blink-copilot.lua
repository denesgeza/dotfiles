if not Is_Enabled("blink-copilot") then
  return {}
else
  return {
    { "giuxtaposition/blink-cmp-copilot", enabled = false },
    { "fang2hou/blink-copilot" },
    {
      "saghen/blink.cmp",
      opts = {
        sources = {
          default = { "copilot" },
          providers = {
            copilot = {
              name = "copilot",
              module = "blink-copilot",
              score_offset = 800,
              min_keyword_length = 3,
              async = true,
              opts = {
                max_completions = 3,
                max_attempts = 4,
              },
            },
          },
        },
      },
    },
  }
end
