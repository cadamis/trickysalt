# Test area for interesting salt tricks

## Backdoor your minions
One of the basic things you can do with reactors is ensure that all your minions can be reached through salt-ssh.
A simple example of this is found in the files saltstack/master.d/reactor and saltstack/reactor/minion_start.sls. To 
see an example of this, clone this project and do a `vagrant up`. Then `vagrant ssh master` to get into the master, and 
`sudo -s` to root.

First, verify that salt can communicate with the minion normally:  
`salt minion1 test.ping`  
Now stop the salt-minion service on minion1:  
`salt minion1 service.stop salt-minion`  
You should see a "Minion did not return. \[No response\]" message, since, of course, we killed the salt-minion.
Normally in this situation you end up logging directly into the minion to restart the salt-minion service. However,
thanks to our handly reactor and the cache roster, any minion that has ever connected to this salt master will
allow salt-ssh to access it. Run this:  
`salt-ssh -i minion1 cmd.run "service salt-minion start"`  
And the minion should be available again:  
`salt minion1 test.ping`  

The example in this project is using a pre-seeded roster until the new roster cache module is released, which should
fix some targetting issues.


## Ensure files stay pristine
There's also a beacon example that's pretty textbook. Once your minion and master are set up, there's a file in
/opt/myapp called important.txt. Any time this file is modified or deleted, the salt master runs the minion state
to put the file back the way it's supposed to be.


