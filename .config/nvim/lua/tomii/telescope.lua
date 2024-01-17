local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then
  print "ERROR: telescope not available. Called from tabs.lua"
  return
end

-- TODO
-- telscope.setup({
-- })
