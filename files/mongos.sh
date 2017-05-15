# add shards and enable sharding on the test db

mongo <<'EOF'
use admin
db.runCommand( { addshard : "s0/192.168.1.134:37020" } );
db.runCommand( { addshard : "s1/192.168.1.134:47020" } );
db.runCommand( { enableSharding: "data" } );
db.runCommand( { shardCollection: "data.try", key: { _id:1 } } );
EOF
