from setuptools import setup, Extension
from os import popen

cxxflags = popen('llvm-config --cxxflags').readline().split()
ldflags = popen('llvm-config --ldflags').readline().split()
libs = popen('llvm-config --libs all').readline().split()

metadata = dict(
    name='pubbon',
    package={
        'pubbon',
    },
    ext_modules=[
        Extension(name='pubbon',
                  sources=['Pubbon/pubbon.cpp', 'Pubbon/translate.cpp'],
                  include_dirs=[f[2:] for f in cxxflags if f.startswith('-I')],
                  library_dirs=[f[2:] for f in ldflags if f.startswith('-L')],
                  define_macros=[(f[2:], None) for f in cxxflags if f.startswith('-D')],
                  extra_objects=libs,
                  extra_compile_args=['-std=c++14'])
    ],
    license='BSD',
)

setup(**metadata)
