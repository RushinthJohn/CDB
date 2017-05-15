# connect to shard 0, set members and initiate

mongo --port 37020 << 'EOF'
config = { _id: "s0", members:[
          { _id : 0, host : "192.168.1.134:37020" },
          { _id : 1, host : "192.168.1.135:37025" },
          { _id : 2, host : "192.168.1.136:37030" }]};
rs.initiate(config)
EOF
