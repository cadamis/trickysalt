install_master_key:
  ssh_auth.present:
    - user: root
    - source: salt://master/files/salt-ssh.rsa.pub





