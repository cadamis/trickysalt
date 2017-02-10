salt-master-packages:
  pkg.installed:
    - names:
      - salt-api
      - salt-ssh

/etc/salt/pki/master/ssh/salt-ssh.rsa:
  file.managed:
    - source: salt://master/files/salt-ssh.rsa
    - makedirs: True

/etc/salt/pki/master/ssh/salt-ssh.rsa.pub:
  file.managed:
    - source: salt://master/files/salt-ssh.rsa.pub
    - mode: 600
    - makedirs: True



