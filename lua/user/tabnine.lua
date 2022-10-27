local cmp_status_ok, tabnine = pcall(require, "tabnine")
if not cmp_status_ok then
  return
end

tabnine.setup({
  show_prediction_strength = true
})
