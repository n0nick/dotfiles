-- Command aliases (typo helpers)
local function create_alias(name, cmd, opts)
  opts = opts or {}
  local has_args = opts.args ~= false
  local complete = opts.complete
  
  vim.api.nvim_create_user_command(name, function(alias_opts)
    local bang = alias_opts.bang and '!' or ''
    local args = has_args and (' ' .. (alias_opts.args or '')) or ''
    vim.cmd(cmd .. bang .. args)
  end, {
    bang = true,
    nargs = has_args and '?' or 0,
    complete = complete,
  })
end

-- Commands with args
create_alias('E', 'e', { complete = 'file' })
create_alias('W', 'w', { complete = 'file' })
create_alias('Wq', 'wq', { complete = 'file' })
create_alias('WQ', 'wq', { complete = 'file' })
create_alias('Set', 'set', { complete = 'option' })

-- Commands without args
create_alias('Wa', 'wa', { args = false })
create_alias('WA', 'wa', { args = false })
create_alias('Q', 'q', { args = false })
create_alias('QA', 'qa', { args = false })
create_alias('Qa', 'qa', { args = false })
create_alias('Cq', 'cq', { args  = false })
create_alias('Bd', 'bd', { args = false })

