minionize:
  local.state.apply:
    - tgt:  {{ data['id'] }}
    - arg:
      - minion

