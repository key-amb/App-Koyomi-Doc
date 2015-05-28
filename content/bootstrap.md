+++
categories = ["general"]
date = "2015-05-29T00:25:13+09:00"
tags = ["document"]
title = "Getting Started"
+++

## Install

Currently **Koyomi** is available on GitHub and CPAN.

### From GitHub

You can download archive files from https://github.com/key-amb/perl5-App-Koyomi/releases .

### From CPAN

```
cpanm App::Koyomi
```

[top](#)

## Configure

The default configuration file is `config/default.toml`.  
You can edit the file for customization.
Or when you want to use the configuration file in another path, you can specify
the path by environmental variable `$KOYOMI_CONFIG_PATH`.

The following content shows available configuration parametes in the file.

### General Parameters

```
time_zone = "Asia/Tokyo" # Local time zone is used when not specified

# Enable some debug parameters (see "Debug Parameters" below)
# Don't set "true" on production environment.
debug_mode = true
```

### Logging Parameters

```
[log]
debug   = true            # Enable debug log
console = true            # Output to stderr
file    = true            # Output to log file
file_path = /path/to/log  # Log file path
```

### Job Scheduling Parameters

```
[worker]
interval_minutes = 1 # Worker interval

# Must be shorter than interval_minutes
minimum_interval_seconds = 30

[schedule]
update_interval_seconds = 120 # How often it re-fetch schedule from Datastore

[job]
# Must be shorter than worker.minimum_interval_seconds
lock_ttl_seconds = 25
```

When `worker.interval_minutes = 1`, _koyomi worker_ wakes up and execute scheduled jobs at that time once a minute like **cron** daemon.
You can customize the parameter for longer intervals.

_Koyomi worker_ tries to wake up when the second of time equals `00` (ex: `T09:03:00`).
But it sleeps at least `worker.minimum_interval_seconds` every after spawning jobs once a `worker.interval_minutes`.

So if you start _koyomi worker_ at `T09:02:55` and given `worker.minimum_interval_seconds = 30`, next time _wokrer_ wakes up at `T09:03:25`, after that `T09:04:00`, then `T09:05:00`, ....

_Koyomi worker_ fetches jobs schedule from **Datastore** on start-up, and refetch it every after `schedule.update_interval_seconds`.

Multiple _koyomi workers_ are supposed to run with the same schedule _datastore_.  
Only one _koyomi worker_ runs a certain job at a time.

When a _koyomi worker_ wins to run a job, it records on _datastore_ the "time" and the "hostname" and the "process id".  
On the other hand, another _koyomi worker_ tries to run the job around the time.  
But with the job record in _datastore_, it knows the other _worker_ has run it.  
When one _worker_ has run a job within `job.lock_ttl_seconds`, the other _workers_ quit to run the job.

### Data Source Parameters

```
[datasource.module]
job       = "Teng"
semaphore = "Teng"

[datasource.connector]
dsn      = "dbi:mysql:database=koyomi;host=127.0.0.1;port=3306"
user     = "root"
password = ""

# Can override for each entity
[datasource.connector.job]
dsn  = ...
user = "foo"
password = "xxx"

[datasource.connector.semaphore]
# Can override "datasource.connector", too.
```

You can specify perl module to access each entity in _datastore_.  
Currently, supported module is `Teng` only.

Datasource `job` stands for job schedules.  
Datasource `semaphore` stands for the record and lock entity which controls if one _koyomi worker_ can run a job or not.

## Set Up Datastore

Here are descriptions about how to set up _datastore_.

### MySQL

MySQL database schema is available at `schema/koyomi.ddl` in the source code.

You will register `jobs` by mysql client command or something else.

NOTE:  
You have to create a `semaphores` record whose _job_id_ equals to _id_ of registered `jobs` record.

## Usage

You can launch `koyomi worker` in the way like this:

```
KOYOMI_CONFIG_PATH=/path/to/config.toml koyomi
```
