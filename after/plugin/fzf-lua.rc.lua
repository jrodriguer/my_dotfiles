local status, fzf = pcall(require, "fzf-lua")
if (not status) then return end

fzf.setup{
  winopts = { height=0.33, width=0.33 }
}

