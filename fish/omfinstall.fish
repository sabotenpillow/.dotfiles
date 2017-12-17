cat plugins.list | while read -l plugin
  omf install $plugin
end
