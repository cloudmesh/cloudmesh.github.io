Docker
======

.. mermaid::


   graph TD
      A(Prerequits) --> docker
      A -->python
      subgraph Python

      python(Python 3.7 or 3.8)
      python --> pip(pip >20.0)
      pip --> venv(venv)
      venv --> I(pip install cmsd)
      I --> cms(cmsd help)

    end
      A --> xcode(X code)
      xcode --> keygen(ssh keygen)
      keygen --> key[fa:fa-key Key]
      docker --> I
      key --> I
