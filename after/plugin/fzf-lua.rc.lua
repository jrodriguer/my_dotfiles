local status, fzf = pcall(require, "fzf-lua")
if (not status) then return end

fzf.setup{
  winopts = { height=0.33, width=0.33 }
}

-- Lua table as contents
require'fzf-lua'.fzf_live(
  function(q)
    local lines = {}
    if tonumber(q) then
      for i=1,q do
        table.insert(lines, i)
      end
    else
      table.insert(lines, "Invalid number: " .. q)
    end
    return lines
  end,
  {
    prompt = 'Live> ',
    exec_empty_query = true,
  }
)

-- Example #1: "live" ripgrep
-- Tying it all together let's create our own version of "live grep" with file icons and git indicators:
_G.live_grep = function(opts)
  opts = opts or {}
  opts.prompt = "rg> "
  opts.git_icons = true
  opts.file_icons = true
  opts.color_icons = true
  -- setup default actions for edit, quickfix, etc
  opts.actions = fzf.defaults.actions.files
  -- see preview overview for more info on previewers
  opts.previewer = "builtin"
  opts.fn_transform = function(x)
    return fzf.make_entry.file(x, opts)
  end
  -- we only need 'fn_preprocess' in order to display 'git_icons'
  -- it runs once before the actual command to get modified files
  -- 'make_entry.file' uses 'opts.diff_files' to detect modified files
  -- will probaly make this more straight forward in the future
  opts.fn_preprocess = function(o)
    opts.diff_files = fzf.make_entry.preprocess(o).diff_files
    return opts
  end
  return fzf.fzf_live(function(q)
    return "rg --column --color=always -- " .. vim.fn.shellescape(q or '')
  end, opts)
end

-- We can use our new function on any folder or
-- with any other fzf-lua options ('winopts', etc)
_G.live_grep({ cwd = "<my folder>" })
