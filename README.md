# CDB

This cookbook helps to create a Clustered MongoDB scenario with Replication and Sharding. 4 VM instances are needed for it to work. These recipes are to be executed only once using knife solo.

TODO:

After initialising 4 virtual instances of CentOS 7 on any VM run 'knife solo prepare' from your workstaion on all 4 instances, after that note down the IP adresses of the instances and update the following files:
config.sh
mongos.sh
shard0.sh
shard1.sh
pc4.rb

Then proceed with the following tasks in order.

1. Update the runlist on all the generated JSON files under the nodes diretory for each corresponding instances.
2. Update second instance JSON file with runlist as ["recipe[CDB]","recipe[CDB::pc2]"]
3. Update third instance JSON file with runlist as ["recipe[CDB]","recipe[CDB::pc3]"]
4. Update first instance JSON file with runlist as ["recipe[CDB]","recipe[CDB::pc1]","recipe[CDB::Master-Initialize]"]
5. Update fourth instance JSON file with runlist as ["recipe[CDB]","recipe[CDB::pc4]"]
6. Cook recipes in following order:
   1) Instance 2
   2) Instance 3
   3) Instance 1
   4) Instance 4

The main app communicates with MongoDB through the fourth instance. All mongo operation and commands are to be executed through the fouth instance.
