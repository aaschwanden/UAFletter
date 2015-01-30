Letter heads for the University of Alaska Fairbanks and its Geophysical Institute
=================================================================================

This provides two classes, [UAFletter.cls] and [GIletter.cls], which
only differ in their respective logos. 

The classes are based on the [ETHbrief package](http://www.sg.ethz.ch/downloads/LaTeX).

The style file `EXAMPLE.sty` provides an example style file for these classes and is 
where your personal information gets stored. You should coppy it to `YOURNAME.sty` and
edit it to reflect your details (e.g. address, phone number).

To invoke the GI letter:

```latex
\documentclass[english]{GIletter}
\usepackage{YOURNAME}
```

and for UAF letter:

```latex
\documentclass[english]{UAFletter}
\usepackage{YOURNAME}
```


Andy Aschwanden, University of Alaska Fairbanks
