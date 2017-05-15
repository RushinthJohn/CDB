# connect to shard 1, set members and initiate

mongo --port 47020 << 'EOF'
config = { _id: "s1", members:[
          { _id : 0, host : "192.168.1.134:47020" },
          { _id : 1, host : "192.168.1.135:47025" },
          { _id : 2, host : "192.168.1.136:47030" }]};
rs.initiate(config)
EOF
