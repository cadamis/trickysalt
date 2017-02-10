ssh_backdoor:
  local.state.apply:
    - tgt:  {{ data['id'] }}
    - arg:
      - backdoor

