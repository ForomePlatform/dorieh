from setuptools import setup, find_packages

find_packages()
with open("README.md", "r") as readme:
    long_description = readme.read()


setup(
    name='dorieh',
    version="0.2.3",
    url='https://github.com/NSAPH-Data-Platform/dorieh',
    license='Apache 2.0',
    author='Michael A Bouzinier',
    author_email='mbouzinier@g.harvard.edu',
    description='Dorieh Data Engineering Platform',
    long_description = long_description,
    long_description_content_type = "text/markdown",
    include_package_data = True,
    entry_points={
        'console_scripts': [
            'cwl2md=dorieh.docutils.cwl2md:main',
            'mkpgpass=dorieh.platform.util.pgpass:main',
            'copy_section=dorieh.docutils.copy_section:main',
            'collector=dorieh.docutils.collector:main',
            'dorieh_version=dorieh.version:main',
            'validate_domain=dorieh.platform.loader.validator:main'
        ],
    },
    packages=find_packages(where='./src/python') + [
        'dorieh.resources',
        'dorieh.sql',
        'dorieh.cwl',
        'dorieh.workflows'
    ],
    package_dir={
        "dorieh": "./src/python/dorieh",
        "dorieh.sql": "./src/sql",
        "dorieh.resources": "./resources",
        "dorieh.cwl": "./src/cwl",
        "dorieh.workflows": "./src/workflows"
    },
    package_data = {
        "dorieh": ["**/*.yaml", "**/*.yml"],
        "dorieh.sql": ["*.sql"],
        "dorieh.resources": ["**/*", "*/*/*", "*/*/*/*"],
        "dorieh.cwl": ["*.cwl"],
        "dorieh.workflows": ["*.cwl"],
        "dorieh.gis": ["data/*.csv"]
    },
    install_requires=[
        'argcomplete>=1.12.1',
        'boto3',
        'certifi>=2023.7.22',
        'cwltest>=2.0.20200626112502',
        'cwltool>=3.0.20200710214758',
        'deprecated',
        'geopandas',
        'geopy',
        'GitPython',
        'googlesearch-python',
        'graphviz>=0.14.2',
        'h5py',
        'hydra-core',
        'humanfriendly>=8.2',
        'importlib-metadata>=2.0.0',
        'isodate>=0.6.0',
        'Markdown>=2.6.11',
        'marko',
        'MarkupSafe>=1.1.1',
        'mypy-extensions>=0.4.3',
        'myst-parser',
        'netCDF4',
        "numpy",
        "openpyxl",
        'pandas',
        'paramiko',
        'pyarrow',
        'psutil>=5.7.2',
        'psycopg2-binary>=2.8.6',
        'pygeos',
        'PyGithub',
        'pyresourcepool',
        'pyshp',
        "pytest",
        'python-dateutil>=2.8.1',
        'PyYAML>=5.3.1',
        "rasterstats",
        'requests',
        'rioxarray',
        "rtree",
        'ruamel.yaml>=0.16.5',
        'ruamel.yaml.clib>=0.2.2',
        'sas7bdat',
        'schema-salad>=7.0.20200811075006',
        'setproctitle>=1.1.10',
        "shapely",
        'shellescape>=3.4.1',
        'six>=1.15.0',
        'sortedcontainers',
        'sphinx',
        'sphinx_paramlinks',
        'sphinx_rtd_theme',
        'sqlparse',
        "tqdm",
        'typing-extensions',
        'tzlocal>=1.5.1',
        'unicodecsv>=0.14.1',
        'urllib3>=1.25.11',
        'websocket-client>=0.57.0',
        'sshtunnel',
        'xarray',
        'xlrd'
    ],
    extras_require = {
        "FST": [
            'rpy2',
        ]
    },
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: Apache Software License",
        "Operating System :: OS Independent",
    ]
)
