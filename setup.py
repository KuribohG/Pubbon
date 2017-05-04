from setuptools import setup, Extension
from os import popen

cxxflags = popen('llvm-config --cxxflags').readline().split()
ldflags = popen('llvm-config --ldflags').readline().split()
libs = popen('llvm-config --libs all').readline().split()\
     + popen('llvm-config --system-libs').readline().split()

includeDirs = []
libraryDirs = []
defineMacros = []
extraCompileArgs = []

for f in cxxflags:
    if f.startswith('-I'):
        includeDirs.append(f[2:])
    elif f.startswith('-D'):
        defineMacros.append((f[2:], None))
    else:
        extraCompileArgs.append(f)

for f in ldflags:
    if f.startswith('-LIBPATH:'):
        libraryDirs.append(f[9:])
    elif f.startswith('-L'):
        libraryDirs.append(f[2:])

metadata = dict(
    name='pubbon',
    package={
        'pubbon',
    },
    ext_modules=[
        Extension(name='pubbon',
                  sources=['Pubbon/pubbon.cpp', 'Pubbon/translate.cpp'],
                  include_dirs=includeDirs,
                  library_dirs=libraryDirs,
                  define_macros=defineMacros,
                  extra_objects=libs,
                  extra_compile_args=extraCompileArgs)
    ],
    license='BSD',
)

setup(**metadata)
