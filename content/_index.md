+++
date = "2015-05-25T21:07:48+09:00"
title = "_index"
+++

## What is this?

**Koyomi** is a simple distributed job scheduler which achieves High Availability.

You can run **koyomi worker** on several servers.
Then if one worker stops with a certain trouble, remaining alive workers will take after its jobs.

## How to use?

All you need are followings in a nutshell:

* A couple of servers on which **koyomi worker** runs.
* **Datastore** with high availability.

Currently supported datastore type is **MySQL** only.

## Next Step

Read following materials to use **Koyomi**:

* [Getting Started](bootstrap)
