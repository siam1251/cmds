```
site: abc.com search item   

search word1 word2 -word3 // exclude word3

```

after

```
serch word1 word2 after:2015
search word1 word2 2013..2015
search word1 word2 before:2013
```

wildcard and filetype     

```
size: *.com search item
hel* 
```

And or condition    
```
(search1|search2) search3
```

Related     
```
RELATED:cpp.com
```
CACHE:cpp.com
