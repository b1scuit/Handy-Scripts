from setuptools import setup, find_packages


with open('README.md') as f:
    readme = f.read()

with open('LICENSE') as f:
    license = f.read()

setup(
    name='mysqlDir',
    version='0.0.1',
    description='Sample package example',
    long_description=readme,
    author='B1scuit',
    author_email='dysvir@gmail.com',
    url='https://github.com/B1scuit/Python/MySQLDir',
    license=license,
    packages=find_packages(exclude=('tests', 'docs'))
)
