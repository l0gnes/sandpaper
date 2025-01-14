from os import PathLike
from fastapi import FastAPI
from fastapi_swagger2 import FastAPISwagger2
import importlib
import click
import sys
import json

def import_from_string(module_path : str, instance_path : str) -> FastAPI:

    try:
        module = importlib.import_module(module_path)
    except ModuleNotFoundError as exc:
        if exc.name != module_path:
            raise exc from None
        raise ValueError("Failed to find module") from exc

    instance = module
    try:
        for attr_str in instance_path.split("."):
            instance = getattr(instance, attr_str)
    except AttributeError as err:
        raise ValueError("Failed to find FastAPI instance") from err

    return instance

@click.command()
@click.argument('module_path')
@click.argument('instance_path')
@click.option("-D", "--destination", default="./swagger2.json", help="Where the produced file will be exported")
def swagger2(module_path : str, instance_path : str, destination : PathLike):

    # You make me want to fucking kill myself
    sys.path.insert(0, ".")

    instance = import_from_string(
        module_path=module_path, instance_path=instance_path)

    if not isinstance(instance, FastAPI):
        raise ValueError("What")
    
    if instance is None:
        raise ValueError("What")
    
    exported = FastAPISwagger2(app=instance).swagger2()

    with open(destination, 'w+') as export_file:
        json.dump(
            exported,
            export_file,
            indent=4
        )

    click.echo("Swagger 2.0 Spec exported")
        

if __name__ == "__main__":
    swagger2()