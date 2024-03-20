# mozilla-central-test-xpis

This repository contains the unpacked test XPI files that we're using in
[mozilla-central][].

There is a script to make a ZIP file for each unpacked add-on, which is probably
only useful when these add-ons have to be resigned and updated in tree.

```
./make_zip_files.sh
```

The ZIP files will be created in `dist/`.

## License

Public Domain, see [LICENSE.md](./LICENSE.md) file.

[mozilla-central]: https://hg.mozilla.org/mozilla-central
