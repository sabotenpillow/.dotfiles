function fish_user_key_bindings
  bind \cr history-search-backward

  ## own key bindings
  bind \co __cd-parent-directory
  bind \cv __delete-current-command
  bind \em __accept-autosuggestion-and-accept-line
end
