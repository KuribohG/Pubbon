from setuptools import setup, Extension

metadata = dict(
    name='pubbon',
    package={
        'pubbon',
    },
    ext_modules=[
        Extension(name='pubbon',
                  sources=['Pubbon/pubbon.cpp'])
    ],
    license='BSD',
)

setup(**metadata)
