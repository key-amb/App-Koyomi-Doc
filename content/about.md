+++
categories = ["general"]
date = "2015-06-07T00:29:01+09:00"
tags = ["document"]
title = "About"

+++

## VERSION

_v0.4.2_

## REQUIREMENTS

You need Perl interpreter whose version is greater than or equal to _v5.10.1_.

This program is expected to run on almost UNIX like systems.  
But not expected to run on Windows. Because this program use _fork(2)_ of UNIX and POSIX _signal(2)_, there may be problems on running it.

## MILESTONE

Here are what I plan to implement to _Koyomi_ towards **_v1.0.0_**:

* **Semaphore** or **Mutex** for job execution so that you can avoid a long-time job to run coincidently.
* Concept of **job timeout**. When _semphore_ or _mutex_ is implemented, a job must free it after job finishes.
But a job might fail without cleaning it up properly.  
So after some time, it's prefered to assume the job failed.
Then let's call that time _Timeout_.
* Support for a few datasource types more.

## CHANGES

See [Changes](https://github.com/key-amb/perl5-App-Koyomi/blob/master/Changes) on the repository.

## LICENSE

Copyright (C) YASUTAKE Kiyoshi.

This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

See [LICENSE](https://github.com/key-amb/perl5-App-Koyomi/blob/master/LICENSE) file.

## AUTHOR

YASUTAKE Kiyoshi yasutake.kiyoshi@gmail.com