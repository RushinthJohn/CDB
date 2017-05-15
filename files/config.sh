# connect to configuration server, set members and initiate

mongo --port 57020 << 'EOF'
config = { _id: "cfgst", members:[
          { _id : 0, host : "192.168.1.134:57020" },
          { _id : 1, host : "192.168.1.135:57025" },
          { _id : 2, host : "192.168.1.136:57030" }]};
rs.initiate(config)
EOF
