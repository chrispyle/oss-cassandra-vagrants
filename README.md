![Logo](https://www.clearcapital.com/wp-content/uploads/2015/02/Clear-Capital@2x.png)
# Cassandra Vagrants

## What is it?

A couple of (vagrants)[http://vagrantup.com/] for testing the oss-cassandra-helpers library.

- apache-cassandra - A vagrant to run apache cassandra 2.x

- dse - A vagrant to run DSE

Aside from having to create a credentials file (see below), their use
is really quite simple:

```bash
cd apache-cassandra
vagrant up
cd ../dse
vagrant up
```

We hope you've got a lot of RAM!

## DSE Licensing

DSE is free to use outside of production environments, which obviously
includes vagrant, but downloading it requires registration.  We
obviously cannot violate that requirement, so there is a module in the
dse/ directory which is missing and even .gitignore'd so that it
doesn't accidentally show up somewhere it shouldn't.

You will need to create this, called
`dse/provision-dse-credentials.sh`, and place the following into
it. Replace {user} and {pass} with your DSE user and password,
urlencoding as necessary.

```bash 
#!/bin/bash
# file: dse/provision-dse-credentials.sh

echo "deb http://{user}:{pass}@debian.datastax.com/enterprise stable main" | sudo tee -a /etc/apt/sources.list.d/datastax.list
```

