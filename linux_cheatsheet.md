# linux cheat sheet

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)



## memory 
 - Clear PageCache only:
   ```sh
   sync; echo 1 > /proc/sys/vm/drop_caches
   ```
 - Clear dentries and inodes.
   ```sh
   sync; echo 2 > /proc/sys/vm/drop_caches
   ```
 - Clear PageCache, dentries and inodes.
   ```sh
   sync; echo 3 > /proc/sys/vm/drop_caches 
   ```

## host preparation
[plugins/onedrive/README.md][PlOd] |
| Medium | [plugins/medium/README.md][PlMe] |
| Google Analytics | [plugins/googleanalytics/README.md][PlGa] |
