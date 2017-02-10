super_important_file:
  file.managed:
    - name: /opt/important.txt
    - source: salt://minion/files/important.txt

master_key_present:
  ssh_auth.present:
    - user: root
    - source: salt://master/files/salt-ssh.rsa.pub





