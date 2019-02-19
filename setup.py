import os

from setuptools import setup, find_packages

here = os.path.abspath(os.path.dirname(__file__))

requires = [
    "avro-python3",
    "boto3",
    "colorlog==3.1.4",
    "fastavro",
    "faust==1.4.2",
    "keras",
    "langdetect",
    "matplotlib",
    "nltk",
    "numpy",
    "pandas",
    "robinhood-aiokafka>=0.4.19,<0.5.0",
    "rollbar",
    "seaborn",
    "sklearn",
    "tensorflow",
]

setup(
    name='faust-example',
    version='0.0.1',
    description='Faust example with Docker',
    long_description='''
    Example running Faust with Docker containers
    ''',
    classifiers=[
        "Programming Language :: Python",
    ],
    author='Ryan Whitten',
    author_email='rwhitten577@gmail.com',
    url='',
    packages=find_packages(),
    include_package_data=True,
    zip_safe=False,
    install_requires=requires,
    tests_require=[],
    setup_requires=[],
    dependency_links=[],
    entry_points={
        'configs': [
            'video = example.video_config:VideoConfig',
            'channel = example.channel_config:ChannelConfig',
        ]
    }
)
