# CDB

This cookbook helps to create a Clustered MongoDB scenario with Replication and Sharding. 4 VM instances are needed for it to work. These recipes are to be executed only once using knife solo.

TODO:

After initialising 4 virtual instances of CentOS 7 on any VM run 'knife solo prepare' from your workstaion on all 4 instances, after that note down the IP adresses of the instances and update them in attributes/default.rb.

Then proceed with the following tasks in order.

1. Update the runlist on all the generated JSON files under the nodes diretory for each corresponding instances.
2. Update first instance JSON file with runlist as ["recipe[CDB]","recipe[CDB::pc1]"]
3. Update second instance JSON file with runlist as ["recipe[CDB]","recipe[CDB::pc2]"]
4. Update third instance JSON file with runlist as ["recipe[CDB]","recipe[CDB::pc3]","recipe[CDB::master_initialize]"]
5. Update fourth instance JSON file with runlist as ["recipe[CDB]","recipe[CDB::pc4]"]
6. Cook recipes in following order:
   1) Instance 1
   2) Instance 2
   3) Instance 3
   4) Instance 4

The main app communicates with MongoDB through the fourth instance. All mongo operation and commands are to be executed through the fouth instance.
