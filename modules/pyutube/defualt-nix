{ lib
, python
, fetchFromGitHub
, pytubefix   # dependency on pytubefix
, setuptools  # typical build-time dependency
}:

python.buildPythonPackage rec {
  pname = "pyutube";
  version = "1.3.38";

  src = fetchFromGitHub {
    owner = "Hetari";
    repo = "pyutube";
    rev = "v${version}";
    # You'd need to fill in the correct sha256 for this revision
    sha256 = "0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
  };

  nativeBuildInputs = [ setuptools ];

  propagatedBuildInputs = [ pytubefix ];

  doCheck = false; # enable if the package includes tests; else false

  meta = with lib; {
    description = "The simplest YouTube downloader CLI built on top of pytubefix";
    homepage = "https://github.com/Hetari/pyutube";
    license = licenses.mit;
    platforms = platforms.linux ++ platforms.darwin;
    maintainers = [];
  };
}
