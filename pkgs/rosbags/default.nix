{ lib
, buildPythonPackage
, python3Packages
, fetchPypi
  # , setuptools
  # , numpy
  # , lz4
  # , ruamel-yaml
  # , ruamel-yaml-clib
  # , zstandard
, wheel
}:

# { pkgs ? import <nixpkgs> { } }:

pkgs.python3Packages.buildPythonPackage rec {
  pname = "rosbags";
  version = "0.9.10";

  pyproject = true;
  format = "pyproject";

  src = pkgs.fetchPypi {
    inherit pname version;
    sha256 = "sha256-WJP9X+NyBZg5aT3eUoIIYF6YOeCfpeVsUC9UKw+sHoM=";
  };

  propagatedBuildInputs = with python3Packages;[
    setuptools
    numpy
    lz4
    ruamel-yaml
    ruamel-yaml-clib
    zstandard
  ];

  meta = with pkgs.lib; {
    description = "Rosbags is the pure python library for handingle ROS1 and ROS2 rosbags files.";
    homepage = "https://gitlab.com/ternaris/rosbags";
    license = licenses.asl20;
    maintainers = with maintainers; [ mjpc13 ];
  };
}
