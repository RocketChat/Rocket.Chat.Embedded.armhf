# docker compose to start an RC server

You need to first startup the mongo server:

```
docker.compose up -d mongo
```
Note that the mongo server will use the data directory to store the data files.   You can take a look to see that it is populated.

Examine the logs to see that the server is listening to connections:

```
docker logs compose_mongo_1 
```
Next, you need to do this ONE TIME ONLY - to initialize the replicaset in mongo.  This turns the mongo server into a single primary  replicaset node.

```
docker.compose run --rm  mongo-init-replica
```

You should see output similar to:

```
compose_mongo_1 is up-to-date
Creating compose_mongo-init-replica_1 ... done
Attaching to compose_mongo-init-replica_1
mongo-init-replica_1  | MongoDB shell version: 3.2.15
mongo-init-replica_1  | connecting to: mongo/rocketchat
mongo-init-replica_1  | { "ok" : 1 }
compose_mongo-init-replica_1 exited with code 0
```
Note the `{ "ok" : 1 }` responose.

You can also check that the mongo server indeed has started up as a PRIMARY node via the logs:

```
docker logs compose_mongo_1
```

Look for similar message to ones below:

```
2019-02-22T07:54:59.517+0000 I REPL     [ReplicationExecutor] This node is localhost:27017 in the config
2019-02-22T07:54:59.517+0000 I REPL     [ReplicationExecutor] transition to STARTUP2
2019-02-22T07:54:59.517+0000 I REPL     [conn1] Starting replication applier threads
2019-02-22T07:54:59.519+0000 I REPL     [ReplicationExecutor] transition to RECOVERING
2019-02-22T07:54:59.520+0000 I REPL     [ReplicationExecutor] transition to SECONDARY
2019-02-22T07:54:59.520+0000 I REPL     [ReplicationExecutor] conducting a dry run election to see if we could be elected
2019-02-22T07:54:59.520+0000 I REPL     [ReplicationExecutor] dry election run succeeded, running for election
2019-02-22T07:54:59.524+0000 I REPL     [ReplicationExecutor] election succeeded, assuming primary role in term 1
2019-02-22T07:54:59.524+0000 I REPL     [ReplicationExecutor] transition to PRIMARY
2019-02-22T07:54:59.531+0000 I NETWORK  [conn1] end connection 172.18.0.3:56380 (0 connections now open)
```

```
Updating process.env.MAIL_URL
Using GridFS for custom sounds storage
Using GridFS for custom emoji storage
Loaded the Apps Framework and loaded a total of 0 Apps!
➔ System ➔ startup
➔ +----------------------------------------------+
➔ |                SERVER RUNNING                |
➔ +----------------------------------------------+
➔ |                                              |
➔ |  Rocket.Chat Version: 0.74.3                 |
➔ |       NodeJS Version: 8.11.4 - arm           |
➔ |             Platform: linux                  |
➔ |         Process Port: 3000                   |
➔ |             Site URL: http://localhost:3000  |
➔ |     ReplicaSet OpLog: Enabled                |
➔ |          Commit Hash: 202a465f1c             |
➔ |        Commit Branch: HEAD                   |
➔ |                                              |
➔ +----------------------------------------------+
```

