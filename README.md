Faust-Example Docker
===============

Example running Faust with Docker and dynamic configurations. 

Read more about Faust here: 
https://github.com/robinhood/faust

Configurable...Configs (explained poorly)
------------------------------------------

By configuring different entrypoints in `setup.py`, you can define config classes that hold important settings you need
to use in your Faust processor. 

e.g. in this example, we have 2 classes defined by 2 entrypoints, `video` and `channel`. By passing one of those to the
Faust cli as an environment variable, we can then load that config class in our `app.py` code and get access to whichever necessary settings.

Example: `CONFIG=video faust -A example.app worker -lINFO` (see run.sh for how it's used with Docker.)

Then in `app.py` we call a special function `load_config` that uses the pkg_resources library to load this class that we defined
as an entrypoint in `setup.py`. Simply initialize that class that's returned and you have access to whatever settings you need. 

Extending Docker: 
----------------

There's an example Dockerfile here that defines some environment variables toward the end, and defines `run.sh` as the
command that gets called with `docker run`. 

After building the docker image, you can specify which config class to load like so: 
`docker run -e WORKER=example.app -e WORKER_PORT=6066 -e CONFIG=video faust-example:{tag}`
