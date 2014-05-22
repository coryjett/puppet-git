#git module

The module installs git from sources. Source code is downloaded from googlecode:

* http://git-core.googlecode.com/files/git-1.8.5.2.tar.gz
* http://git-core.googlecode.com/files/git-1.9.0.tar.gz

In future versions we will use shallow clone:

    git clone -b v1.9.3 --depth 1 git://git.kernel.org/pub/scm/git/git.git

