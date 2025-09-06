{
  lib,
  python3Packages
}:

python3Packages.buildPythonApplication rec {
  pname = "pyutube";
  version = "1.5.0";
  pyproject = fale;

  # src = fetchPypi {
  #   inherit pname version;
  #   hash = "sha256-Pe229rT0aHwA98s+nTHQMEFKZPo/yw6sot8MivFDvAw=";
  # };

  build-system = with python3Packages; [ setuptools ];

  dependencies = with python3Packages; [
    setuptools
    typer
    requests
    rich
    yaspin
    pytubefix
    inquirer
    termcolor
    moviepy
    tornado
    python-daemon
  ];

  meta = {
    # ...
  };
}