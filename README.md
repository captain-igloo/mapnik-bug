The following fails to compile under ubuntu noble.  The error is "error: conflicting declaration 'using PJ_CONTEXT = struct projCtx_t'".  Is this a problem with mapnik or with the ubuntu package?

```
#include <proj.h>
#include <mapnik/map.hpp>

int main() {
    return 0;
}
```


```
$ git clone https://github.com/captain-igloo/mapnik-bug.git

$ cd mapnik-bug

$ docker build -t noble  -f Dockerfile  .

$ docker run noble g++ main.cpp

In file included from /usr/include/mapnik/proj_transform.hpp:29,
                 from /usr/include/mapnik/map.hpp:36,
                 from main.cpp:2:
/usr/include/mapnik/projection.hpp:46:7: error: conflicting declaration 'using PJ_CONTEXT = struct projCtx_t'
   46 | using PJ_CONTEXT = struct projCtx_t;
      |       ^~~~~~~~~~
In file included from main.cpp:1:
/usr/include/proj.h:387:23: note: previous declaration as 'typedef struct pj_ctx PJ_CONTEXT'
  387 | typedef struct pj_ctx PJ_CONTEXT;
```
