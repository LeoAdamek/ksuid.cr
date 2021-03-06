KSUID
=====

K-Sortable Unique Identifer (KSUID) generation for Crystal. It has no external dependencies.

Installation
------------

Add the following to your `shards.yml`

````yaml
dependencies:
    ksuid:
        github: leoadamek/ksuid
````

Usage
-----

Create a generator...

````crystal
require "ksuid"

g = Ksuid::Generator.new
````

...and use it to create KSUIDs:

````crystal
k = g.generate
````

Each KSUID has a total of 96-bits of data, so can be stored either as a string, or as a `UInt128`

Partitioning
------------

This library supports partitioning KSUIDs, the most common use-case is to partition KSUIDs generated by different network nodes to
prevent colissions in a distributed system.

Any `Proc(UInt32)` can be used to partition data.

The following partitioning functions are provided:

* `Ksuid::Partitioner.no_partitions` — Does not partition data, all KSUIDs are in partition zero.
* `Ksuid::Partitioner.hostname` — Partitions KSUIDs by the first 4 bytes of the system hostname. 
  Ideal for containerized environments where hostname is guaranteed to be unique amoung active hosts.
* `Ksuid::Partitioner.string(String)` — Partitions KSUIDs by the first 4 bytes of any given string.

Benchmarks
----------

All tests performed on an i7-4770S @ 3.9GHz, single thread.

### Partitioning Functions

All included partitioning functions are pure, and will return the same value each time. `Proc(UInt32)` is used to provide the option of using impure partitioning functions if required.

              calls/s      avg.      dev.     rel speed.
        none: 458.18M (  2.18ns) (± 5.04%)  1.16× slower  
    hostname: 530.06M (  1.89ns) (± 4.39%)  1.00× slower
      string: 532.38M (  1.88ns) (± 3.88%)       fastest

### Encoding Functions

       to_s:   3.88M (257.94ns) (± 9.78%)  157.97× slower     
    to_u128: 612.44M (  1.63ns) (± 4.56%)         fastest 

### Generation

    generate: 501.66k (  1.99µs) (± 3.18%)
