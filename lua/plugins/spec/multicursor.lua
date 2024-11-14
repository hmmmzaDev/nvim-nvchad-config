return {
  "jake-stewart/multicursor.nvim",
  enabled = true,
  event = "BufEnter",
  branch = "1.0",
  config = function(_, opts)
    local mc = require "multicursor-nvim"
    mc.setup(opts)

    local map = require("gale.utils").glb_map

    map({ "n", "v" }, "<up>", function()
      mc.lineAddCursor(-1)
    end, { desc = "Multicursor add cursor above main cursor." })

    map({ "n", "v" }, "<down>", function()
      mc.lineAddCursor(1)
    end, { desc = "Multicursor add cursor below main cursor." })

    map({ "n", "v" }, "<leader>mc<up>", function()
      mc.lineSkipCursor(-1)
    end, { desc = "Multicursor skip cursor above main cursor." })

    map({ "n", "v" }, "<leader>mc<down>", function()
      mc.lineSkipCursor(1)
    end, { desc = "Multicursor skip cursor below main cursor." })

    map({ "n", "v" }, "<leader>mcn", function()
      mc.matchAddCursor(1)
    end, { desc = "Multicursor add cursor below main cursor by matching word/selection." })

    map({ "n", "v" }, "<leader>mcs", function()
      mc.matchSkipCursor(1)
    end, { desc = "Multicursor skip cursor below main cursor by matching word/selection." })

    map({ "n", "v" }, "<leader>mcN", function()
      mc.matchAddCursor(-1)
    end, { desc = "Multicursor add cursor above main cursor by matching word/selection." })

    map({ "n", "v" }, "<leader>mcS", function()
      mc.matchSkipCursor(-1)
    end, { desc = "Multicursor skip cursor above main cursor by matching word/selection." })

    map({ "n", "v" }, "<leader>mcA", mc.matchAllAddCursors, { desc = "Multicursor add all matches in document." })
    map({ "n", "v" }, "<left>", mc.nextCursor, { desc = "Multicursor rotate the main cursor to the left." })
    map({ "n", "v" }, "<right>", mc.prevCursor, { desc = "Multicursor rotate the main cursor to the right." })
    map({ "n", "v" }, "<leader>mcx", mc.deleteCursor, { desc = "Multicursor delete main cursor." })
    map("n", "<c-leftmouse>", mc.handleMouse, { desc = "Multicursor add/remove cursors with mouse." })
    map({ "n", "v" }, "<c-q>", mc.toggleCursor, { desc = "Multicursor toggle cursors." })
    map({ "n", "v" }, "<leader>mc<c-q>", mc.duplicateCursors, { desc = "Multicursor duplicate cursors." })

    map("n", "<esc>", function()
      if not mc.cursorsEnabled() then
        mc.enableCursors()
      elseif mc.hasCursors() then
        mc.clearCursors()
      else
        -- Default <esc> handler.
      end
    end)

    map("v", "<leader>mca", mc.alignCursors, { desc = "Multicursor align cursor columns." })
    map("v", "S", mc.splitCursors, { desc = "Multicursor split visual selections by regex." })
    map("v", "I", mc.insertVisual, { desc = "Multicursor insert for each line of visual selections." })
    map("v", "A", mc.appendVisual, { desc = "Multicursor append for each line of visual selections." })
    map("v", "M", mc.matchCursors, { desc = "Multicursor match new cursors within visual selections by regex." })

    map("v", "<leader>mct", function()
      mc.transposeCursors(1)
    end, { desc = "Multicursor rotate visual selection contents to the right." })

    map("v", "<leader>mcT", function()
      mc.transposeCursors(-1)
    end, { desc = "Multicursor rotate visual selection contents to the left." })

    local hl = vim.api.nvim_set_hl
    hl(0, "MultiCursorCursor", { link = "Cursor" })
    hl(0, "MultiCursorVisual", { link = "Visual" })
    hl(0, "MultiCursorSign", { link = "SignColumn" })
    hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
    hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
    hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
  end,
}
