# Using Dorieh with PostgreSQL Backend

If you just want to try Dorieh in non-production mode you can use included
[docker-compose.yml](../../docker/pg-hll/docker-compose.yml) to start a
lightweight PostgreSQL instance. Corresponding connection configuration
file [database.ini](database.ini) is included with the
examples.

If you have a running instance of PostgreSQL, please create your own
`database.ini` file as described in the 
[documentation](https://foromeplatform.github.io/dorieh/DBConnections.html).
                                                                            
The following commands assume that you are using the provided 
lightweight PostgreSQL server.

Start the server (`git` must be installed; replace $workdir with some 
actual path on your local 
file system):

```shell
cd $workdir
git clone https://github.com/ForomePlatform/dorieh.git 
```
