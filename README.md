# Dissertation template
This repo presents a LaTeX template design for dissertations. It is based on the template by [Editorial UPV](https://editorialupv.webs.upv.es/) and it was created for the Ph.D.'s thesis [Some Contributions to Interactive Machine Translation and to the Applications of Machine Translation for Historical Documents.](https://mdomingo.me/documents/PhDdissertation.pdf).

## Usage
`dissertation.tex` contains an example to guide you on how to write a dissertation using this template. See [dissertation.pdf](dissertation.pdf) for a detailed guide.

## Requirements
By default, this document uses some fonts that are not available by default in all distributions. Therefore, you need to manually copy them to your system:

```
cp fonts/qualitype:/usr/share/fonts/opentype/qualitype/
cp fonts/plex:/usr/share/fonts/opentype/plex/
cp fonts/math:/usr/share/fonts/opentype/math/
```

Alternatively, you can compile the document through [Docker](#docker).

## Compilation
You can compile the document using the `Makefile`:

```
make
```

and clean the auxiliary files by doing:

```
make clean
```

## Docker
As an alternative to the two previous steps, you can build the document using docker-compose:

```
docker-compose up
```

Note: building the image takes quite a lot of time.
