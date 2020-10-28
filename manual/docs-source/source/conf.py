# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#
import os
import sys
# sys.path.insert(0, os.path.abspath('.'))

sys.path.insert(0, os.path.abspath('../..'))
import sphinx_rtd_theme

# -- Project information -----------------------------------------------------

project = 'Cloudmesh'
copyright = '2010-2020, Gregor von Laszewski'
author = 'Gregor von Laszewski and the Cloudmeh Community'

# The full version, including alpha/beta/rc tags
release = '0.1'
# The short X.Y version
version = '4.3.0'
# The full version, including alpha/beta/rc tags


# -- General configuration ---------------------------------------------------

extensions = [
    "sphinx_rtd_theme",
    'IPython.sphinxext.ipython_console_highlighting',
    'IPython.sphinxext.ipython_directive',
    'sphinxcontrib.mermaid',
    'sphinxcontrib.images',
#    'sphinx_gallery.gen_gallery',
]

templates_path = ['_templates']

exclude_patterns = []


# -- Options for HTML output -------------------------------------------------

#html_theme = 'alabaster'

#import rtcat_sphinx_theme
#html_theme = "rtcat_sphinx_theme"
#html_theme_path = [rtcat_sphinx_theme.get_html_theme_path()]


html_theme_options = {
    'canonical_url': '',
    # 'analytics_id': 'UA-XXXXXXX-1',  #  Provided by Google in your dashboard
    'logo_only': False,
    'display_version': True,
    'prev_next_buttons_location': 'bottom',
    'style_external_links': False,
    #'vcs_pageview_mode': '',
    # 'style_nav_header_background': 'white',
    # Toc options
    'collapse_navigation': True,
    'sticky_navigation': True,
    'navigation_depth': 4,
    'includehidden': True,
    'titles_only': False
}


html_logo = "icons/logo3.png"
html_favicon = 'icons/favicon.ico'
html_theme = "sphinx_rtd_theme"
html_theme_path = [sphinx_rtd_theme.get_html_theme_path()]
html_theme = "sphinx_rtd_theme"

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['_static']

#sphinx_gallery_conf = {
#     'examples_dirs': '../examples',   # path to your example scripts
#     'gallery_dirs': 'auto_examples',  # path to where to save gallery generated output
#}

images_config = {
    'override_image_directive': True
#    'default_show_title': True
}
