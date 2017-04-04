from setuptools import setup, Extension

metadata = dict(
    name='pubbon',
    package={
        'pubbon',
    },
    ext_modules=[
        Extension(name='pubbon.pyjit',
                  sources=['Pubbon/pyjit.cpp'])
    ],
    license='BSD',
)

setup(**metadata)
