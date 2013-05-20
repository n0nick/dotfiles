function _z_trigger -e "fish_prompt" -d "On every prompt, add directory to z"
  z --add "$PWD"
end
