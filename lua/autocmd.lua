vim.api.nvim_create_autocmd({ 'InsertLeave', 'TextChanged' }, {
  pattern = '*.*',
  command = 'update',
})

vim.api.nvim_create_autocmd('VimEnter', {
  pattern = '*',
  callback = function()
    local mason_registry_ok, registry = pcall(require, 'mason-registry')
    if not mason_registry_ok then
      return
    end

    local none_ls_to_mason_map = {
      ['google_java_format'] = 'google-java-format',
      ['elm_format'] = 'elm-format',
      ['pg_format'] = 'pgformatter',
      ['terraform_fmt'] = 'terraform',
      ['wasm_opt'] = 'wasm-language-tools',
      ['ansible_lint'] = 'ansible-lint',
      ['cfn_lint'] = 'cfn-lint',
      ['clj_kondo'] = 'clj-kondo',
      ['dotenv_linter'] = 'dotenv-linter',
      ['kube_linter'] = 'kube-linter',
      ['tflint'] = 'tflint',
    }

    local formatters_ok, formatters = pcall(require, 'formatters')
    if not formatters_ok then formatters = {} end
    
    local linters_ok, linters = pcall(require, 'linters')
    if not linters_ok then linters = {} end

    local function mason_autoinstall(packages_list)
      if not packages_list or type(packages_list) ~= 'table' then return end

      for _, none_ls_name in ipairs(packages_list) do
        if none_ls_name and type(none_ls_name) == 'string' then
          local mason_pkg_name = none_ls_to_mason_map[none_ls_name] or none_ls_name

          local get_pkg_ok, pkg = pcall(registry.get_package, mason_pkg_name)

          if get_pkg_ok and pkg then
            if not pkg:is_installed() then
              vim.notify("Mason: Auto-installing " .. mason_pkg_name .. "...", vim.log.levels.INFO)
              local install_ok, install_err = pcall(pkg.install, pkg)
              if not install_ok then
                vim.notify("Mason: Failed to install " .. mason_pkg_name .. ": " .. tostring(install_err), vim.log.levels.ERROR)
              end
            end
          else
          end
        end
      end
    end

    mason_autoinstall(formatters)
    mason_autoinstall(linters)
  end,
})
