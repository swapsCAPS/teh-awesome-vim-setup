vim.api.nvim_create_user_command("BJ", 'execute "%!python3 -m json.tool"', {})
