# How to update the VM release

Once a [new release](https://github.com/pharo-project/opensmalltalk-vm/releases)
of the Pharo VM was produced:

- Lookup for the corresponding commit hash in the release page
- Go to <https://files.pharo.org/vm/pharo-spur64-headless/Linux-x86_64/>
- Locate the zip file corresponding to the commit hash. It will have a name like
  `PharoVM-{{version}}-{{commit_hash}}-Linux-x86_64-bin.zip`
- Update the `Dockerfile` in the `source` folder to download the new zip
