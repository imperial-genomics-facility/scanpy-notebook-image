from datetime import datetime
project = 'RNA-Seq notebook'
author = 'IGF'
copyright = f'{datetime.now():%Y}, {author}'

version = ''
release = version

extensions = [
    'nbsphinx',
]

templates_path = ['_templates']
source_suffix = '.rst'
master_doc = 'index'
language = None
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store', '**.ipynb_checkpoints']
pygments_style = 'sphinx'

# -- Options for HTML output ----------------------------------------------

html_theme = "sphinx_rtd_theme"
html_theme_options = {
    'display_version': False,
    'prev_next_buttons_location': 'bottom',
    'style_external_links': False,
    'vcs_pageview_mode': '',
    'style_nav_header_background': 'white',
    # Toc options
    'collapse_navigation': False,
    'sticky_navigation': True,
    'navigation_depth': 4,
    'includehidden': True,
    'titles_only': False,
    'conf_py_path':'/',
}

# -- Strip output ----------------------------------------------

#import nbclean, glob#
#
#for filename in glob.glob('examples/*.ipynb', recursive=True):
#    ntbk = nbclean.NotebookCleaner(filename)
#    ntbk.clear('stderr')
#    ntbk.save(filename)
