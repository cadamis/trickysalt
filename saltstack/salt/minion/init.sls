salt-minion-packages:
  pkg.installed:
    - names:
      - python-pyinotify

super_important_file:
  file.managed:
    - name: /opt/myapp/important.txt
    - source: salt://minion/files/important.txt
    - makedirs: True






