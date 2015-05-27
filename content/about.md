+++
categories = ["general"]
date = "2015-05-26T02:29:01+09:00"
tags = ["document"]
title = "About"

+++

## VERSION

_v0.1.0_

## MILESTONE

Here are what I plan to implement to _Koyomi_ towards **_v1.0.0_**:

* **CommandLine Interface** for CRUD of job schedule.
* Enable to specify which _OS user_ executes the _job command_.
* Divide _job timetable_ from job entity so that you can configure one job to run on multiple schedulings.
* **Semaphore** or **Mutex** for job execution so that you can avoid a long-time job to run coincidently.
* Concept of **job timeout**. When _semphore_ or _mutex_ is implemented, a job must free it after job finishes.
But a job might fail without cleaning it up properly.  
So after some time, it's prefered to assume the job failed.
Then let's call that time _Timeout_.

## LICENSE

Copyright (C) YASUTAKE Kiyoshi.

This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

## AUTHOR

YASUTAKE Kiyoshi yasutake.kiyoshi@gmail.com