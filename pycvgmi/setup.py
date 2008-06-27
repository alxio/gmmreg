from distutils.core import setup, Extension

module_pycvgmi = Extension('pycvgmi',
                     define_macros = [('MAJOR_VERSION', '1'),
                                      ('MINOR_VERSION', '0')],
                     sources = ['pycvgmi.c','GaussTransform.c','DistanceMatrix.c'])

setup (name = 'pycvgmi',
              version = '1.0',
              description = 'This is a python extension package of some C/C++ API functions developed in CVGMI group.',
              author = 'Bing Jian',
              author_email = 'bing.jian@gmail.com',
              url = 'http://www.cise.ufl.edu/research/cvgmi/',
              long_description = '''
              This is a python extension package of some C/C++ API functions developed in CVGMI group.
              ''',
              ext_modules = [module_pycvgmi])
